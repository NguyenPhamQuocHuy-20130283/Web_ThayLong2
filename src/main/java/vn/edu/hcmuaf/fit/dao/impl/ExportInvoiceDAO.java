package vn.edu.hcmuaf.fit.dao.impl;

import vn.edu.hcmuaf.fit.dao.AbstractDAO;
import vn.edu.hcmuaf.fit.model.ExportInvoice;

import java.sql.Timestamp;

public class ExportInvoiceDAO extends AbstractDAO<ExportInvoice> {
    public ExportInvoiceDAO() {
        super("export_invoice");
    }


    public int save(ExportInvoice e){
        e.setCreated_at(new Timestamp(System.currentTimeMillis()));
        e.setUpdated_at(new Timestamp(System.currentTimeMillis()));
        return insertWithId("insert into export_invoice(agencyId, created_at, updated_at, `total`, userId, `price`)" +
                        "values (:t.agencyId, :t.created_at, :t.updated_at, :t.total, :t.userId, :t.price)"
                , e);
    }
    public boolean update(ExportInvoice e){
        e.setUpdated_at(new Timestamp(System.currentTimeMillis()));
        return update("update export_invoice set agencyId= :t.agencyId, updated_at = :t.updated_at, `total`=:t.total," +
                "userId=:t.userId, `price`=:t.price where id=:t.id", e);
    }
    public void delete(ExportInvoice e){
        update("delete from export_invoice where id=t:id", e);
    }
}
