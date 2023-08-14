package vn.edu.hcmuaf.fit.controller.user;

import org.apache.commons.validator.routines.EmailValidator;
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

@WebServlet(urlPatterns = {"/user-profile"})
public class UserController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("/views/web/user.jsp#panel21").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws
            ServletException, IOException {
        User u = (User) SessionUntil.get(request, Variable.Global.USER.toString());
        String name = request.getParameter("name");
        String gender = request.getParameter("gender");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        String address = request.getParameter("address");
        Map<String, String> map = new HashMap<>();

        if (!EmailValidator.getInstance().isValid(email))
            map.put("email", "email ko dung dinh dang");
        if (new UserDAO().hasEmail(email)) {
            map.put("email", "mail da ton tai");
        }
        if (new UserDAO().hasPhone(phone)) {
            map.put("phone", "phone da ton tai");
        }


        u.setName(name);
        u.setGender((Integer.parseInt(gender) == 1));
        u.setEmail(email);
        u.setPhone(phone);
        u.setAddress(address);


        if (new UserDAO().update(u)) {
            SessionUntil.set(request, "type", "success");
            SessionUntil.set(request, "message", "da cap nhat thanh cong");
        }
        response.sendRedirect("/user-profile");
    }
}
