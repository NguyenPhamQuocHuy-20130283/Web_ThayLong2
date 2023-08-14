package vn.edu.hcmuaf.fit.controller.admin.manage.spec;

import vn.edu.hcmuaf.fit.dao.impl.SpecDAO;
import vn.edu.hcmuaf.fit.dao.impl.SpecTypeDAO;
import vn.edu.hcmuaf.fit.model.phone.Spec;
import vn.edu.hcmuaf.fit.model.phone.SpecType;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(urlPatterns = {"/admin/manage/spec/edit"})
public class EditHandle extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id = request.getParameter("id");
        int ids = 0;
        if (id != null) {
            ids = Integer.parseInt(id.trim());
            if (ids != 0) {
                Spec u = new SpecDAO().get(" and id = " + ids, Spec.class, null).get();
                request.setAttribute("spec", u);
            }
        }
        List<SpecType> specTypes = new SpecTypeDAO().list("", SpecType.class, null, null, null, null);
        request.setAttribute("specTs", specTypes);
        request.getRequestDispatcher("/views/admin/manage/spec/edit.jsp").forward(request, response);

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
