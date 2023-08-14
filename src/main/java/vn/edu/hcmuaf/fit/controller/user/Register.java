package vn.edu.hcmuaf.fit.controller.user;

import vn.edu.hcmuaf.fit.constant.Variable;
import vn.edu.hcmuaf.fit.dao.impl.ConfirmationTokenDAO;
import vn.edu.hcmuaf.fit.dao.impl.UserDAO;
import vn.edu.hcmuaf.fit.mail.MailVerify;
import vn.edu.hcmuaf.fit.model.user.User;
import vn.edu.hcmuaf.fit.until.SessionUntil;
import vn.edu.hcmuaf.fit.until.Validate;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.UUID;

@WebServlet(name = "register", value = "/register")
public class Register extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        request.getRequestDispatcher("/views/web/signup.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        Validate v = new Validate();

//        String email = request.getParameter("email");
//        String userName = request.getParameter("name");
//        String numberPhone = request.getParameter("phone");
        String address = request.getParameter("address");
//        String pass = request.getParameter("pass");
//

        String email = v.getField(request, "email", "email", true);
        String userName = v.getField(request, "name", "name", true);
        String numberPhone = v.getField(request, "phone", "phone", true);
//        email=  v.getField(request,"email","email",true);
        String pass = v.getField(request, "pass", "pass", true);

        if (new UserDAO().hasPhone(numberPhone)) {
            request.setAttribute("name", userName);
            request.setAttribute("address", address);
            request.setAttribute("email", email);
            SessionUntil.set(request, "type", "error");
            SessionUntil.set(request, "message", "sdt đã tồn tại vui lòng nhập sdt khác");
        }
        if (new UserDAO().hasEmail(email)) {
            request.setAttribute("name", userName);
            request.setAttribute("address", address);
            request.setAttribute("phone", numberPhone);
            SessionUntil.set(request, "type", "error");
            SessionUntil.set(request, "message", "email đã tồn tại vui lòng nhập email khác");
        }
        if (!new UserDAO().hasPhone(numberPhone) && !new UserDAO().hasEmail(email)) {
            User user = new User();
            user.setName(userName);
            user.setPhone(numberPhone);
            user.setAddress(address);
            user.setEmail(email);
            user.setMethod(Variable.Global.PASS.toString());
            user.setPassword(pass);
            user.setPermission(Variable.Global.USER.toString());
            user.setUserState("CHUA ACTIVE");
            new UserDAO().save(user);
            String code = UUID.randomUUID().toString();
            MailVerify.send(email, userName, email, code);
            new ConfirmationTokenDAO().save(code);
            SessionUntil.set(request, "type", "success");
            SessionUntil.set(request, "message", "kiem tra mail cua ban");
        }
        String page = "";
        if (v.getMap().isEmpty()) {
            page = "/home?page=1&different=moi";
        } else {
            SessionUntil.set(request, "error", v.getMap());
            request.setAttribute("error",v.getMap());
            page = "/views/web/signup.jsp";
        }

        request.getRequestDispatcher(page).forward(request, response);

    }

}
