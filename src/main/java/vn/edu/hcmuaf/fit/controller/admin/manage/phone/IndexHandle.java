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

@WebServlet(urlPatterns = {"/admin/manage/phone"})
public class IndexHandle extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id = request.getParameter("id");
        String page = "";
        int ids = 0;
        if (id != null) {
            ids = Integer.parseInt(id);
            if (ids != 0) {
                Phone phone = new PhoneDAO().get(" and id=" + ids, Phone.class, null, null).get();
                request.setAttribute("phone", phone);
                page = "/views/admin/manage/phone/detail.jsp";
            }
        } else {
            List<Phone> users = new PhoneDAO().list(" and isDelete = 0 or isDelete is null", Phone.class, null, null, null, null);
            request.setAttribute("phones", users);
            List<Brand> brands = new BrandDAO().list("", Brand.class, null, null, null, null);
            List<Model> models = new ModelDAO().list("", Model.class, null, null, null, null);
            List<State> phoneStates = new StateDAO().list(" and `table`='phones'", State.class, null, null, null, null);

            List<Cap> caps = new CapDAO().list("", Cap.class, null, null, null, null);
            List<Sale> sales = new SaleDAO().list("", Sale.class, null, null, null, null);
            request.setAttribute("sales", sales);
            request.setAttribute("brands", brands);
            request.setAttribute("state", phoneStates);
            request.setAttribute("caps", caps);
            request.setAttribute("models", models);
            page = "/views/admin/manage/phone/index.jsp";
        }
        request.getRequestDispatcher(page).forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
