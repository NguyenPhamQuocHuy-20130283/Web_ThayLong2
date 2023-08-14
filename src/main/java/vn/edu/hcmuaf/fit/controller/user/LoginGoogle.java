package vn.edu.hcmuaf.fit.controller.user;

import org.apache.log4j.Logger;
import vn.edu.hcmuaf.fit.common.GooglePojo;
import vn.edu.hcmuaf.fit.common.GoogleUtils;
import vn.edu.hcmuaf.fit.constant.Variable;
import vn.edu.hcmuaf.fit.dao.impl.UserDAO;
import vn.edu.hcmuaf.fit.model.user.User;
import vn.edu.hcmuaf.fit.until.SessionUntil;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;


@WebServlet("/login-google")
public class LoginGoogle extends HttpServlet {
    private static final long serialVersionUID = 1L;
    static final Logger LOGGER = Logger.getLogger(LoginGoogle.class);

    public LoginGoogle() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String code = request.getParameter("code");
        String page = "";
        if (code == null || code.isEmpty()) {
            RequestDispatcher dis = request.getRequestDispatcher("/home?page=1&different=moi");
            dis.forward(request, response);
        } else {
            String accessToken = GoogleUtils.getToken(code);
            GooglePojo googlePojo = GoogleUtils.getUserInfo(accessToken);
            User user = new UserDAO().get(" and email='" + googlePojo.getEmail() + "' and method='GOOGLE'", User.class, null).orElse(null);
            if (user == null) {
                User user1 = new User();
                user1.setAvatar(googlePojo.getPicture());
                user1.setEmail(googlePojo.getEmail());
                user1.setName(googlePojo.getName());
                user1.setMethod(Variable.Global.GOOGLE.toString());
                user1.setPermission(Variable.Global.USER.toString());
                user1.setUserState("CHUA ACTIVE");
                user1.setEnable(false);
                user1.setActive(false);
                new UserDAO().save2(user1);
                SessionUntil.set(request, "GOOGLE", googlePojo.getEmail());
                page = "/signup-google";
            } else {
                if (user.isActive()) {
                    user.setUserState("DANG HOAT DONG");
                    SessionUntil.set(request, Variable.Global.USER.toString(), user);
                    SessionUntil.set(request, "type", "success");
                    SessionUntil.set(request, "message", " dang nhap thanh cong");

                    LOGGER.info("logined ");
                    page = "/home?page=1&different=moi";
                } else {
                    SessionUntil.set(request, "GOOGLE", googlePojo.getEmail());
                    page = "/signup-google";
                }
            }
        }
        response.sendRedirect(page);

    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }

}