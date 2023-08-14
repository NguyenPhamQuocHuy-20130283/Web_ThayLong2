package vn.edu.hcmuaf.fit.controller.admin.manage.phone;

import vn.edu.hcmuaf.fit.dao.impl.*;
import vn.edu.hcmuaf.fit.model.common.State;
import vn.edu.hcmuaf.fit.model.phone.*;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(urlPatterns = {"/admin/manage/phone/edit"})
public class EditHandle extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String id = request.getParameter("id");
        int ids = 0;
        if (id != null) {
            ids = Integer.parseInt(id.trim());
            if (ids != 0) {
                Phone u = new PhoneDAO().get(" and id = " + ids, Phone.class, null).get();
                request.setAttribute("phone", u);
                List<Brand> brands = new BrandDAO().list("", Brand.class, null, null, null, null);
                List<Model> models = new ModelDAO().list("", Model.class, null, null, null, null);
                List<State> phoneStates = new StateDAO().list(" and table = 'phones'", State.class, null, null, null, null);

                List<Cap> caps = new CapDAO().list("", Cap.class, null, null, null, null);
                List<Sale> sales = new SaleDAO().list("", Sale.class, null, null, null, null);
                request.setAttribute("sales", sales);
                request.setAttribute("brands", brands);
                request.setAttribute("state", phoneStates);
                request.setAttribute("caps", caps);
                request.setAttribute("models", models);
            }
        }
        request.getRequestDispatcher("/views/admin/manage/phone/edit.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
