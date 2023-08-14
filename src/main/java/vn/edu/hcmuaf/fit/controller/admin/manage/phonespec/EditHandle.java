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

@WebServlet(urlPatterns = {"/admin/manage/phonespec/edit"})
public class EditHandle extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String phoneId = request.getParameter("phoneId");
        String specId = request.getParameter("specId");
        if (phoneId != null && specId != null) {

            PhoneSpec phoneCap = new PhoneSpecDAO().get(" and phoneId=" + phoneId + " and specId=" + specId, PhoneSpec.class, null).get();
            request.setAttribute("pspec", phoneCap);
            Phone phone = new PhoneDAO().get(" and id= " + phoneId, Phone.class, null).get();
            request.setAttribute("phone", phone);

            Map<String, List<Object>> map = new HashMap<>();
            List<Object> obs = new ArrayList<>(new PhoneSpecDAO().listValue(" specId ", " and phoneId=" + phone.getId(), Integer.class));
            map.put("id", obs);
            List<Spec> actions1 = new SpecDAO().list(" and id not in (<id>)", Spec.class, null, null, map, null);
            actions1.add(phoneCap._spec());
            request.setAttribute("specs", actions1);


        }

        request.getRequestDispatcher("/views/admin/manage/phonespec/edit.jsp").forward(request, response);

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
