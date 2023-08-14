package vn.edu.hcmuaf.fit.controller.admin.api;

import com.fasterxml.jackson.databind.ObjectMapper;
import vn.edu.hcmuaf.fit.dao.impl.PhoneSpecDAO;
import vn.edu.hcmuaf.fit.model.phone.PhoneSpec;
import vn.edu.hcmuaf.fit.until.HttpUtil;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(value = "/api/phone-spec")
public class PhoneSpecAPI extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ObjectMapper mapper = new ObjectMapper();
        request.setCharacterEncoding("UTF-8");
        response.setContentType("application/json");
        String id = request.getParameter("phoneId");
        String id2 = request.getParameter("specId");

        if (id != null && id2 != null) {
            PhoneSpec permissionAction = new PhoneSpecDAO().get(" and phoneId=" + id + " and specId=" + id2, PhoneSpec.class, null).get();
            mapper.writeValue(response.getOutputStream(), permissionAction);
        } else
            mapper.writeValue(response.getOutputStream(), "{}");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ObjectMapper mapper = new ObjectMapper();
        request.setCharacterEncoding("UTF-8");
        response.setContentType("application/json");
        PhoneSpec permissionAction = HttpUtil.of(request.getReader()).toModel(PhoneSpec.class);
        new PhoneSpecDAO().updateSpec(permissionAction);
        mapper.writeValue(response.getOutputStream(), permissionAction);
    }

    @Override
    protected void doPut(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        ObjectMapper mapper = new ObjectMapper();
        request.setCharacterEncoding("UTF-8");
        response.setContentType("application/json");

        PhoneSpec permissionAction = HttpUtil.of(request.getReader()).toModel(PhoneSpec.class);
        if (new PhoneSpecDAO().updateSpec(permissionAction)) {
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
        PhoneSpec permissionAction = HttpUtil.of(request.getReader()).toModel(PhoneSpec.class);
        new PhoneSpecDAO().deleteSpec(permissionAction);
        mapper.writeValue(response.getOutputStream(), "{}");
    }

}
