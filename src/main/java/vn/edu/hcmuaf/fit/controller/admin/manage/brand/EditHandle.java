package vn.edu.hcmuaf.fit.controller.admin.manage.brand;

import vn.edu.hcmuaf.fit.dao.impl.BrandDAO;
import vn.edu.hcmuaf.fit.dao.impl.SaleDAO;
import vn.edu.hcmuaf.fit.model.phone.Brand;
import vn.edu.hcmuaf.fit.model.phone.Sale;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(urlPatterns = {"/admin/manage/brand/edit"})
public class EditHandle extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id = request.getParameter("id");
        int ids = 0;
        if (id != null) {
            ids = Integer.parseInt(id.trim());
            if (ids != 0) {
                Brand u = new BrandDAO().get(" and id = " + ids, Brand.class, null).get();
                request.setAttribute("brand", u);
            }
        }


        request.getRequestDispatcher("/views/admin/manage/brand/edit.jsp").forward(request, response);

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
