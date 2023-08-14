package vn.edu.hcmuaf.fit.controller.admin.manage.model;

import vn.edu.hcmuaf.fit.dao.impl.BrandDAO;
import vn.edu.hcmuaf.fit.dao.impl.ModelDAO;
import vn.edu.hcmuaf.fit.model.phone.Brand;
import vn.edu.hcmuaf.fit.model.phone.Model;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(urlPatterns = {"/admin/manage/model"})
public class IndexHandle extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Model> users = new ModelDAO().list("", Model.class, null, null, null, null);
        request.setAttribute("models", users);
        List<Brand> brands = new BrandDAO().list("", Brand.class, null, null, null, null);
        request.setAttribute("brands", brands);

        request.getRequestDispatcher("/views/admin/manage/model/index.jsp").forward(request, response);

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
