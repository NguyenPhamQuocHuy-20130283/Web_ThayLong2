package vn.edu.hcmuaf.fit.dao.impl;

import vn.edu.hcmuaf.fit.dao.AbstractDAO;
import vn.edu.hcmuaf.fit.model.OrderDiscount;
import vn.edu.hcmuaf.fit.model.Pay;

import java.sql.Timestamp;

public class PayDAO extends AbstractDAO<Pay> {
    public PayDAO() {
        super("pays");
    }

    public int save(Pay pay){
        pay.setCreated_at(new Timestamp(System.currentTimeMillis()));
        pay.setUpdated_at(new Timestamp(System.currentTimeMillis()));
        return insertWithId("insert into pays(`payment`, `status`, `amount`, updated_at, created_at) " +
                "values (:t.payment, :t.status, :t.amount, :t.updated_at, :t.created_at)", pay);
    }
    public boolean update(Pay pay){
        pay.setUpdated_at(new Timestamp(System.currentTimeMillis()));
        return update("update pays set `payment`=:t.payment, `status`=:t.status, `amount`=:t.amount, " +
                "updated_at=:t.updated_at where id=:t.id", pay);
    }
    public void delete(Pay pay){
        update("delete from pays where id=t:id", pay);
    }
}
