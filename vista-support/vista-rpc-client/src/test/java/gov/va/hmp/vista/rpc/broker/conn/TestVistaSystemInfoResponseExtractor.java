package gov.va.hmp.vista.rpc.broker.conn;

import gov.va.hmp.vista.rpc.RpcResponse;
import gov.va.hmp.vista.util.VistaStringUtils;
import org.junit.Test;

import static org.junit.Assert.*;

public class TestVistaSystemInfoResponseExtractor {

    @Test
    public void extractVistaSystemInfo() throws Exception {
        VistaSystemInfoResponseExtractor e = new VistaSystemInfoResponseExtractor();

        VistaSystemInfo systemInfo = e.extractData(new RpcResponse("vhaislbll2.vha.domain.ext\r\nDEV\r\nDEV\r\n/dev/null:26294\r\n5\r\n0\r\nEDIS-DEV.FO-SLC.DOMAIN.EXT\r\n0\r\n"));
        assertEquals("vhaislbll2.vha.domain.ext", systemInfo.getServer());
        assertEquals("DEV", systemInfo.getVolume());
        assertEquals("DEV", systemInfo.getUCI());
        assertEquals("/dev/null:26294", systemInfo.getDevice());
//        systemInfo.getNumberOfAttempts();
        // systemInfo.getSkipSignon
        assertEquals("EDIS-DEV.FO-SLC.DOMAIN.EXT", systemInfo.getDomainName());
        assertFalse(systemInfo.isProductionAccount());

        assertEquals(VistaStringUtils.crc16Hex("EDIS-DEV.FO-SLC.DOMAIN.EXT"), systemInfo.getVistaId());

        // this is set by BrokerConnection after another rpc call
        assertNull(systemInfo.getIntroText());
    }
}
