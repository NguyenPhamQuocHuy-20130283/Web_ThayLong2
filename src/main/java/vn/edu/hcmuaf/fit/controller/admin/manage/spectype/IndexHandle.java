package vn.edu.hcmuaf.fit.controller.admin.manage.spectype;

import vn.edu.hcmuaf.fit.dao.impl.SpecDAO;
import vn.edu.hcmuaf.fit.dao.impl.SpecTypeDAO;
import vn.edu.hcmuaf.fit.model.phone.Spec;
import vn.edu.hcmuaf.fit.model.phone.SpecType;

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

@WebServlet(urlPatterns = {"/admin/manage/spectype"})
public class IndexHandle extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id = request.getParameter("id");
        String page = "";
        int ids = 0;
        if (id != null) {
            ids = Integer.parseInt(id);
            if (ids != 0) {
                List<Spec> actions = new SpecDAO().list(" and spec_typeId= " + ids, Spec.class, null, null, null, null);
                request.setAttribute("specs", actions);
                SpecType user = new SpecTypeDAO().get(" and id=" + ids, SpecType.class, null).get();
                request.setAttribute("spectype", user);
                Map<String, List<Object>> map = new HashMap<>();
                List<Object> obs = new ArrayList<>(new SpecDAO().listValue(" id ", " and spec_typeId=" + user.getId(), Integer.class));
                map.put("id", obs);
                List<Spec> actions1 = new SpecDAO().list(" and id not in (<id>)", Spec.class, null, null, map, null);
                request.setAttribute("specs2", actions1);
                page = "/views/admin/manage/spectype2/index.jsp";

            }
        } else {
            List<SpecType> sp = new SpecTypeDAO().list("", SpecType.class, null, null, null, null);
            request.setAttribute("specTs", sp);
            page = "/views/admin/manage/spectype/index.jsp";
        }
        request.getRequestDispatcher(page).forward(request, response);


    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
