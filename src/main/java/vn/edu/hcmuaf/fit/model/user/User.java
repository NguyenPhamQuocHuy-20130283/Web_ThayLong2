package vn.edu.hcmuaf.fit.model.user;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import vn.edu.hcmuaf.fit.constant.Variable;
import vn.edu.hcmuaf.fit.dao.AbstractDAO;
import vn.edu.hcmuaf.fit.dao.impl.CartItemDAO;
import vn.edu.hcmuaf.fit.dao.impl.StateDAO;
import vn.edu.hcmuaf.fit.dao.impl.UserDAO;
import vn.edu.hcmuaf.fit.dao.impl.VoteDAO;
import vn.edu.hcmuaf.fit.model.cart.CartItem;
import vn.edu.hcmuaf.fit.model.cart.Carts;
import vn.edu.hcmuaf.fit.model.common.State;
import vn.edu.hcmuaf.fit.model.order.Order;
import vn.edu.hcmuaf.fit.model.common.Base;
import vn.edu.hcmuaf.fit.model.phone.Phone;
import vn.edu.hcmuaf.fit.model.review.Review;
import vn.edu.hcmuaf.fit.model.review.Vote;

import javax.servlet.http.HttpSessionBindingEvent;
import javax.servlet.http.HttpSessionBindingListener;
import java.io.Serializable;
import java.sql.Timestamp;
import java.util.*;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class User extends Base<User> implements Serializable, HttpSessionBindingListener {
    private String name;
    private String password;
    private Boolean isDelete;
    private Integer restored_by;
    private Integer deleted_by;
    private Boolean enable;
    private Timestamp deleted_at;
    private Timestamp restored_at;
    private String avatar;
    private String phone;
    private String address;
    private boolean gender;
    private boolean active;
    private String method;
    private Integer user_stateId;
    private String email;
    private Boolean method_pass;

    private String permission;

    public boolean like(Review r) {
        return new VoteDAO().get(" and userId=" + this.id + " and commentId=" + r.getId(), Vote.class, null).orElse(null) != null;


    }

    public boolean dislike(Review r) {

        return new VoteDAO().get(" and userId=" + this.id + " and commentId=" + r.getId(), Vote.class, null).orElse(null) != null;

    }


    public User _deleteBy() {
        return new UserDAO().get(" and id=" + this.deleted_by, User.class, null).orElse(null);
    }

    public List<Vote> votes() {
        return new VoteDAO().list(" and userId=" + this.id, Vote.class, null, null, null, null);
    }


    public void setUserState(String state) {
        this.user_stateId = new StateDAO().get(" and name='" + state + "'", State.class, null).get().getId();
    }

    public Carts listToCarts() {
        return new Carts(cartItemIntegerMap());
    }


    public Action get(String v) {
        List<PermissionAction> acs = _actions();
        for (PermissionAction a : acs
        ) {
            if (a._action().getCode().equals(v)) return a._action();
        }
        return null;

    }

    public State _userState() {
        return new StateDAO().get(" and id=" + this.user_stateId, State.class, null).get();
    }


    public String avatar() {
        StringBuilder rs = new StringBuilder();
        StringTokenizer st = new StringTokenizer(this.name);

        String[] sts = this.name.trim().toUpperCase().split(" ");

        int start = 0;
        if (sts.length > 2) start = sts.length - 3;

        for (int i = start; i < sts.length; i++) {
            rs.append(sts[i].charAt(0));
        }
        return rs.toString();
    }

    public List<PermissionAction> _actions() {
        return new AbstractDAO<PermissionAction>("permission_action").list(" and userId =" + this.id, PermissionAction.class, null, null, null, null);
    }


    public Timestamp nearBuy() {
        Order order = new AbstractDAO<Order>("orders").get("  and userId =" + this.id + " order by created_at desc limit 1", Order.class, null).orElse(null);

        return (order != null) ? order.getCreated_at() : null;
    }


    public Timestamp nearWish() {
        Order order = new AbstractDAO<Order>("cart_items").get("and cart_items.isSave =true   and userId =" + this.id + " order by created_at desc limit 1", Order.class, null).orElse(null);
        return (order != null) ? order.getCreated_at() : null;
    }

    public List<Review> _reviews() {
        return new AbstractDAO<Review>("reviews").list(" and userId =" + this.id, Review.class, null, null, null, null);
    }

    public List<Phone> _phones() {
        return new AbstractDAO<Phone>("phones").list(" and userId =" + this.id, Phone.class, null, null, null, null);
    }

    public List<Vote> _votes() {
        return new AbstractDAO<Vote>("votes").list(" and userId =" + this.id, Vote.class, null, null, null, null);
    }

    public List<Order> _orders() {
        return new AbstractDAO<Order>("orders").list(" and userId = " + this.id, Order.class, null, null, null, null);
    }

    public List<CartItem> _carts() {
        return new CartItemDAO().list("and userId =" + this.id, CartItem.class, null, null, null, null);
    }


    Map<CartItem, Integer> cartItemIntegerMap() {
        Map<CartItem, Integer> rs = new HashMap<>();
        for (CartItem c : _carts()) {
            rs.put(c, c.getQuantity());
        }
        return rs;
    }


    @Override
    public void valueBound(HttpSessionBindingEvent event) {
        System.out.println("-- HttpSessionBindingListener#valueBound() --");
        System.out.printf("added attribute name: %s, value:%s %n",
                event.getName(), event.getValue());
        String attributeName = event.getName();
        Object attributeValue = event.getValue();
        if (attributeName.equals(Variable.Global.USER.toString())) {
            Carts cart = (Carts) event.getSession().getAttribute(Variable.Global.CART.toString());
            User user = (User) event.getValue();
            cart.merge(user.listToCarts());
        }
    }

    @Override
    public void valueUnbound(HttpSessionBindingEvent event) {
        String attributeName = event.getName();
        Object attributeValue = event.getValue();
        if (attributeName.equals(Variable.Global.USER.toString())) {
            Carts cart = (Carts) event.getSession().getAttribute(Variable.Global.CART.toString());
            User user = (User) event.getValue();
            List<CartItem> cartItems = new ArrayList<>(cart.getCartItemIntegerMap().keySet());
            for (CartItem c : cartItems
            ) {
                c.setUserId(user.getId());
                new CartItemDAO().delete(c);
                new CartItemDAO().save(c);
            }
        }
    }
}
