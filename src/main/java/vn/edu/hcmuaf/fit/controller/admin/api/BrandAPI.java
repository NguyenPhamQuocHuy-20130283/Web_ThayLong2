package vn.edu.hcmuaf.fit.controller.admin.api;

import com.fasterxml.jackson.databind.ObjectMapper;
import vn.edu.hcmuaf.fit.dao.AbstractDAO;
import vn.edu.hcmuaf.fit.dao.impl.BrandDAO;
import vn.edu.hcmuaf.fit.model.phone.Brand;
import vn.edu.hcmuaf.fit.until.HttpUtil;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet( value = "/api/brand")
public class BrandAPI extends HttpServlet {

    AbstractDAO<Brand> brandAbstractDAO = new AbstractDAO<>("brands");

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ObjectMapper mapper = new ObjectMapper();
        request.setCharacterEncoding("UTF-8");
        response.setContentType("application/json");
        String id = request.getParameter("id");

        if (id != null) {
            Brand users = new BrandDAO().get(" and id= " + id, Brand.class, null).get();
            mapper.writeValue(response.getOutputStream(), users);
        } else
            mapper.writeValue(response.getOutputStream(), "{}");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ObjectMapper mapper = new ObjectMapper();
        request.setCharacterEncoding("UTF-8");
        response.setContentType("application/json");
        Brand newModel = HttpUtil.of(request.getReader()).toModel(Brand.class);
        new BrandDAO().insertBrand(newModel);
        mapper.writeValue(response.getOutputStream(), newModel);
    }

    @Override
    protected void doPut(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ObjectMapper mapper = new ObjectMapper();
        request.setCharacterEncoding("UTF-8");
        response.setContentType("application/json");
        Brand newModel = HttpUtil.of(request.getReader()).toModel(Brand.class);
        new BrandDAO().updateBrand(newModel);
        mapper.writeValue(response.getOutputStream(), newModel);
    }

    @Override
    protected void doDelete(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ObjectMapper mapper = new ObjectMapper();
        request.setCharacterEncoding("UTF-8");
        response.setContentType("application/json");
        Brand newModel = HttpUtil.of(request.getReader()).toModel(Brand.class);
        new BrandDAO().deleteBrand(newModel);
        mapper.writeValue(response.getOutputStream(), "{}");

    }

}
