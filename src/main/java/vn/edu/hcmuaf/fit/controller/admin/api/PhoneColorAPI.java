package vn.edu.hcmuaf.fit.controller.admin.api;

import com.fasterxml.jackson.databind.ObjectMapper;
import vn.edu.hcmuaf.fit.dao.impl.PhoneColorDAO;
import vn.edu.hcmuaf.fit.model.phone.PhoneColor;
import vn.edu.hcmuaf.fit.until.HttpUtil;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(value = "/api/phone-color")
public class PhoneColorAPI extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ObjectMapper mapper = new ObjectMapper();
        request.setCharacterEncoding("UTF-8");
        response.setContentType("application/json");
        String id = request.getParameter("phoneId");
        String id2 = request.getParameter("colorId");

        if (id != null && id2 != null) {
            PhoneColor permissionAction = new PhoneColorDAO().get(" and phoneId=" + id + " and colorId=" + id2, PhoneColor.class, null).get();
            mapper.writeValue(response.getOutputStream(), permissionAction);
        } else
            mapper.writeValue(response.getOutputStream(), "{}");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ObjectMapper mapper = new ObjectMapper();
        request.setCharacterEncoding("UTF-8");
        response.setContentType("application/json");
        PhoneColor permissionAction = HttpUtil.of(request.getReader()).toModel(PhoneColor.class);
        new PhoneColorDAO().savePhoneColor(permissionAction);
        mapper.writeValue(response.getOutputStream(), permissionAction);
    }

    @Override
    protected void doPut(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        ObjectMapper mapper = new ObjectMapper();
        request.setCharacterEncoding("UTF-8");
        response.setContentType("application/json");

        PhoneColor permissionAction = HttpUtil.of(request.getReader()).toModel(PhoneColor.class);
        if (new PhoneColorDAO().updatePhoneColor(permissionAction)) {
            mapper.writeValue(response.getOutputStream(), permissionAction);
        } else {
            mapper.writeValue(response.getOutputStream(), "{}");
        }

    }

    @Override
    protected void doDelete(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        ObjectMapper mapper = new ObjectMapper();
        request.setCharacterEncoding("UTF-8");
        response.setContentType("application/json");
        PhoneColor permissionAction = HttpUtil.of(request.getReader()).toModel(PhoneColor.class);
        new PhoneColorDAO().deleteColor(permissionAction);
        mapper.writeValue(response.getOutputStream(), "{}");
    }

}
