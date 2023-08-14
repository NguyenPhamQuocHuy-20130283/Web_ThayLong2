package vn.edu.hcmuaf.fit.controller.admin.manage.phonecolor;

import vn.edu.hcmuaf.fit.dao.impl.ColorDAO;
import vn.edu.hcmuaf.fit.dao.impl.PhoneColorDAO;
import vn.edu.hcmuaf.fit.dao.impl.PhoneDAO;
import vn.edu.hcmuaf.fit.model.phone.Color;
import vn.edu.hcmuaf.fit.model.phone.Phone;
import vn.edu.hcmuaf.fit.model.phone.PhoneColor;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@WebServlet(urlPatterns = {"/admin/manage/phonecolor/edit"})
public class EditHandle extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String phoneId = request.getParameter("phoneId");
        String colorId = request.getParameter("colorId");
        if (phoneId != null && colorId != null) {
            PhoneColor phoneCap = new PhoneColorDAO().get(" and phoneId=" + phoneId + " and colorId=" + colorId, PhoneColor.class, null).get();
            request.setAttribute("pcolor", phoneCap);
            Phone phone = new PhoneDAO().get(" and id= " + phoneId, Phone.class, null).get();
            request.setAttribute("phone", phone);
            Map<String, List<Object>> map = new HashMap<>();
            List<Object> obs = new ArrayList<>(new PhoneColorDAO().listValue(" colorId ", " and phoneId=" + phone.getId(), Integer.class));
            map.put("id", obs);
            List<Color> actions1 = new ColorDAO().list(" and id not in (<id>)", Color.class, null, null, map, null);
            actions1.add(phoneCap._color());
            request.setAttribute("colors", actions1);
        }

        request.getRequestDispatcher("/views/admin/manage/phonecolor/edit.jsp").forward(request, response);

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
