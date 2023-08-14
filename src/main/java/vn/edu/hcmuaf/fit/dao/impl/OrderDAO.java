package vn.edu.hcmuaf.fit.dao.impl;

import vn.edu.hcmuaf.fit.dao.AbstractDAO;
import vn.edu.hcmuaf.fit.model.order.Order;
import vn.edu.hcmuaf.fit.model.order.OrderDetail;

import java.sql.Timestamp;

public class OrderDAO extends AbstractDAO<Order> {


    public OrderDAO() {
        super("orders");
    }

    public int save(Order order) {

        order.setCreated_at(new Timestamp(System.currentTimeMillis()));
        order.setUpdated_at(new Timestamp(System.currentTimeMillis()));
        order.setOrder_stateId(1);
        int id = insertWithId(" insert into orders (userId,customerId,payment,total,codeId,order_stateId,created_at,updated_at) " +
                "values (:t.userId,:t.customerId,:t.payment,:t.total,:t.codeId,:t.order_stateId,:t.created_at,:t.updated_at)", order);
        for (OrderDetail od : order._orderDetails()
        ) {
            new OrderDetailDAO().save(od);
        }
        return id;
    }


}
