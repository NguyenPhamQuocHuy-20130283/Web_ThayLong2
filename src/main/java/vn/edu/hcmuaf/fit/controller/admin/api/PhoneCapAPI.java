package vn.edu.hcmuaf.fit.controller.admin.api;

import com.fasterxml.jackson.databind.ObjectMapper;
import vn.edu.hcmuaf.fit.dao.impl.PhoneCapDAO;
import vn.edu.hcmuaf.fit.model.phone.PhoneCap;
import vn.edu.hcmuaf.fit.until.HttpUtil;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(value = "/api/phone-cap")
public class PhoneCapAPI extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ObjectMapper mapper = new ObjectMapper();
        request.setCharacterEncoding("UTF-8");
        response.setContentType("application/json");
        String id = request.getParameter("phoneId");
        String id2 = request.getParameter("capId");

        if (id != null && id2 != null) {
            PhoneCap permissionAction = new PhoneCapDAO().get(" and phoneId=" + id + " and capId=" + id2, PhoneCap.class, null).get();
            mapper.writeValue(response.getOutputStream(), permissionAction);
        } else
            mapper.writeValue(response.getOutputStream(), "{}");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ObjectMapper mapper = new ObjectMapper();
        request.setCharacterEncoding("UTF-8");
        response.setContentType("application/json");
        PhoneCap permissionAction = HttpUtil.of(request.getReader()).toModel(PhoneCap.class);
        new PhoneCapDAO().insertPhoneCap(permissionAction);
        mapper.writeValue(response.getOutputStream(), permissionAction);
    }

    @Override
    protected void doPut(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        ObjectMapper mapper = new ObjectMapper();
        request.setCharacterEncoding("UTF-8");
        response.setContentType("application/json");

        PhoneCap permissionAction = HttpUtil.of(request.getReader()).toModel(PhoneCap.class);
        if (new PhoneCapDAO().updateCap(permissionAction)) {
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
        PhoneCap permissionAction = HttpUtil.of(request.getReader()).toModel(PhoneCap.class);
        new PhoneCapDAO().deleteCap(permissionAction);
        mapper.writeValue(response.getOutputStream(), "{}");
    }

}
