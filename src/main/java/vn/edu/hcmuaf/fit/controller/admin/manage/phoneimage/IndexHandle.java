package vn.edu.hcmuaf.fit.controller.admin.manage.phoneimage;

import vn.edu.hcmuaf.fit.dao.impl.ImageDAO;
import vn.edu.hcmuaf.fit.dao.impl.PhoneDAO;
import vn.edu.hcmuaf.fit.model.phone.Image;
import vn.edu.hcmuaf.fit.model.phone.Phone;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(urlPatterns = {"/admin/manage/phoneimage"})
public class IndexHandle extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id = request.getParameter("id");
        List<Image> phoneCaps = new ArrayList<>();
        if (id != null) {

            phoneCaps = new ImageDAO().list(" and phoneId =" + id, Image.class, null, null, null, null);
            Phone phone = new PhoneDAO().get(" and id=" + id, Phone.class, null).get();
            request.setAttribute("phone", phone);

//            Map<String, List<Object>> map = new HashMap<>();
//            List<Object> obs = new ArrayList<>(new PhonePromotDAO().listValue(" promotId ", " and phoneId=" + phone.getId(), Integer.class));
//            map.put("id", obs);
//            List<Promot> actions1 = new PromotDAO().list(" and id not in (<id>)", Promot.class, null, null, map, null);
//
//            request.setAttribute("promots", actions1);
        }
        request.setAttribute("pimage", phoneCaps);
        request.getRequestDispatcher("/views/admin/manage/phoneimage/index.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
