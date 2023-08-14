package vn.edu.hcmuaf.fit.dao.impl;

import vn.edu.hcmuaf.fit.dao.AbstractDAO;
import vn.edu.hcmuaf.fit.model.cart.CartItem;

import java.sql.Timestamp;

public class CartItemDAO extends AbstractDAO<CartItem> {
    public CartItemDAO() {
        super("cart_items");
    }

    public void save(CartItem c) {
        c.setCreated_at(new Timestamp(System.currentTimeMillis()));
        c.setUpdated_at(new Timestamp(System.currentTimeMillis()));
        insert(" insert into cart_items(phoneId,colorId,`quantity`,`price`,`isSave`,userId,created_at,updated_at) values(:t.phoneId,:t.colorId,:t.quantity,:t.price,:t.save,:t.userId,:t.created_at,:t.updated_at)", c);
    }

    public void delete(CartItem c) {
        delete(" delete from cart_items where phoneId=:t.phoneId and colorId = :t.colorId and userId =:t.userId ", c);
    }

}
