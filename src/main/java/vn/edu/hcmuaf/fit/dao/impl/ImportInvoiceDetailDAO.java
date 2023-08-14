package vn.edu.hcmuaf.fit.dao.impl;

import vn.edu.hcmuaf.fit.dao.AbstractDAO;
import vn.edu.hcmuaf.fit.model.ImportInvoice;
import vn.edu.hcmuaf.fit.model.ImportInvoiceDetail;

import java.sql.Timestamp;

public class ImportInvoiceDetailDAO extends AbstractDAO<ImportInvoiceDetail> {
    public ImportInvoiceDetailDAO() {
        super("import_invoice_detail");
    }

    public void save(ImportInvoiceDetail i) {
        i.setCreated_at(new Timestamp(System.currentTimeMillis()));
        i.setUpdated_at(new Timestamp(System.currentTimeMillis()));
        insert("insert into import_invoice_detail(import_invoiceId, phoneId, total, `price`, date_of, `created_at`, updated_at, colorId) " +
                "values (:t.import_invoiceId, :t.phoneId, :t.total, :t.price, :t.date_of, :t.created_at, :t.updated_at, :t.colorId)", i);
    }

    public boolean update(ImportInvoiceDetail i) {
        i.setUpdated_at(new Timestamp(System.currentTimeMillis()));
        return update("update import_invoice_detail set import_invoiceId=:t.import_invoiceId, phoneId=:t.phoneId, total=:t.total" +
                "price=:t.price,  date_of=:t.date_of, updated_at=:t.updated_at, colorId=:t.colorId where phoneId=:t.phoneId and colorId=:t.colorId", i);
    }

    public void delete(ImportInvoiceDetail i) {
        update("delete from import_invoice_detail where  phoneId=:t.phoneId and colorId=:t.colorId", i);
    }
}
