package vn.edu.hcmuaf.fit.controller.admin.manage.phonespec;

import vn.edu.hcmuaf.fit.dao.impl.PhoneDAO;
import vn.edu.hcmuaf.fit.dao.impl.PhoneSpecDAO;
import vn.edu.hcmuaf.fit.dao.impl.SpecDAO;
import vn.edu.hcmuaf.fit.model.phone.Phone;
import vn.edu.hcmuaf.fit.model.phone.PhoneSpec;
import vn.edu.hcmuaf.fit.model.phone.Spec;

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

@WebServlet(urlPatterns = {"/admin/manage/phonespec"})
public class IndexHandle extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id = request.getParameter("id");
        List<PhoneSpec> phoneCaps = new ArrayList<>();
        if (id != null) {
            phoneCaps = new PhoneSpecDAO().list(" and phoneId =" + id, PhoneSpec.class, null, null, null, null);
            Phone phone = new PhoneDAO().get(" and id=" + id, Phone.class, null).get();
            request.setAttribute("phone", phone);
            Map<String, List<Object>> map = new HashMap<>();
            List<Object> obs = new ArrayList<>(new PhoneSpecDAO().listValue(" specId ", " and phoneId=" + phone.getId(), Integer.class));
            map.put("id", obs);
            List<Spec> actions1 = new SpecDAO().list(" and id not in (<id>)", Spec.class, null, null, map, null);
            request.setAttribute("specs", actions1);
        }
        request.setAttribute("pspec", phoneCaps);
        request.getRequestDispatcher("/views/admin/manage/phonespec/index.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
