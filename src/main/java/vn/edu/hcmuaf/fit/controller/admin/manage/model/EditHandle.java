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

@WebServlet(urlPatterns = {"/admin/manage/model/edit"})
public class EditHandle extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String id = request.getParameter("id");
        int ids = 0;
        if (id != null) {
            ids = Integer.parseInt(id.trim());
            if (ids != 0) {
                Model u = new ModelDAO().get(" and id = " + ids, Model.class, null).get();
                request.setAttribute("model", u);
            }
        }
        List<Brand> lbrand = new BrandDAO().list("", Brand.class, null, null, null, null);
        request.setAttribute("brands", lbrand);

        request.getRequestDispatcher("/views/admin/manage/model/edit.jsp").forward(request, response);

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
