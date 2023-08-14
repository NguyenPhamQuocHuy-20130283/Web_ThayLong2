package vn.edu.hcmuaf.fit.controller.admin.api;

import com.fasterxml.jackson.databind.ObjectMapper;
import vn.edu.hcmuaf.fit.dao.impl.ImageColorDAO;
import vn.edu.hcmuaf.fit.dao.impl.ImportInvoiceDAO;
import vn.edu.hcmuaf.fit.model.ImageColor;
import vn.edu.hcmuaf.fit.model.ImportInvoice;
import vn.edu.hcmuaf.fit.until.HttpUtil;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "ImportInvoiceAPI", value = "/api/import-invoice")
public class ImportInvoiceAPI extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ObjectMapper mapper = new ObjectMapper();
        request.setCharacterEncoding("UTF-8");
        response.setContentType("application/json");
        ImportInvoice action = HttpUtil.of(request.getReader()).toModel(ImportInvoice.class);
        new ImportInvoiceDAO().save(action);
        mapper.writeValue(response.getOutputStream(), action);
    }

    @Override
    protected void doPut(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ObjectMapper mapper = new ObjectMapper();
        request.setCharacterEncoding("UTF-8");
        response.setContentType("application/json");

        ImportInvoice action = HttpUtil.of(request.getReader()).toModel(ImportInvoice.class);
        new ImportInvoiceDAO().update(action);
        mapper.writeValue(response.getOutputStream(), action);
    }

    @Override
    protected void doDelete(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ObjectMapper mapper = new ObjectMapper();
        request.setCharacterEncoding("UTF-8");
        response.setContentType("application/json");

        ImportInvoice action = HttpUtil.of(request.getReader()).toModel(ImportInvoice.class);
        new ImportInvoiceDAO().delete(action);
        mapper.writeValue(response.getOutputStream(), action);
    }
}
