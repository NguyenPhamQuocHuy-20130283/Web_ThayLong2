package vn.edu.hcmuaf.fit.controller.admin.api;

import com.fasterxml.jackson.databind.ObjectMapper;
import vn.edu.hcmuaf.fit.dao.impl.AgencyDAO;
import vn.edu.hcmuaf.fit.dao.impl.ExportInvoiceDetailDAO;
import vn.edu.hcmuaf.fit.model.Agency;
import vn.edu.hcmuaf.fit.model.ExportInvoiceDetail;
import vn.edu.hcmuaf.fit.until.HttpUtil;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "ExportInvoiceDetailAPI", value = "/api/export-invoice-detail")
public class ExportInvoiceDetailAPI extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ObjectMapper mapper = new ObjectMapper();
        request.setCharacterEncoding("UTF-8");
        response.setContentType("application/json");
        ExportInvoiceDetail action = HttpUtil.of(request.getReader()).toModel(ExportInvoiceDetail.class);
        new ExportInvoiceDetailDAO().save(action);
        mapper.writeValue(response.getOutputStream(), action);
    }

    @Override
    protected void doPut(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ObjectMapper mapper = new ObjectMapper();
        request.setCharacterEncoding("UTF-8");
        response.setContentType("application/json");

        ExportInvoiceDetail action = HttpUtil.of(request.getReader()).toModel(ExportInvoiceDetail.class);
        new ExportInvoiceDetailDAO().update(action);
        mapper.writeValue(response.getOutputStream(), action);
    }

    @Override
    protected void doDelete(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ObjectMapper mapper = new ObjectMapper();
        request.setCharacterEncoding("UTF-8");
        response.setContentType("application/json");

        ExportInvoiceDetail action = HttpUtil.of(request.getReader()).toModel(ExportInvoiceDetail.class);
        new ExportInvoiceDetailDAO().delete(action);
        mapper.writeValue(response.getOutputStream(), action);
    }
}
