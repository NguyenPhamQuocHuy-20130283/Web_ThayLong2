package vn.edu.hcmuaf.fit.dao.impl;

import vn.edu.hcmuaf.fit.dao.AbstractDAO;
import vn.edu.hcmuaf.fit.model.Transport;
import vn.edu.hcmuaf.fit.model.UserVoucher;

import java.io.Serializable;
import java.sql.Timestamp;

public class UserVoucherDAO extends AbstractDAO<UserVoucher> implements Serializable {
    public UserVoucherDAO() {
        super("user_voucher");
    }

    public void save(UserVoucher u) {
        u.setCreated_at(new Timestamp(System.currentTimeMillis()));
        u.setUpdated_at(new Timestamp(System.currentTimeMillis()));
        insert("insert into user_voucher(`userId`, `codeId`,`created_at`, updated_at, `total`) " +
                "values (:t.userId, :t.codeId ,:t.created_at, :t.updated_at, :t.total )", u);
    }

    public boolean update(UserVoucher u) {
        u.setUpdated_at(new Timestamp(System.currentTimeMillis()));
        return update("update user_voucher set `userId`=:t.userId,`codeId`=:t.codeId , updated_at=:t.updated_at," +
                " total=:t.total where  userId=:t.userId and codeId =:t.codeId", u);
    }

    public void delete(UserVoucher u) {
        update("delete from user_voucher where userId=:t.userId and codeId =:t.codeId", u);
    }
}
