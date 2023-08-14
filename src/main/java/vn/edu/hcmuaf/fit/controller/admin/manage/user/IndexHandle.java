package vn.edu.hcmuaf.fit.controller.admin.manage.user;

import vn.edu.hcmuaf.fit.dao.impl.ActionDAO;
import vn.edu.hcmuaf.fit.dao.impl.PermissionActionDAO;
import vn.edu.hcmuaf.fit.dao.impl.StateDAO;
import vn.edu.hcmuaf.fit.dao.impl.UserDAO;
import vn.edu.hcmuaf.fit.model.common.State;
import vn.edu.hcmuaf.fit.model.user.Action;
import vn.edu.hcmuaf.fit.model.user.PermissionAction;
import vn.edu.hcmuaf.fit.model.user.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@WebServlet(urlPatterns = {"/admin/manage/user"})
public class IndexHandle extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id = request.getParameter("id");
        String page = "";
        int ids = 0;
        if (id != null) {
            ids = Integer.parseInt(id);
            if (ids != 0) {
                List<PermissionAction> actions = new PermissionActionDAO().list(" and userId= " + ids, PermissionAction.class, null, null, null, null);
                request.setAttribute("actions", actions);
                User user = new UserDAO().get(" and id=" + ids, User.class, null).get();
                request.setAttribute("user", user);
                Map<String, List<Object>> map = new HashMap<>();
                List<Object> obs = new ArrayList<>(new PermissionActionDAO().listValue(" actionId ", " and userId=" + user.getId(), Integer.class));
                map.put("id", obs);
                List<Action> actions1 = new ActionDAO().list(" and id not in (<id>)", Action.class, null, null, map, null);
                request.setAttribute("actions1", actions1);
                page = "/views/admin/manage/permissionAction/index.jsp";

            }
        } else {
            List<State> us = new StateDAO().list(" and `table`='users'", State.class, null, null, null, null);
            List<User> users = new UserDAO().list(" and isDelete = 0 or isDelete is null", User.class, null, null, null, null);
            request.setAttribute("users", users);
            request.setAttribute("us", us);
            page = "/views/admin/manage/user/index.jsp";
        }
        request.getRequestDispatcher(page).forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
