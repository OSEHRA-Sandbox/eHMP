package org.opencds.config.mapper;

import java.util.ArrayList;
import java.util.List;

import org.opencds.common.utilities.XMLDateUtility;
import org.opencds.config.api.model.SupportingData;
import org.opencds.config.api.model.impl.KMIdImpl;
import org.opencds.config.api.model.impl.PluginIdImpl;
import org.opencds.config.api.model.impl.SupportingDataImpl;
import org.opencds.config.schema.KMId;
import org.opencds.config.schema.PluginId;
import org.opencds.config.schema.SupportingDataList;

public abstract class SupportingDataMapper {

    public static SupportingData internal(org.opencds.config.schema.SupportingData external) {
        if (external == null) {
            return null;
        }
        org.opencds.config.schema.Package pkg = external.getPackage();
        String pkgType = null;
        String pkgId = null;
        if (pkg != null) {
            pkgType = pkg.getPackageType();
            pkgId = pkg.getPackageId();
        }
        org.opencds.config.api.model.KMId kmId = null;
        if (external.getKmId() != null) {
            kmId = KMIdImpl.create(external.getKmId().getScopingEntityId(), external.getKmId().getBusinessId(),
                    external.getKmId().getVersion());
        }
        return SupportingDataImpl.create(external.getIdentifier(), kmId, pkgType, pkgId, PluginIdImpl.create(external
                .getLoadedBy().getScopingEntityId(), external.getLoadedBy().getBusinessId(), external.getLoadedBy()
                .getVersion()), external.getTimestamp().toGregorianCalendar().getTime(), external.getUserId());

    }

    public static List<SupportingData> internal(SupportingDataList external) {
        List<SupportingData> internal = new ArrayList<>();
        for (org.opencds.config.schema.SupportingData sd : external.getSupportingData()) {
            internal.add(internal(sd));
        }
        return internal;
    }

    public static org.opencds.config.schema.SupportingData external(org.opencds.config.api.model.SupportingData internal) {
        if (internal == null) {
            return null;
        }
        org.opencds.config.schema.SupportingData external = new org.opencds.config.schema.SupportingData();

        external.setIdentifier(internal.getIdentifier());
        KMId externalKMId = null;
        if (internal.getKMId() != null) {
            externalKMId = new KMId();
            externalKMId.setBusinessId(internal.getKMId().getBusinessId());
            externalKMId.setScopingEntityId(internal.getKMId().getScopingEntityId());
            externalKMId.setVersion(internal.getKMId().getVersion());
        }
        external.setKmId(externalKMId);
        org.opencds.config.schema.Package pkg = new org.opencds.config.schema.Package();
        pkg.setPackageId(internal.getPackageId());
        pkg.setPackageType(internal.getPackageType());
        external.setPackage(pkg);
        PluginId plg = new PluginId();
        plg.setScopingEntityId(internal.getLoadedBy().getScopingEntityId());
        plg.setBusinessId(internal.getLoadedBy().getBusinessId());
        plg.setVersion(internal.getLoadedBy().getVersion());
        external.setLoadedBy(plg);
        external.setTimestamp(XMLDateUtility.date2XMLGregorian(internal.getTimestamp()));
        external.setUserId(internal.getUserId());

        return external;
    }

    public static SupportingDataList external(List<SupportingData> supportingDataInternal) {
        if (supportingDataInternal == null) {
            return null;
        }
        SupportingDataList externalSDList = new SupportingDataList();
        for (SupportingData internalSD : supportingDataInternal) {
            externalSDList.getSupportingData().add(external(internalSD));
        }
        return externalSDList;
    }

}
