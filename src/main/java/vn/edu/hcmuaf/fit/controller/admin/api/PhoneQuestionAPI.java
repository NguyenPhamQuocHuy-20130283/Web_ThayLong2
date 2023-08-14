package vn.edu.hcmuaf.fit.controller.admin.api;

import com.fasterxml.jackson.databind.ObjectMapper;
import vn.edu.hcmuaf.fit.dao.impl.PayDAO;
import vn.edu.hcmuaf.fit.dao.impl.PhoneQuestionDAO;
import vn.edu.hcmuaf.fit.model.Pay;
import vn.edu.hcmuaf.fit.model.PhoneQuestion;
import vn.edu.hcmuaf.fit.until.HttpUtil;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "PhoneQuestionAPI", value = "/api/phone-question")
public class PhoneQuestionAPI extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ObjectMapper mapper = new ObjectMapper();
        request.setCharacterEncoding("UTF-8");
        response.setContentType("application/json");
        PhoneQuestion action = HttpUtil.of(request.getReader()).toModel(PhoneQuestion.class);
        new PhoneQuestionDAO().save(action);
        mapper.writeValue(response.getOutputStream(), action);
    }

    @Override
    protected void doPut(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ObjectMapper mapper = new ObjectMapper();
        request.setCharacterEncoding("UTF-8");
        response.setContentType("application/json");

        PhoneQuestion action = HttpUtil.of(request.getReader()).toModel(PhoneQuestion.class);
        new PhoneQuestionDAO().update(action);
        mapper.writeValue(response.getOutputStream(), action);
    }

    @Override
    protected void doDelete(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ObjectMapper mapper = new ObjectMapper();
        request.setCharacterEncoding("UTF-8");
        response.setContentType("application/json");

        PhoneQuestion action = HttpUtil.of(request.getReader()).toModel(PhoneQuestion.class);
        new PhoneQuestionDAO().delete(action);
        mapper.writeValue(response.getOutputStream(), action);
    }
}
