package vn.edu.hcmuaf.fit.controller.admin.manage.promot;

import vn.edu.hcmuaf.fit.dao.impl.PromotDAO;
import vn.edu.hcmuaf.fit.model.phone.Promot;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(urlPatterns = {"/admin/manage/promot/edit"})
public class EditHandle extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String id = request.getParameter("id");
        int ids = 0;
        if (id != null) {
            ids = Integer.parseInt(id.trim());
            if (ids != 0) {
                Promot u = new PromotDAO().get(" and id = " + ids, Promot.class, null).get();
                request.setAttribute("promot", u);
            }
        }

        request.getRequestDispatcher("/views/admin/manage/promot/edit.jsp").forward(request, response);

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
