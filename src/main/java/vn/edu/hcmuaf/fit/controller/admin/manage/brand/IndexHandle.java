package vn.edu.hcmuaf.fit.controller.admin.manage.brand;

import vn.edu.hcmuaf.fit.dao.impl.BrandDAO;
import vn.edu.hcmuaf.fit.model.phone.Brand;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(urlPatterns = {"/admin/manage/brand"})
public class IndexHandle extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Brand> users = new BrandDAO().list("", Brand.class, null, null, null, null);
        request.setAttribute("brands", users);

        request.getRequestDispatcher("/views/admin/manage/brand/index.jsp").forward(request, response);

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
