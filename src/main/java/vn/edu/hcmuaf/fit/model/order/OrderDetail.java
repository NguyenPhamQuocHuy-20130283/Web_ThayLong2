/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package vn.edu.hcmuaf.fit.model.order;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import vn.edu.hcmuaf.fit.dao.AbstractDAO;
import vn.edu.hcmuaf.fit.model.common.Base;
import vn.edu.hcmuaf.fit.model.phone.Color;
import vn.edu.hcmuaf.fit.model.phone.Phone;

import java.io.Serializable;
import java.math.BigDecimal;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class OrderDetail extends Base<OrderDetail> implements Serializable {
    private int orderId;
    private int phoneId;
    private int quantity;
    private int price;
    private int discount;
    private int colorId;

    public Color _color() {
        return new AbstractDAO<Color>("colors").get(" and id=" + this.colorId, Color.class, null).get();
    }

    public Phone _phone() {
        return new AbstractDAO<Phone>("phones").get(" and id =" + this.phoneId, Phone.class, null).get();
    }

    public Order _order() {
        return new AbstractDAO<Order>("orders").get(" and id =" + this.orderId, Order.class, null).get();
    }


    public BigDecimal getTotal() {
        BigDecimal total = new BigDecimal(price * quantity);
        return total;
    }

    public BigDecimal getRealPrice() {
        BigDecimal total = new BigDecimal(price * quantity - (price * quantity * (double) discount / 100));
        return total;
    }

}
