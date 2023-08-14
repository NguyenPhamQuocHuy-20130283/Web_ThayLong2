package vn.edu.hcmuaf.fit.controller.admin.manage.action;

import vn.edu.hcmuaf.fit.dao.impl.ActionDAO;
import vn.edu.hcmuaf.fit.model.user.Action;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(urlPatterns = {"/admin/manage/action/edit"})
public class EditHandle extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String id = request.getParameter("id");
        int ids = 0;
        if (id != null) {
            ids = Integer.parseInt(id.trim());
            if (ids != 0) {
                Action u = new ActionDAO().get(" and id = " + ids, Action.class, null).get();
                request.setAttribute("action", u);
            }
        }

        request.getRequestDispatcher("/views/admin/manage/action/edit.jsp").forward(request, response);

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
