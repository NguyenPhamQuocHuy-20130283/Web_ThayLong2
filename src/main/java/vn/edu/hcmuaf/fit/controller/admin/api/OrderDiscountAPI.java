package vn.edu.hcmuaf.fit.controller.admin.api;

import com.fasterxml.jackson.databind.ObjectMapper;
import vn.edu.hcmuaf.fit.dao.impl.ImportInvoiceDetailDAO;
import vn.edu.hcmuaf.fit.dao.impl.OrderDiscountDAO;
import vn.edu.hcmuaf.fit.model.ImportInvoiceDetail;
import vn.edu.hcmuaf.fit.model.OrderDiscount;
import vn.edu.hcmuaf.fit.until.HttpUtil;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "OrderDiscountAPI", value = "/api/order-discount")
public class OrderDiscountAPI extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ObjectMapper mapper = new ObjectMapper();
        request.setCharacterEncoding("UTF-8");
        response.setContentType("application/json");
        OrderDiscount action = HttpUtil.of(request.getReader()).toModel(OrderDiscount.class);
        new OrderDiscountDAO().save(action);
        mapper.writeValue(response.getOutputStream(), action);
    }

    @Override
    protected void doPut(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ObjectMapper mapper = new ObjectMapper();
        request.setCharacterEncoding("UTF-8");
        response.setContentType("application/json");

        OrderDiscount action = HttpUtil.of(request.getReader()).toModel(OrderDiscount.class);
        new OrderDiscountDAO().update(action);
        mapper.writeValue(response.getOutputStream(), action);
    }

    @Override
    protected void doDelete(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ObjectMapper mapper = new ObjectMapper();
        request.setCharacterEncoding("UTF-8");
        response.setContentType("application/json");

        OrderDiscount action = HttpUtil.of(request.getReader()).toModel(OrderDiscount.class);
        new OrderDiscountDAO().delete(action);
        mapper.writeValue(response.getOutputStream(), action);
    }
}
