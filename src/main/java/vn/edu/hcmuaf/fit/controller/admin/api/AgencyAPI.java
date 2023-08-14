package vn.edu.hcmuaf.fit.controller.admin.api;

import com.fasterxml.jackson.databind.ObjectMapper;
import vn.edu.hcmuaf.fit.dao.impl.ActionDAO;
import vn.edu.hcmuaf.fit.dao.impl.AgencyDAO;
import vn.edu.hcmuaf.fit.model.Agency;
import vn.edu.hcmuaf.fit.model.user.Action;
import vn.edu.hcmuaf.fit.until.HttpUtil;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "AgencyAPI", value = "/api/agency")
public class AgencyAPI extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ObjectMapper mapper = new ObjectMapper();
        request.setCharacterEncoding("UTF-8");
        response.setContentType("application/json");
        Agency action = HttpUtil.of(request.getReader()).toModel(Agency.class);
        new AgencyDAO().save(action);
        mapper.writeValue(response.getOutputStream(), action);
    }

    @Override
    protected void doPut(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ObjectMapper mapper = new ObjectMapper();
        request.setCharacterEncoding("UTF-8");
        response.setContentType("application/json");

        Agency action = HttpUtil.of(request.getReader()).toModel(Agency.class);
        new AgencyDAO().update(action);
        mapper.writeValue(response.getOutputStream(), action);
    }

    @Override
    protected void doDelete(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        ObjectMapper mapper = new ObjectMapper();
        request.setCharacterEncoding("UTF-8");
        response.setContentType("application/json");

        Agency action = HttpUtil.of(request.getReader()).toModel(Agency.class);
        new AgencyDAO().delete(action);
        mapper.writeValue(response.getOutputStream(), action);

    }
}
