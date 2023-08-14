package vn.edu.hcmuaf.fit.dao.impl;

import vn.edu.hcmuaf.fit.dao.AbstractDAO;
import vn.edu.hcmuaf.fit.model.ExportInvoice;
import vn.edu.hcmuaf.fit.model.ExportInvoiceDetail;

import java.sql.Timestamp;

public class ExportInvoiceDetailDAO extends AbstractDAO<ExportInvoiceDetail> {
    public ExportInvoiceDetailDAO() {
        super("export_invoice_detail");

    }

    public void save(ExportInvoiceDetail ex) {
        ex.setCreated_at(new Timestamp(System.currentTimeMillis()));
        ex.setUpdated_at(new Timestamp(System.currentTimeMillis()));
        insert("insert into export_invoice_detail(import_invoiceId, phoneId, total, price, expiration_date,created_at, updated_at, colorId)" +
                " values (:t.import_invoiceId, :t.phoneId, :t.total, :t.price, :t.expiration_date, :t.created_at, :t.updated_at, :t.colorId)", ex);
    }

    public boolean update(ExportInvoiceDetail ex) {
        ex.setUpdated_at(new Timestamp(System.currentTimeMillis()));
        return update("update export_invoice_detail set import_invoiceId=:t.import_invoiceId, phoneId=:t.phoneId, total=:t.total, price=:t.price," +
                " date_of=:t.expiration_date,  updated_at=:t.updated_at, colorId=:t.colorId where phoneId=:t.phoneId and colorId=:t.colorId", ex);
    }

    public void delete(ExportInvoiceDetail ex) {
        update("delete from export_invoice_detail where phoneId=:t.phoneId and colorId=:t.colorId", ex);
    }
}
