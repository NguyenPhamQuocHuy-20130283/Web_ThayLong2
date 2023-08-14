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

@WebServlet(urlPatterns = {"/admin/manage/phonecolor"})
public class IndexHandle extends HttpServlet {


    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String id = request.getParameter("id");
        List<PhoneColor> phoneCaps = new ArrayList<>();
        if (id != null) {

            phoneCaps = new PhoneColorDAO().list(" and phoneId =" + id, PhoneColor.class, null, null, null, null);
            Phone phone = new PhoneDAO().get(" and id=" + id, Phone.class, null).get();
            request.setAttribute("phone", phone);

            Map<String, List<Object>> map = new HashMap<>();
            List<Object> obs = new ArrayList<>(new PhoneColorDAO().listValue(" colorId ", " and phoneId=" + phone.getId(), Integer.class));
            map.put("id", obs);
            List<Color> actions1 = new ColorDAO().list(" and id not in (<id>)", Color.class, null, null, map, null);
            request.setAttribute("colors", actions1);

        }
        request.setAttribute("pcolor", phoneCaps);
        request.getRequestDispatcher("/views/admin/manage/phonecolor/index.jsp").forward(request, response);

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

}
