package vn.edu.hcmuaf.fit.controller.admin.api;

import com.fasterxml.jackson.databind.ObjectMapper;
import vn.edu.hcmuaf.fit.dao.impl.PayDAO;
import vn.edu.hcmuaf.fit.dao.impl.WarrantyHistoryDAO;
import vn.edu.hcmuaf.fit.model.Pay;
import vn.edu.hcmuaf.fit.model.WarrantyHistory;
import vn.edu.hcmuaf.fit.until.HttpUtil;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "WarrantyHistoryAPI", value = "/api/warranty-history")
public class WarrantyHistoryAPI extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ObjectMapper mapper = new ObjectMapper();
        request.setCharacterEncoding("UTF-8");
        response.setContentType("application/json");
        WarrantyHistory action = HttpUtil.of(request.getReader()).toModel(WarrantyHistory.class);
        new WarrantyHistoryDAO().save(action);
        mapper.writeValue(response.getOutputStream(), action);
    }

    @Override
    protected void doPut(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ObjectMapper mapper = new ObjectMapper();
        request.setCharacterEncoding("UTF-8");
        response.setContentType("application/json");

        WarrantyHistory action = HttpUtil.of(request.getReader()).toModel(WarrantyHistory.class);
        new WarrantyHistoryDAO().update(action);
        mapper.writeValue(response.getOutputStream(), action);
    }

    @Override
    protected void doDelete(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ObjectMapper mapper = new ObjectMapper();
        request.setCharacterEncoding("UTF-8");
        response.setContentType("application/json");

        WarrantyHistory action = HttpUtil.of(request.getReader()).toModel(WarrantyHistory.class);
        new WarrantyHistoryDAO().delete(action);
        mapper.writeValue(response.getOutputStream(), action);
    }
}
