package vn.edu.hcmuaf.fit.controller.user;

import org.mindrot.jbcrypt.BCrypt;
import vn.edu.hcmuaf.fit.constant.Variable;
import vn.edu.hcmuaf.fit.dao.impl.UserDAO;
import vn.edu.hcmuaf.fit.model.user.User;
import vn.edu.hcmuaf.fit.until.CookieUntil;
import vn.edu.hcmuaf.fit.until.SessionUntil;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

@WebServlet(name = "login", value = "/login")
public class Login extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {


        String userName = request.getParameter("fEmail");
        String userPass = request.getParameter("fPass");
        String remember = request.getParameter("remember");
        String page = "";
        Map<String, String> errors = new HashMap<>();

        User user = new UserDAO().get(" and email='" + userName + "'", User.class, null, null).orElse(null);
        if (user != null) {
            if (user.getMethod().equals(Variable.Global.PASS.toString())) {
                if (BCrypt.checkpw(userPass, user.getPassword())) {
                    if (!user.isActive()) {
                        String code = UUID.randomUUID().toString();
                        SessionUntil.set(request, "type", "success");
                        SessionUntil.set(request, "message", "Vui lòng xác thực tài khoản trong email của bạn trong thoi gian 10p");
                        response.sendRedirect("/active?email=" + userName + "&key=" + code + "&name=" + user.getName());
                    } else {
                        if (remember != null) {
                            CookieUntil.add("username", userName, 3, response);
                            CookieUntil.add("password", userPass, 3, response);
                        }
                        if (remember == null) {
                            CookieUntil.add("username", userName, 0, response);
                            CookieUntil.add("password", userPass, 0, response);
                        }
                        SessionUntil.set(request, Variable.Global.USER.toString(), user);
                    }

                } else {
                    String failedAttempts = CookieUntil.get("failedAttempts", request);
                    if (failedAttempts != null) {
                        int n = Integer.parseInt(failedAttempts);
                        n++;
                        CookieUntil.addM("failedAttempts", n + "", 15, response);
                    } else {

                        CookieUntil.addM("failedAttempts", "1", 15, response);

                    }
                    errors.put("password", " sai mat khau vui long nhap lai");
                }

            } else {
//                request.setAttribute("email", userName);
//                request.setAttribute("type", "error");
                errors.put("email", "email nay chua dang ky mat khau");
            }
        } else {
            errors.put("email", "email khong ton tai");
        }
        if (!errors.isEmpty()) {
            SessionUntil.set(request, "error", errors);
            page = "/home?page=1&different=moi";
        } else {
            SessionUntil.set(request, "type", "success");
            SessionUntil.set(request, "massage", "dang nhap thanh cong");
            if (user.getPermission().equals(Variable.Global.ADMIN.toString()))
                page = "/admin/home";
            if (user.getPermission().equals(Variable.Global.USER.toString()))
                page = "/user-profile";
        }
        response.sendRedirect(page);


    }


}