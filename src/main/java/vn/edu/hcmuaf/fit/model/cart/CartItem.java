package vn.edu.hcmuaf.fit.model.cart;

import lombok.Data;
import lombok.NoArgsConstructor;
import vn.edu.hcmuaf.fit.dao.AbstractDAO;
import vn.edu.hcmuaf.fit.model.common.Base;
import vn.edu.hcmuaf.fit.model.phone.Color;
import vn.edu.hcmuaf.fit.model.phone.Phone;

import java.util.Objects;

@Data
@NoArgsConstructor
public class CartItem extends Base<CartItem> {
    private int phoneId;
    private int colorId;
    private int quantity;
    private int price;
    private Boolean isSave;
    private Integer userId;


    public CartItem(int phoneId, int colorId, int price, boolean isSave) {
        this.phoneId = phoneId;
        this.colorId = colorId;
        this.price = price;
        this.isSave = isSave;
    }

    public boolean getSave() {
        return isSave;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        if (!super.equals(o)) return false;
        CartItem cartItem = (CartItem) o;
        return phoneId == cartItem.phoneId && colorId == cartItem.colorId && quantity == cartItem.quantity && price == cartItem.price && isSave == cartItem.isSave;
    }

    @Override
    public int hashCode() {
        return Objects.hash(super.hashCode(), phoneId, colorId, quantity, price, isSave);
    }

    public CartItem(int phoneId, int colorId, int num, Integer price, boolean isSave) {
        this.phoneId = phoneId;
        this.colorId = colorId;
        this.price = price;
        this.quantity = num;
        this.isSave = isSave;
    }


    public Color _color() {
        return new AbstractDAO<Color>("colors").get(" and id = " + this.colorId, Color.class, null).get();
    }

    public Phone _phone() {
        return new AbstractDAO<Phone>("phones").get(" and id =" + this.phoneId, Phone.class, null).get();
    }


}
