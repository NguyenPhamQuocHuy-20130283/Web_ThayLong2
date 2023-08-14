package vn.edu.hcmuaf.fit.controller.admin.api;

import com.fasterxml.jackson.databind.ObjectMapper;
import vn.edu.hcmuaf.fit.dao.impl.PayDAO;
import vn.edu.hcmuaf.fit.dao.impl.VoucherTypeDAO;
import vn.edu.hcmuaf.fit.model.Pay;
import vn.edu.hcmuaf.fit.model.VoucherType;
import vn.edu.hcmuaf.fit.until.HttpUtil;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "VoucherTypeAPI", value = "/api/voucher-type")
public class VoucherTypeAPI extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ObjectMapper mapper = new ObjectMapper();
        request.setCharacterEncoding("UTF-8");
        response.setContentType("application/json");
        VoucherType action = HttpUtil.of(request.getReader()).toModel(VoucherType.class);
        new VoucherTypeDAO().save(action);
        mapper.writeValue(response.getOutputStream(), action);
    }

    @Override
    protected void doPut(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ObjectMapper mapper = new ObjectMapper();
        request.setCharacterEncoding("UTF-8");
        response.setContentType("application/json");

        VoucherType action = HttpUtil.of(request.getReader()).toModel(VoucherType.class);
        new VoucherTypeDAO().update(action);
        mapper.writeValue(response.getOutputStream(), action);
    }

    @Override
    protected void doDelete(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ObjectMapper mapper = new ObjectMapper();
        request.setCharacterEncoding("UTF-8");
        response.setContentType("application/json");

        VoucherType action = HttpUtil.of(request.getReader()).toModel(VoucherType.class);
        new VoucherTypeDAO().delete(action);
        mapper.writeValue(response.getOutputStream(), action);
    }
}
