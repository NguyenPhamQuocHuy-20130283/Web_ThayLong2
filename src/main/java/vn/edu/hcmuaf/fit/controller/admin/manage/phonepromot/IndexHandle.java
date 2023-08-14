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

@WebServlet(urlPatterns = {"/admin/manage/phonepromot"})
public class IndexHandle extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id = request.getParameter("id");
        List<PhonePromot> phoneCaps = new ArrayList<>();
        if (id != null) {

            phoneCaps = new PhonePromotDAO().list(" and phoneId =" + id, PhonePromot.class, null, null, null, null);
            Phone phone = new PhoneDAO().get(" and id=" + id, Phone.class, null).get();
            request.setAttribute("phone", phone);
            Map<String, List<Object>> map = new HashMap<>();
            List<Object> obs = new ArrayList<>(new PhonePromotDAO().listValue(" promotId ", " and phoneId=" + phone.getId(), Integer.class));
            map.put("id", obs);
            List<Promot> actions1 = new PromotDAO().list(" and id not in (<id>)", Promot.class, null, null, map, null);
            request.setAttribute("promots", actions1);
        }
        request.setAttribute("ppromot", phoneCaps);
        request.getRequestDispatcher("/views/admin/manage/phonepromot/index.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
