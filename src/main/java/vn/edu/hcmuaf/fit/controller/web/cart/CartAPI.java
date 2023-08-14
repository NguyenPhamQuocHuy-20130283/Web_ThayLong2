package vn.edu.hcmuaf.fit.controller.web.cart;

import com.fasterxml.jackson.databind.ObjectMapper;
import vn.edu.hcmuaf.fit.constant.Variable;
import vn.edu.hcmuaf.fit.model.cart.CartItem;
import vn.edu.hcmuaf.fit.model.cart.Carts;
import vn.edu.hcmuaf.fit.until.HttpUtil;
import vn.edu.hcmuaf.fit.until.SessionUntil;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "CartAPI", value = "/api/cart")
public class CartAPI extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ObjectMapper mapper = new ObjectMapper();
        request.setCharacterEncoding("UTF-8");
        response.setContentType("application/json");
        CartItem cartItem = HttpUtil.of(request.getReader()).toModel(CartItem.class);
        Carts carts = (Carts) SessionUntil.get(request, Variable.Global.CART.toString());
        System.out.println(cartItem);
        carts.add(cartItem);
        SessionUntil.set(request, Variable.Global.CART.toString(), carts);
        mapper.writeValue(response.getOutputStream(), cartItem);
    }

    @Override
    protected void doPut(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ObjectMapper mapper = new ObjectMapper();
        request.setCharacterEncoding("UTF-8");
        response.setContentType("application/json");
        CartItem[] cartItem = HttpUtil.of(request.getReader()).listModel(CartItem[].class);
        Carts carts = (Carts) SessionUntil.get(request, Variable.Global.CART.toString());
        carts.update(cartItem[0], cartItem[1]);
        SessionUntil.set(request, Variable.Global.CART.toString(), carts);
        mapper.writeValue(response.getOutputStream(), cartItem);
    }

    @Override
    protected void doDelete(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        ObjectMapper mapper = new ObjectMapper();
        request.setCharacterEncoding("UTF-8");
        response.setContentType("application/json");
        CartItem cartItem = HttpUtil.of(request.getReader()).toModel(CartItem.class);
        Carts carts = (Carts) SessionUntil.get(request, Variable.Global.CART.toString());
        carts.remove(cartItem);
        SessionUntil.set(request, Variable.Global.CART.toString(), carts);
        mapper.writeValue(response.getOutputStream(), cartItem);

    }
}
