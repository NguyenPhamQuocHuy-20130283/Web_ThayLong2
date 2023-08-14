package vn.edu.hcmuaf.fit.controller.user;

import vn.edu.hcmuaf.fit.constant.Variable;
import vn.edu.hcmuaf.fit.model.user.User;
import vn.edu.hcmuaf.fit.until.SessionUntil;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "logout", value = "/logout")
public class Logout extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        User user = (User) SessionUntil.get(request, Variable.Global.USER.toString());
        if (user != null) {
            SessionUntil.delItem(request, Variable.Global.USER.toString());
            SessionUntil.set(request, "type", "error");
            SessionUntil.set(request, "message", "dang xuat thanh cong");
            SessionUntil.delItem(request, "CART");

        }
        response.sendRedirect("/home?page=1&different=moi");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
