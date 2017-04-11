package gov.va.cpe.vpr.sync.msg;

import com.codahale.metrics.MetricRegistry;
import com.codahale.metrics.Timer;
import com.google.common.collect.ImmutableMap;
import gov.va.cpe.idn.PatientIds;
import gov.va.cpe.odc.Person;
import gov.va.cpe.vpr.IBroadcastService;
import gov.va.cpe.vpr.dao.IVprSyncStatusDao;
import gov.va.cpe.vpr.sync.ISyncService;
import gov.va.cpe.vpr.sync.SyncStatus;
import gov.va.cpe.vpr.sync.vista.VistaDataChunk;
import gov.va.vlerdas.IVlerDasPatientService;
import gov.va.vlerdas.VlerDasPatientService;
import org.junit.Before;
import org.junit.Test;
import org.mockito.ArgumentCaptor;
import org.mockito.Mockito;
import org.springframework.jms.support.converter.SimpleMessageConverter;

import javax.jms.JMSException;
import javax.jms.Message;
import javax.jms.Session;
import java.util.*;

import static gov.va.cpe.vpr.pom.POMUtils.convertObjectToNode;
import static org.hamcrest.CoreMatchers.is;
import static org.junit.Assert.*;
import static org.mockito.Matchers.anyObject;
import static org.mockito.Matchers.anyString;
import static org.mockito.Mockito.*;
import org.slf4j.Logger;

public class SyncDasMessageHandlerTest {

    private static final gov.va.cpe.vpr.sync.SyncStatus SYNCSTATUS_WITH_DAS_SITE = new SyncStatus() {{
        addSite("uid", "dfn", SyncDasMessageHandler.SITE_ID);
    }};

    private IVlerDasPatientService mockVlerDasPatientService;
    private ISyncService syncService;
    private SyncDasMessageHandler handler;
    private SimpleMessageConverter converter;
    private MetricRegistry metrics;
    private IVprSyncStatusDao syncStatusDao;
    private IBroadcastService broadcastService;
    private Logger mockLogger;

    @Before
    public void setUp() {
        mockVlerDasPatientService = mock(IVlerDasPatientService.class);
        syncService = mock(ISyncService.class);
        converter = mock(SimpleMessageConverter.class);
        metrics = mock(MetricRegistry.class);
        syncStatusDao = mock(IVprSyncStatusDao.class);
        broadcastService = mock(IBroadcastService.class);
        mockLogger = mock(Logger.class);

        handler = new SyncDasMessageHandler();
        handler.setDasPatientService(mockVlerDasPatientService);
        handler.setSyncService(syncService);
        handler.setMessageConverter(converter);
        handler.setMetricRegistry(metrics);
        handler.setSyncStatusDao(syncStatusDao);
        handler.setBroadcastService(broadcastService);
        handler.setLogger(mockLogger);
    }

    private PatientIds getPatientIds() {
        String vistaId = "9E7A";
        String icn = "123456789";
        String dfn = "4321";
        String pid = vistaId +";"+ dfn;
        String uid = "urn:va:patient:"+vistaId+":"+ dfn +":"+ icn;
        String edipi = "0000000001";

        return new PatientIds.Builder()
                .pid(pid)
                .icn(icn)
                .edipi(edipi)
                .uid(uid)
                .build();
    }

    private static Person getPerson(String uid) {
        Map<String, Object> data = new HashMap<>();
        data.put("uid", uid);
        Person person = new Person(data);
        return person;
    }

    private List<VistaDataChunk> getChunks(final String uid, final String domain) {
        return new ArrayList<VistaDataChunk>() {{
            add(VistaDataChunk.createVistaDataChunk("ABCD", "/foo/bar", convertObjectToNode(getPerson(uid)), domain, 0, 1));
        }};
    }

    @Test
    public void testOnMessage() throws JMSException {
        String domain = "person";
        Map message = ImmutableMap
                .builder()
                .put("patientIds", this.getPatientIds().toMap())
                .build();
        Session mockSession = Mockito.mock(Session.class);
        Message mockMessage = Mockito.mock(Message.class);
        when(mockVlerDasPatientService.fetchVlerDasPatientData((PatientIds) anyObject())).thenReturn(this.getChunks(this.getPatientIds().getUid(), domain));
        when(converter.fromMessage(mockMessage)).thenReturn(message);
        when(metrics.timer(anyString())).thenReturn(new Timer());
        when(syncStatusDao.findOneByPid(anyString())).thenReturn(SYNCSTATUS_WITH_DAS_SITE);
        when(syncStatusDao.saveMergeSyncStatus(any(SyncStatus.class))).thenReturn(new SyncStatus());

        handler.onMessage(mockMessage, mockSession);
        ArgumentCaptor<VistaDataChunk> vistaDataChunkArgumentCaptor = ArgumentCaptor.forClass(VistaDataChunk.class);

        verify(syncService, times(1)).sendImportVistaDataExtractItemMsg(vistaDataChunkArgumentCaptor.capture());
        assertThat(vistaDataChunkArgumentCaptor.getValue().getDomain(), is(domain));
    }

    @Test(expected=IllegalStateException.class)
    public void testOnMessageFailure() throws JMSException {
        String domain = "person";
        Map message = ImmutableMap
                .builder()
                .put("patientIds", this.getPatientIds().toMap())
                .build();
        Session mockSession = Mockito.mock(Session.class);
        Message mockMessage = Mockito.mock(Message.class);
        when(mockVlerDasPatientService.fetchVlerDasPatientData((PatientIds) anyObject())).thenReturn(this.getChunks(this.getPatientIds().getUid(), domain));
        when(converter.fromMessage(mockMessage)).thenReturn(message);
        when(metrics.timer(anyString())).thenReturn(new Timer());
        when(syncStatusDao.findOneByPid(anyString())).thenReturn(new SyncStatus());
        when(syncStatusDao.saveMergeSyncStatus(any(SyncStatus.class))).thenReturn(new SyncStatus());

        handler.onMessage(mockMessage, mockSession);
    }

    @Test
    public void testFetchVlerData() {
        PatientIds patientIds = getPatientIds();

        VistaDataChunk dataChunk = new VistaDataChunk();
        dataChunk.setContent("test.content");
        List<VistaDataChunk> vistaDataChunkList = Arrays.asList(dataChunk);

        Mockito.when(mockVlerDasPatientService.fetchVlerDasPatientData((PatientIds) Mockito.anyObject())).thenReturn(vistaDataChunkList);

        List<VistaDataChunk> resp = handler.fetchData(patientIds);

        assertNotNull(resp);
        assertThat(resp.size(), is(1));
        assertThat(resp.get(0).getContent(), is(dataChunk.getContent()));

        //test null response
        Mockito.when(mockVlerDasPatientService.fetchVlerDasPatientData((PatientIds) Mockito.anyObject())).thenReturn(null);

        List<VistaDataChunk> resp2 = handler.fetchData(patientIds);

        assertEquals(0, resp2.size());

        //test illegal arguments
        patientIds.setEdipi("");
        patientIds.setIcn("");
        VlerDasPatientService realVlerDasPatientService = new VlerDasPatientService();

        handler.setDasPatientService(realVlerDasPatientService);

        List<VistaDataChunk> vistaDataChunks = handler.fetchData(patientIds);
        assertThat(vistaDataChunks.size(), is(0));

        handler.setDasPatientService(mockVlerDasPatientService);
    }
}
