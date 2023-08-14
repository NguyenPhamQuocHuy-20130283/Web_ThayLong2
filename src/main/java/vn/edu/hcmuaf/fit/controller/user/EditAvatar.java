package vn.edu.hcmuaf.fit.controller.user;

import com.google.gson.Gson;
import vn.edu.hcmuaf.fit.constant.Variable;
import vn.edu.hcmuaf.fit.dao.impl.UserDAO;
import vn.edu.hcmuaf.fit.helper.FileManage;
import vn.edu.hcmuaf.fit.model.user.User;
import vn.edu.hcmuaf.fit.until.SessionUntil;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import java.io.IOException;

@WebServlet(urlPatterns = {"/admin/users/edit-avatar"})
@MultipartConfig
public class EditAvatar extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            Part part = request.getPart("avatar");
            FileManage fileManage = new FileManage();
            String folder = request.getServletContext().getRealPath("/assets/images/user");
            String filename = null;
            User user = (User) SessionUntil.get(request, Variable.Global.USER.toString());
            if (part.getSize() != 0) {
                if (user.getAvatar() != null && !user.getAvatar().isEmpty()) {

                    fileManage.delete(user.getAvatar().substring(user.getAvatar().indexOf("/assets/images/user/")), folder);

                }
                filename = fileManage.upLoad(part, folder);
            }
            if (filename != null) {
                user.setAvatar("/assets/images/user/" + filename);
            }
            new UserDAO().updateAvatar(user);

            SessionUntil.set(request, Variable.Global.USER.toString(), user);
            String json = new Gson().toJson(user);
            response.setContentType("application/json");
            response.setCharacterEncoding("UTF-8");
            response.getWriter().write(json);
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
    }
}
