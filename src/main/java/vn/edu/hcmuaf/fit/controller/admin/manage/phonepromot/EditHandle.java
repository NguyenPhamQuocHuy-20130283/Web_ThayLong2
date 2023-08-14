package vn.edu.hcmuaf.fit.controller.admin.manage.phonepromot;

import vn.edu.hcmuaf.fit.dao.impl.PhoneDAO;
import vn.edu.hcmuaf.fit.dao.impl.PhonePromotDAO;
import vn.edu.hcmuaf.fit.dao.impl.PromotDAO;
import vn.edu.hcmuaf.fit.model.phone.Phone;
import vn.edu.hcmuaf.fit.model.phone.PhonePromot;
import vn.edu.hcmuaf.fit.model.phone.Promot;

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

@WebServlet(urlPatterns = {"/admin/manage/phonepromot/edit"})
public class EditHandle extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String phoneId = request.getParameter("phoneId");
        String promotId = request.getParameter("promotId");
        if (phoneId != null && promotId != null) {

            PhonePromot phoneCap = new PhonePromotDAO().get(" and phoneId=" + phoneId + " and promotId=" + promotId, PhonePromot.class, null).get();
            request.setAttribute("ppromot", phoneCap);
            Phone phone = new PhoneDAO().get(" and id= " + phoneId, Phone.class, null).get();
            request.setAttribute("phone", phone);
            Map<String, List<Object>> map = new HashMap<>();
            List<Object> obs = new ArrayList<>(new PhonePromotDAO().listValue(" promotId ", " and phoneId=" + phone.getId(), Integer.class));
            map.put("id", obs);
            List<Promot> actions1 = new PromotDAO().list(" and id not in (<id>)", Promot.class, null, null, map, null);
            actions1.add(phoneCap._promot());
            request.setAttribute("promots", actions1);
        }


        request.getRequestDispatcher("/views/admin/manage/phonepromot/edit.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
