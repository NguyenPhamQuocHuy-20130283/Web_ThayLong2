package vn.edu.hcmuaf.fit.model.cart;

import lombok.AllArgsConstructor;
import lombok.Data;
import vn.edu.hcmuaf.fit.model.common.Base;
import vn.edu.hcmuaf.fit.model.phone.Color;
import vn.edu.hcmuaf.fit.model.phone.PhoneColor;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Data
@AllArgsConstructor
public class Carts extends Base<Carts> {
    private Map<CartItem, Integer> cartItemIntegerMap;

    public Carts() {
        cartItemIntegerMap = new HashMap<>();
    }

    public int cartItems() {
        List<CartItem> ci = new ArrayList<>(cartItemIntegerMap.keySet());
        int rs = 0;
        for (CartItem c : ci
        ) {
            if (!c.getSave())
                rs++;
        }

        return rs;
    }

    public int cartItems2() {
        List<CartItem> ci = new ArrayList<>(cartItemIntegerMap.keySet());
        int rs = 0;
        for (CartItem c : ci
        ) {
            if (!c.getSave())
                rs += cartItemIntegerMap.get(c);
        }

        return rs;
    }

    public int wishItems() {
        List<CartItem> ci = new ArrayList<>(cartItemIntegerMap.keySet());
        int rs = 0;
        for (CartItem c : ci
        ) {
            if (c.getSave())
                rs++;
        }

        return rs;
    }

    public Map<CartItem, Integer> merge(Carts carts) {

        this.cartItemIntegerMap.putAll(carts.getCartItemIntegerMap());
        return this.cartItemIntegerMap;
    }

    public List<Color> colors(CartItem c) {
        List<Color> rs = new ArrayList<>();
        List<CartItem> cartItem = new ArrayList<>(get0(c));

        for (PhoneColor pc : c._phone()._colors()
        ) {
            rs.add(pc._color());
        }
        if (!cartItem.isEmpty()) {


            for (int i = 0; i < rs.size(); i++) {
                for (CartItem ci : cartItem
                ) {
                    if (ci.getColorId() == rs.get(i).getId()) {
                        rs.remove(i);
                    }
                }

            }
        }
        rs.add(c._color());
        return rs;
    }


    public int total() {
        int rs = 0;
        List<CartItem> cart = new ArrayList<>(cartItemIntegerMap.keySet());
        for (CartItem c : cart
        ) {
            if (!c.getSave()) {
                rs += c.getPrice() * getCartItemIntegerMap().get(c);
            }

        }

        return rs;
    }


    public CartItem get(CartItem cartItem) {
        List<CartItem> keys = new ArrayList<>(cartItemIntegerMap.keySet());
        for (CartItem ci : keys
        ) {
            if (ci.getSave() == cartItem.getSave() && ci.getColorId() == cartItem.getColorId() && ci.getPhoneId() == cartItem.getPhoneId())
                return ci;
        }
        return null;
    }

    public List<CartItem> get0(CartItem cartItem) {
        List<CartItem> rs = new ArrayList<>();

        List<CartItem> keys = new ArrayList<>(cartItemIntegerMap.keySet());
        for (CartItem ci : keys
        ) {
            if (ci.getSave() == cartItem.getSave() && ci.getPhoneId() == cartItem.getPhoneId())
                rs.add(ci);
        }
        return rs;
    }


    public void add(CartItem cartItem) {

        if (get(cartItem) != null) {
            if (cartItem.getQuantity() != 0) {
                int total = get(cartItem).getQuantity() + cartItem.getQuantity();
                cartItemIntegerMap.remove(get(cartItem));
                cartItem.setQuantity(total);
                cartItemIntegerMap.put(cartItem, total);
            }
        } else {
            cartItemIntegerMap.put(cartItem, cartItem.getQuantity());
        }
    }

    public void remove(CartItem cartItem) {
        if (get(cartItem) != null) {
            cartItemIntegerMap.remove(get(cartItem));
        }
    }


    public void updateColor(CartItem cartItem, int colorIdU) {

        if (get(cartItem) != null) {
            int total = cartItem.getQuantity();
            cartItemIntegerMap.remove(get(cartItem));

            cartItem.setColorId(colorIdU);

            cartItemIntegerMap.put(cartItem, total);
        }
    }

    public void update(CartItem cartItem, CartItem colorIdU) {

        if (get(cartItem) != null) {
            cartItemIntegerMap.remove(get(cartItem));
            cartItemIntegerMap.put(colorIdU, colorIdU.getQuantity());
        }
    }


    public void updateQuantity(CartItem cartItem, CartItem parseInt) {
        if (get(cartItem) != null) {
            cartItemIntegerMap.remove(get(cartItem));
            cartItem.setQuantity(parseInt.getQuantity());
            cartItemIntegerMap.put(cartItem, parseInt.getQuantity());
        }
    }

    public List<CartItem> carts() {
        List<CartItem> rs = new ArrayList<>();

        List<CartItem> c = new ArrayList<>(cartItemIntegerMap.keySet());
        for (CartItem ci : c
        ) {
            if (!ci.getSave()) rs.add(ci);

        }

        return rs;

    }


}
