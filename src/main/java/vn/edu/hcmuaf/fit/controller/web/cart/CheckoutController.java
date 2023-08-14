package vn.edu.hcmuaf.fit.controller.web.cart;

import vn.edu.hcmuaf.fit.constant.Variable;
import vn.edu.hcmuaf.fit.dao.impl.*;
import vn.edu.hcmuaf.fit.mail.MailReceipt;
import vn.edu.hcmuaf.fit.model.cart.CartItem;
import vn.edu.hcmuaf.fit.model.cart.Carts;
import vn.edu.hcmuaf.fit.model.order.Order;
import vn.edu.hcmuaf.fit.model.order.OrderDetail;
import vn.edu.hcmuaf.fit.model.user.Customer;
import vn.edu.hcmuaf.fit.model.user.User;
import vn.edu.hcmuaf.fit.until.SessionUntil;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "checkout", urlPatterns = {"/checkout"})
public class CheckoutController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Carts carts = (Carts) SessionUntil.get(request, Variable.Global.CART.toString());
        if (carts.cartItems() == 0) {
            SessionUntil.set(request, Variable.Global.TYPE.toString(), "error");
            SessionUntil.set(request, Variable.Global.MESSAGE.toString(), "chua co sp nao");
            response.sendRedirect("/carts");
        }


        request.getRequestDispatcher("/views/web/checkout.jsp").forward(request, response);

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws
            ServletException, IOException {
        Carts carts = (Carts) SessionUntil.get(request, Variable.Global.CART.toString());
        List<CartItem> cartItems = new ArrayList<>(carts.getCartItemIntegerMap().keySet());
        // is customer
        User user = (User) SessionUntil.get(request, Variable.Global.USER.toString());
        String cusEmail = request.getParameter("cus-email");
        Customer cus;
        String cusGender = request.getParameter("gender");
        String cusName = request.getParameter("cus-name");
        String cusPhone = request.getParameter("cus-phone");
        String cusAddress = request.getParameter("cus-address");


        Order order = new Order();

        if (user != null) {
            order.setUserId(user.getId());

        } else {
            Customer customer = new Customer();
            customer.setEmail(cusEmail);
            customer.setAddress(cusAddress);
            customer.setPhone(cusPhone);
            customer.setName(cusName);
            int idcus = new CustomerDAO().save(customer);
            order.setCustomerId(idcus);
        }
        order.setTotal(carts.total());
        order.setState("DANG XU LY");
        int id = new OrderDAO().save(order);
        List<CartItem> cartItemList = carts.carts();

        for (CartItem item : cartItemList) {
            // save cart Items
            OrderDetail oderDetail = new OrderDetail();

            oderDetail.setQuantity(item.getQuantity());
            oderDetail.setPrice(item.getPrice());
//                oderDetail.setDiscount(null);
            oderDetail.setPhoneId(item.getPhoneId());
            oderDetail.setColorId(item.getColorId());
            oderDetail.setOrderId(id);

            new OrderDetailDAO().save(oderDetail);

            new CartItemDAO().delete(item);

        }

        MailReceipt.send(cusEmail, carts.cartItems(), carts.total(), cartItems);
        carts.getCartItemIntegerMap().clear();

        SessionUntil.set(request, Variable.Global.TYPE.toString(), "success");
        SessionUntil.set(request, Variable.Global.MESSAGE.toString(), "kiem tra mail cua ban");

        response.sendRedirect("/user-profile#panel22");
    }

    public static void main(String[] args) {
        System.out.println(!new UserDAO().hasEmail("howoha6825@cmeinbox.com"));
    }
}
