package vn.edu.hcmuaf.fit.controller.admin.manage.cap;

import vn.edu.hcmuaf.fit.dao.impl.CapDAO;
import vn.edu.hcmuaf.fit.model.phone.Cap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(urlPatterns = {"/admin/manage/cap"})
public class IndexHandle extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Cap> users = new CapDAO().list("", Cap.class, null, null, null, null);
        request.setAttribute("caps", users);
        request.getRequestDispatcher("/views/admin/manage/cap/index.jsp").forward(request, response);

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
