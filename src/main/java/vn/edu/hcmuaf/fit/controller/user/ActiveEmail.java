package vn.edu.hcmuaf.fit.controller.user;

import vn.edu.hcmuaf.fit.constant.Variable;
import vn.edu.hcmuaf.fit.dao.AbstractDAO;
import vn.edu.hcmuaf.fit.dao.impl.ConfirmationTokenDAO;
import vn.edu.hcmuaf.fit.dao.impl.UserDAO;
import vn.edu.hcmuaf.fit.mail.MailVerify;
import vn.edu.hcmuaf.fit.model.user.ConfirmationToken;
import vn.edu.hcmuaf.fit.model.user.User;
import vn.edu.hcmuaf.fit.until.SessionUntil;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Timestamp;

@WebServlet(urlPatterns = {"/active"}, name = "active")
public class ActiveEmail extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String email = request.getParameter("email");
        String key = request.getParameter("key");
        String userName = request.getParameter("name");
        MailVerify.send(email, userName, email, key);
        new ConfirmationTokenDAO().save(key);
        SessionUntil.set(request, "type", "success");
        SessionUntil.set(request, "message", "kiem tra mail cua ban");
        request.getRequestDispatcher("/home?page=1&different=moi").forward(request, response);

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String email = request.getParameter("email");
        String key = request.getParameter("key");
        String page = "";
        ConfirmationToken confirmationToken = new AbstractDAO<ConfirmationToken>("confirmationtoken").get(" and token='" + key + "'", ConfirmationToken.class, null).orElse(null);
        if (confirmationToken != null && confirmationToken.getExpired_at().before(new Timestamp(System.currentTimeMillis()))) {
            SessionUntil.set(request, "type", "error");
            SessionUntil.set(request, "message", "token da het han vui long ban dang nhap lai");
            page = "/home?page=1&different=moi";
        } else if (confirmationToken != null && confirmationToken.getConfirmed_at() != null) {
            SessionUntil.set(request, "type", "error");
            SessionUntil.set(request, "message", "token da sd vui long ban dang nhap lai");
            page = "/home?page=1&different=moi";
        } else {

            new ConfirmationTokenDAO().active(key);
            new UserDAO().active(email);

            SessionUntil.delItem(request, Variable.Global.USER.toString());

            SessionUntil.set(request, Variable.Global.USER.toString(), new UserDAO().get(" and email='" + email + "'", User.class, null, null).get());
            SessionUntil.set(request, "type", "success");
            SessionUntil.set(request, "message", "ban da dang nhap thanh cong");
            page = "/user-profile";
        }
        response.sendRedirect(page);
    }

}
