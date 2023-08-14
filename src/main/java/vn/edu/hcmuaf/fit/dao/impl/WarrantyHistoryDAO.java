package vn.edu.hcmuaf.fit.dao.impl;

import vn.edu.hcmuaf.fit.dao.AbstractDAO;
import vn.edu.hcmuaf.fit.model.VoucherType;
import vn.edu.hcmuaf.fit.model.WarrantyHistory;

import java.sql.Timestamp;

public class WarrantyHistoryDAO extends AbstractDAO<WarrantyHistory> {
    public WarrantyHistoryDAO() {
        super("warranty_history");
    }
    public int save(WarrantyHistory w){
        w.setCreated_at(new Timestamp(System.currentTimeMillis()));
        w.setUpdated_at(new Timestamp(System.currentTimeMillis()));
        return insertWithId("insert into warranty_history(`warrantyId`, `created_at`,`updated_at`, finished_at, description) " +
                "values (:t.warrantyId, :t.created_at ,:t.updated_at, :t.finished_at, :t.description)", w);
    }
    public boolean update(WarrantyHistory w){
        w.setUpdated_at(new Timestamp(System.currentTimeMillis()));
        return update("update warranty_history set `warrantyId`=:t.warrantyId,`updated_at`=:t.updated_at, finished_at=:t.finished_at, " +
                "description=:t.description where id=:t.id", w);
    }
    public void delete(WarrantyHistory w){
        update("delete from warranty_history where id=t:id", w);
    }
}
