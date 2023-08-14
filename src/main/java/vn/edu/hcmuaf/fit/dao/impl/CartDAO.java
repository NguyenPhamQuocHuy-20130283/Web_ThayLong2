package vn.edu.hcmuaf.fit.dao.impl;

import vn.edu.hcmuaf.fit.dao.AbstractDAO;;
import vn.edu.hcmuaf.fit.model.cart.Carts;

import java.sql.Timestamp;

public class CartDAO extends AbstractDAO<Carts> {

    public CartDAO() {
        super("carts");
    }

    public int save(Carts cart) {
        cart.setCreated_at(new Timestamp(System.currentTimeMillis()));
        cart.setUpdated_at(new Timestamp(System.currentTimeMillis()));
        return insertWithId(" insert into carts(userId,created_at,updated_at,cart_itemId,quantity) " +
                "values(:t.userId,:t.created_at,:t.updated_at,:t.cart_itemId,:t.quantity) ", cart);
    }
}
