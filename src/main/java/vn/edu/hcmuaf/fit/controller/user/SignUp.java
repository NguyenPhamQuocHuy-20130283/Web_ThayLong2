package vn.edu.hcmuaf.fit.controller.user;

import vn.edu.hcmuaf.fit.constant.Variable;
import vn.edu.hcmuaf.fit.dao.impl.UserDAO;
import vn.edu.hcmuaf.fit.model.user.User;
import vn.edu.hcmuaf.fit.until.SessionUntil;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

@WebServlet(urlPatterns = {"/signup-google"})
public class SignUp extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String email = (String) SessionUntil.get(request, "GOOGLE");

        User user = new UserDAO().get(" and email ='" + email + "'", User.class, null).orElse(null);
        if (email != null && user != null && !user.getMethod().equals(Variable.Global.PASS.toString()) && !user.isActive()) {
            request.setAttribute("user", user);
            request.getRequestDispatcher("/views/web/signin.jsp").forward(request, response);

        } else {
            SessionUntil.set(request, "type", "error");
            SessionUntil.set(request, "message", "loi");
            response.sendRedirect("/register");
        }

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String numberPhone = request.getParameter("phone");
        String address = request.getParameter("address");
        String email = request.getParameter("email");
        Map<String, String> map = new HashMap<>();
        String page = "";
        User user = new UserDAO().get(" and email='" + email + "' and active =false and method <> 'PASS'", User.class, null).orElse(null);
        if (user != null && !(new UserDAO().hasPhone(numberPhone))) {
            user.setPhone(numberPhone);
            user.setAddress(address);
            user.setActive(true);
            user.setEnable(true);
            user.setUserState("DANG HOAT DONG");
            new UserDAO().update(user);
            SessionUntil.delItem(request, "GOOGLE");
            SessionUntil.set(request, Variable.Global.USER.toString(), user);
            page = "/home?page=1&different=moi";
        } else {
            map.put("phone", "sdt đã tồn tại vui lòng nhập sdt khác");
            page = "/signup-google";
        }
        SessionUntil.set(request, "error", map);
        response.sendRedirect(page);
    }
}
