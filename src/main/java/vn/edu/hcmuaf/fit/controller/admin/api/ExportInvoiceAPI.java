package vn.edu.hcmuaf.fit.controller.admin.api;

import com.fasterxml.jackson.databind.ObjectMapper;
import vn.edu.hcmuaf.fit.dao.impl.AgencyDAO;
import vn.edu.hcmuaf.fit.dao.impl.ExportInvoiceDAO;
import vn.edu.hcmuaf.fit.model.Agency;
import vn.edu.hcmuaf.fit.model.ExportInvoice;
import vn.edu.hcmuaf.fit.until.HttpUtil;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "ExportInvoiceAPI", value = "/api/export-invoice")
public class ExportInvoiceAPI extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ObjectMapper mapper = new ObjectMapper();
        request.setCharacterEncoding("UTF-8");
        response.setContentType("application/json");
        ExportInvoice action = HttpUtil.of(request.getReader()).toModel(ExportInvoice.class);
        new ExportInvoiceDAO().save(action);
        mapper.writeValue(response.getOutputStream(), action);
    }

    @Override
    protected void doPut(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ObjectMapper mapper = new ObjectMapper();
        request.setCharacterEncoding("UTF-8");
        response.setContentType("application/json");

        ExportInvoice action = HttpUtil.of(request.getReader()).toModel(ExportInvoice.class);
        new ExportInvoiceDAO().update(action);
        mapper.writeValue(response.getOutputStream(), action);

    }

    @Override
    protected void doDelete(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ObjectMapper mapper = new ObjectMapper();
        request.setCharacterEncoding("UTF-8");
        response.setContentType("application/json");

        ExportInvoice action = HttpUtil.of(request.getReader()).toModel(ExportInvoice.class);
        new ExportInvoiceDAO().delete(action);
        mapper.writeValue(response.getOutputStream(), action);
    }
}
