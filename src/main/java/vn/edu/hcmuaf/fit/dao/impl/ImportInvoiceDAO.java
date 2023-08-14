package vn.edu.hcmuaf.fit.dao.impl;

import vn.edu.hcmuaf.fit.dao.AbstractDAO;
import vn.edu.hcmuaf.fit.model.ImageColor;
import vn.edu.hcmuaf.fit.model.ImportInvoice;

import java.sql.Timestamp;

public class ImportInvoiceDAO extends AbstractDAO<ImportInvoice> {
    public ImportInvoiceDAO() {
        super("import_invoice");
    }

    public int save(ImportInvoice i) {
        i.setCreated_at(new Timestamp(System.currentTimeMillis()));
        i.setUpdated_at(new Timestamp(System.currentTimeMillis()));
        return insertWithId("insert into import_invoice(agencyId, created_at, updated_at, `total`, userId, `price`, vendorId) " +
                "values (:t.agencyId, :t.created_at, :t.updated_at, :t.total, :t.userId, :t.price, :t.vendorId)", i);
    }

    public boolean update(ImportInvoice i) {
        i.setUpdated_at(new Timestamp(System.currentTimeMillis()));
        return update("update import_invoice set agencyId=:t.agencyId, created_at=:t.created_at, updated_at=:t.updated_at" +
                "total=:t.total,  userId=:t.userId,price=:t.price, vendorId=:t.vendorId where id=:t.id", i);
    }

    public void delete(ImportInvoice i) {
        update("delete from import_invoice where id=t:id", i);
    }
}
