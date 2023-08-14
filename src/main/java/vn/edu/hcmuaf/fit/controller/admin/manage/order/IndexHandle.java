package vn.edu.hcmuaf.fit.controller.admin.manage.order;

import vn.edu.hcmuaf.fit.dao.impl.OrderDAO;
import vn.edu.hcmuaf.fit.dao.impl.OrderDetailDAO;
import vn.edu.hcmuaf.fit.model.order.Order;
import vn.edu.hcmuaf.fit.model.order.OrderDetail;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(urlPatterns = {"/admin/manage/order"})
public class IndexHandle extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id = request.getParameter("id");
        if (id != null) {
            List<OrderDetail> orderDetails = new OrderDetailDAO().list(" and  orderId =" + id, OrderDetail.class, null, null, null, null);
            request.setAttribute("ods", orderDetails);
            request.getRequestDispatcher("/views/admin/manage/order/index2.jsp").forward(request, response);
        } else {
            List<Order> users = new OrderDAO().list("", Order.class, null, null, null, null);
            request.setAttribute("orders", users);
            request.getRequestDispatcher("/views/admin/manage/order/index.jsp").forward(request, response);
        }


    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
