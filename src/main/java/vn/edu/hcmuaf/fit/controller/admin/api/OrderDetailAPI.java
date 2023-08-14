package vn.edu.hcmuaf.fit.controller.admin.api;

import com.fasterxml.jackson.databind.ObjectMapper;
import vn.edu.hcmuaf.fit.dao.impl.OrderDetailDAO;
import vn.edu.hcmuaf.fit.model.order.OrderDetail;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(value = "/api/order-detail")
public class OrderDetailAPI extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ObjectMapper mapper = new ObjectMapper();
        request.setCharacterEncoding("UTF-8");
        response.setContentType("application/json");
        String phoneId = request.getParameter("phoneId");
        String colorId = request.getParameter("colorId");
        String orderId = request.getParameter("orderId");
        if (phoneId != null && colorId != null && orderId != null) {
            OrderDetail users = new OrderDetailDAO().get(" and orderId= " + orderId + " and phoneId=" + phoneId + " and colorId=" + colorId, OrderDetail.class, null).get();
            mapper.writeValue(response.getOutputStream(), users);
        } else
            mapper.writeValue(response.getOutputStream(), "{}");

    }

}
