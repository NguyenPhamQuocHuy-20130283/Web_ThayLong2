package vn.edu.hcmuaf.fit.controller.admin.api;

import com.fasterxml.jackson.databind.ObjectMapper;
import vn.edu.hcmuaf.fit.dao.impl.PayDAO;
import vn.edu.hcmuaf.fit.dao.impl.SocialAcountDAO;
import vn.edu.hcmuaf.fit.model.Pay;
import vn.edu.hcmuaf.fit.model.SocialAcount;
import vn.edu.hcmuaf.fit.until.HttpUtil;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "SocialAcountAPI", value = "/api/social-acount")
public class SocialAcountAPI extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ObjectMapper mapper = new ObjectMapper();
        request.setCharacterEncoding("UTF-8");
        response.setContentType("application/json");
        SocialAcount action = HttpUtil.of(request.getReader()).toModel(SocialAcount.class);
        new SocialAcountDAO().save(action);
        mapper.writeValue(response.getOutputStream(), action);
    }

    @Override
    protected void doPut(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ObjectMapper mapper = new ObjectMapper();
        request.setCharacterEncoding("UTF-8");
        response.setContentType("application/json");

        SocialAcount action = HttpUtil.of(request.getReader()).toModel(SocialAcount.class);
        new SocialAcountDAO().update(action);
        mapper.writeValue(response.getOutputStream(), action);
    }

    @Override
    protected void doDelete(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ObjectMapper mapper = new ObjectMapper();
        request.setCharacterEncoding("UTF-8");
        response.setContentType("application/json");

        SocialAcount action = HttpUtil.of(request.getReader()).toModel(SocialAcount.class);
        new SocialAcountDAO().delete(action);
        mapper.writeValue(response.getOutputStream(), action);
    }
}
