package vn.edu.hcmuaf.fit.dao.impl;

import vn.edu.hcmuaf.fit.dao.AbstractDAO;
import vn.edu.hcmuaf.fit.model.order.OrderDetail;

import java.sql.Timestamp;

public class OrderDetailDAO extends AbstractDAO<OrderDetail> {
    public OrderDetailDAO() {
        super("order_detail");
    }

    public boolean save(OrderDetail od) {

        od.setCreated_at(new Timestamp(System.currentTimeMillis()));
        od.setUpdated_at(new Timestamp(System.currentTimeMillis()));

        return insert(" insert into order_detail (quantity,price,phoneId,orderId,colorId,created_at,updated_at)" +
                " values (:t.quantity,:t.price,:t.phoneId,:t.orderId,:t.colorId,:t.created_at,:t.updated_at)", od);

    }

}
