package vn.edu.hcmuaf.fit.controller.admin.api;

import com.fasterxml.jackson.databind.ObjectMapper;
import vn.edu.hcmuaf.fit.dao.impl.ModelDAO;
import vn.edu.hcmuaf.fit.model.phone.Model;
import vn.edu.hcmuaf.fit.until.HttpUtil;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(value = "/api/model")
public class ModelAPI extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ObjectMapper mapper = new ObjectMapper();
        request.setCharacterEncoding("UTF-8");
        response.setContentType("application/json");
        String id = request.getParameter("id");

        if (id != null) {
            Model users = new ModelDAO().get(" and id= " + id, Model.class, null).get();
            mapper.writeValue(response.getOutputStream(), users);
        } else
            mapper.writeValue(response.getOutputStream(), "{}");

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ObjectMapper mapper = new ObjectMapper();
        request.setCharacterEncoding("UTF-8");
        response.setContentType("application/json");
        Model model = HttpUtil.of(request.getReader()).toModel(Model.class);
        new ModelDAO().insertModel(model);
        mapper.writeValue(response.getOutputStream(), model);
    }

    @Override
    protected void doPut(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ObjectMapper mapper = new ObjectMapper();
        request.setCharacterEncoding("UTF-8");
        response.setContentType("application/json");
        Model model = HttpUtil.of(request.getReader()).toModel(Model.class);
        new ModelDAO().updateModel(model);
        mapper.writeValue(response.getOutputStream(), model);
    }

    @Override
    protected void doDelete(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ObjectMapper mapper = new ObjectMapper();
        request.setCharacterEncoding("UTF-8");
        response.setContentType("application/json");
        Model model = HttpUtil.of(request.getReader()).toModel(Model.class);
        new ModelDAO().deleteModel(model);
        mapper.writeValue(response.getOutputStream(), model);
    }

}
