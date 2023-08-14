package vn.edu.hcmuaf.fit.dao.impl;

import vn.edu.hcmuaf.fit.dao.AbstractDAO;
import vn.edu.hcmuaf.fit.model.ImportInvoice;
import vn.edu.hcmuaf.fit.model.OrderDiscount;

import java.sql.Timestamp;

public class OrderDiscountDAO extends AbstractDAO<OrderDiscount> {
    public OrderDiscountDAO() {
        super("order_discount");
    }
    public int save(OrderDiscount o){
        o.setCreated_at(new Timestamp(System.currentTimeMillis()));
        o.setUpdated_at(new Timestamp(System.currentTimeMillis()));
        return insertWithId("insert into order_discount(orderId, codeId, created_at, updated_at, `total`) " +
                "values (:t.orderId, :t.codeId, :t.created_at, :t.updated_at, :t.total)", o);
    }
    public boolean update(OrderDiscount o){
        o.setUpdated_at(new Timestamp(System.currentTimeMillis()));
        return update("update order_discount set orderId=:t.orderId, codeId=:t.codeId, " +
                " updated_at=:t.updated_at, total:t.total where orderId=:t.orderId and codeId=:t.codeId", o);
    }
    public void delete(OrderDiscount o){
        update("delete from order_discount where orderId=:t.orderId and codeId=:t.codeId", o);
    }
}
