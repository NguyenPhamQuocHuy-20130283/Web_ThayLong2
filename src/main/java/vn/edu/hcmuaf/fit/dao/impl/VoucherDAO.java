package vn.edu.hcmuaf.fit.dao.impl;

import vn.edu.hcmuaf.fit.dao.AbstractDAO;
import vn.edu.hcmuaf.fit.model.order.Voucher;

import java.sql.Timestamp;

public class VoucherDAO extends AbstractDAO<Voucher> {
    public VoucherDAO() {
        super("vouchers");
    }

    public int save(Voucher a) {
        a.setUpdated_at(new Timestamp(System.currentTimeMillis()));
        a.setCreated_at(new Timestamp(System.currentTimeMillis()));
        return insertWithId(" insert into vouchers(`code`,`value`,start_at,end_at,total,created_at,updated_at)" +
                " values (:t.code,:t.value,:t.start_at,:t.end_at,:t.total,:t.created_at,:t.updated_at)", a);
    }

    public boolean update(Voucher a) {
        a.setUpdated_at(new Timestamp(System.currentTimeMillis()));
        return update(" update vouchers set updated_at=:t.updated_at,`code` =:t.code,`value`=:t.value,start_at=:t.start_at,end_at=:t.end_at,total=:t.total" +
                " where id=:t.id", a);
    }

    public void delete(Voucher a) {
        update(" delete from vouchers where id=:t.id ", a);
    }

}
