package vn.edu.hcmuaf.fit.dao.impl;

import vn.edu.hcmuaf.fit.dao.AbstractDAO;
import vn.edu.hcmuaf.fit.model.Vendor;
import vn.edu.hcmuaf.fit.model.VoucherType;

import java.sql.Timestamp;

public class VoucherTypeDAO extends AbstractDAO<VoucherType> {
    public VoucherTypeDAO() {
        super("voucher_type");
    }

    public int save(VoucherType v) {
        v.setCreated_at(new Timestamp(System.currentTimeMillis()));
        v.setUpdated_at(new Timestamp(System.currentTimeMillis()));
        return insertWithId("insert into voucher_type(`name`, `description`,`code`,created_at,updated_at) " +
                "values (:t.name, :t.description ,:t.code,:t.created_at,:t.updated_at)", v);
    }

    public boolean update(VoucherType v) {
        v.setUpdated_at(new Timestamp(System.currentTimeMillis()));
        return update("update voucher_type set `name`=:t.name,`description`=:t.description,`code`=:t.code,updated_at=:t.updated_at where id=:t.id", v);
    }

    public void delete(VoucherType v) {
        update("delete from voucher_type where id=t:id", v);
    }
}