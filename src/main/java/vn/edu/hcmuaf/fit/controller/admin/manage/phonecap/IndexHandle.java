package vn.edu.hcmuaf.fit.controller.admin.manage.phonecap;

import vn.edu.hcmuaf.fit.dao.impl.CapDAO;
import vn.edu.hcmuaf.fit.dao.impl.PhoneCapDAO;
import vn.edu.hcmuaf.fit.dao.impl.PhoneDAO;
import vn.edu.hcmuaf.fit.model.phone.Cap;
import vn.edu.hcmuaf.fit.model.phone.Phone;
import vn.edu.hcmuaf.fit.model.phone.PhoneCap;

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

@WebServlet(urlPatterns = {"/admin/manage/phonecap"})
public class IndexHandle extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id = request.getParameter("id");
        List<PhoneCap> phoneCaps = new ArrayList<>();
        if (id != null) {

            phoneCaps = new PhoneCapDAO().list(" and phoneId =" + id, PhoneCap.class, null, null, null, null);
            Phone phone = new PhoneDAO().get(" and id=" + id, Phone.class, null).get();
            request.setAttribute("phone", phone);

            Map<String, List<Object>> map = new HashMap<>();
            List<Object> obs = new ArrayList<>(new PhoneCapDAO().listValue(" capId ", " and phoneId=" + phone.getId(), Integer.class));
            map.put("id", obs);
            List<Cap> actions1 = new CapDAO().list(" and id not in (<id>)", Cap.class, null, null, map, null);
            request.setAttribute("caps", actions1);

            Map<String, List<Object>> map2 = new HashMap<>();
            List<Object> obs2 = new ArrayList<>(new PhoneCapDAO().listValue(" phone_capId ", " and phoneId=" + phone.getId(), Integer.class));
            map.put("id2", obs2);
            List<Phone> actions2 = new PhoneDAO().list(" and id not in (<id2>)", Phone.class, null, null, map, null);
            request.setAttribute("phones", actions2);
        }
        request.setAttribute("pcap", phoneCaps);
        request.getRequestDispatcher("/views/admin/manage/phonecap/index.jsp").forward(request, response);

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
