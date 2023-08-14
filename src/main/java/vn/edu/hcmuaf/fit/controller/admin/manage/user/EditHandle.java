package vn.edu.hcmuaf.fit.controller.admin.manage.user;

import vn.edu.hcmuaf.fit.dao.impl.PermissionActionDAO;
import vn.edu.hcmuaf.fit.dao.impl.UserDAO;
import vn.edu.hcmuaf.fit.dao.impl.StateDAO;
import vn.edu.hcmuaf.fit.model.common.State;
import vn.edu.hcmuaf.fit.model.user.PermissionAction;
import vn.edu.hcmuaf.fit.model.user.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(urlPatterns = {"/admin/manage/user/edit"})
public class EditHandle extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {


        String id = request.getParameter("id");
        String page = "";

        if (id != null) {
            User u = new UserDAO().get(" and id = " + id, User.class, null).get();
            request.setAttribute("u", u);
            List<State> us = new StateDAO().list("", State.class, null, null, null, null);
            request.setAttribute("us", us);
            page = "/views/admin/manage/user/edit.jsp";
        } else {
            String userId = request.getParameter("userId");
            String actionId = request.getParameter("actionId");
            PermissionAction permissionAction = new PermissionActionDAO().get(" and userId=" + userId + " and actionId=" + actionId, PermissionAction.class, null).get();
            request.setAttribute("p", permissionAction);
            page = "/views/admin/manage/permissionAction/edit.jsp";

        }
        request.getRequestDispatcher(page).forward(request, response);


    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
