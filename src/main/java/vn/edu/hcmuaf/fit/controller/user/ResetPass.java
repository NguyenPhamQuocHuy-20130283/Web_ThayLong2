package vn.edu.hcmuaf.fit.controller.user;

import org.mindrot.jbcrypt.BCrypt;
import vn.edu.hcmuaf.fit.dao.impl.ConfirmationTokenDAO;
import vn.edu.hcmuaf.fit.dao.impl.UserDAO;
import vn.edu.hcmuaf.fit.mail.MailVerify;
import vn.edu.hcmuaf.fit.model.user.User;
import vn.edu.hcmuaf.fit.until.SessionUntil;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.UUID;

@WebServlet(value = "/reset-pass")
public class ResetPass extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        request.getRequestDispatcher("/views/web/resetpass.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String email = request.getParameter("email");
        String pass = request.getParameter("pass");

        if (new UserDAO().hasEmail(email)) {
            User user = new UserDAO().get(" and email = '" + email + "'", User.class, null).get();
            String code = UUID.randomUUID().toString();
            MailVerify.send(email, user.getName(), user.getEmail(), code, BCrypt.hashpw(pass, BCrypt.gensalt(10)));
            new ConfirmationTokenDAO().save(code);
            SessionUntil.set(request, "type", "success");
            SessionUntil.set(request, "message", "kiem tra mail cua ban");
        }
        response.sendRedirect("/views/web/signup.jsp");
    }
}
