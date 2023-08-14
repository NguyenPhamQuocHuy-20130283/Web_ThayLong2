package vn.edu.hcmuaf.fit.controller.user;

import org.mindrot.jbcrypt.BCrypt;
import vn.edu.hcmuaf.fit.constant.Variable;
import vn.edu.hcmuaf.fit.dao.impl.UserDAO;
import vn.edu.hcmuaf.fit.model.user.User;
import vn.edu.hcmuaf.fit.until.SessionUntil;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "ChangePass", value = "/change-pass")
public class ChangePass extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        User u = (User) SessionUntil.get(request, Variable.Global.USER.toString());
        String passOld = request.getParameter("pass-old");
        String passN = request.getParameter("pass-new");
        String log = request.getParameter("log");
        String page = "";
        if (new UserDAO().checkPass(u, passOld)) {
            if (!new UserDAO().checkPass(u, passN)) {
                if (new UserDAO().updatePass(u, BCrypt.hashpw(passN, BCrypt.gensalt(10)))) {
                    SessionUntil.set(request, "type", "success");
                    SessionUntil.set(request, "message", "da cap nhat thanh cong");
                    if (log == null)
                        page = "/logout";
                    else
                        page = "/user-profile";
                } else {
                    SessionUntil.set(request, "type", "error");
                    SessionUntil.set(request, "message", "cap nhat that bai");
                    page = "/user-profile";
                }

            } else {
                SessionUntil.set(request, "type", "error");
                SessionUntil.set(request, "message", "mat khau moi khong dc trung mat khau cu");
                page = "/user-profile";
            }
        } else {
            SessionUntil.set(request, "type", "error");
            SessionUntil.set(request, "message", "mat khau cu ko dung");
            page = "/user-profile";
        }
        response.sendRedirect(page);

    }
}
