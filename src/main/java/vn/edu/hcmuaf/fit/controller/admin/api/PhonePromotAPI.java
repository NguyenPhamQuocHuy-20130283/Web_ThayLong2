package vn.edu.hcmuaf.fit.controller.admin.api;

import com.fasterxml.jackson.databind.ObjectMapper;
import vn.edu.hcmuaf.fit.dao.impl.PhonePromotDAO;
import vn.edu.hcmuaf.fit.model.phone.PhonePromot;
import vn.edu.hcmuaf.fit.until.HttpUtil;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(value = "/api/phone-promot")
public class PhonePromotAPI extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ObjectMapper mapper = new ObjectMapper();
        request.setCharacterEncoding("UTF-8");
        response.setContentType("application/json");
        String id = request.getParameter("phoneId");
        String id2 = request.getParameter("promotId");

        if (id != null && id2 != null) {
            PhonePromot permissionAction = new PhonePromotDAO().get(" and phoneId=" + id + " and promotId=" + id2, PhonePromot.class, null).get();
            mapper.writeValue(response.getOutputStream(), permissionAction);
        } else
            mapper.writeValue(response.getOutputStream(), "{}");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ObjectMapper mapper = new ObjectMapper();
        request.setCharacterEncoding("UTF-8");
        response.setContentType("application/json");
        PhonePromot permissionAction = HttpUtil.of(request.getReader()).toModel(PhonePromot.class);
        new PhonePromotDAO().insertPhonePromot(permissionAction);
        mapper.writeValue(response.getOutputStream(), permissionAction);
    }

    @Override
    protected void doPut(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        ObjectMapper mapper = new ObjectMapper();
        request.setCharacterEncoding("UTF-8");
        response.setContentType("application/json");

        PhonePromot permissionAction = HttpUtil.of(request.getReader()).toModel(PhonePromot.class);
        if (new PhonePromotDAO().updatePromot(permissionAction)) {
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
        PhonePromot permissionAction = HttpUtil.of(request.getReader()).toModel(PhonePromot.class);
        new PhonePromotDAO().deletePhonePromot(permissionAction);
        mapper.writeValue(response.getOutputStream(), "{}");
    }

}
