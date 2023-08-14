package vn.edu.hcmuaf.fit.controller.admin.manage.review;

import vn.edu.hcmuaf.fit.dao.impl.PhoneReviewDAO;
import vn.edu.hcmuaf.fit.dao.impl.ReviewDAO;
import vn.edu.hcmuaf.fit.model.review.Review;

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

@WebServlet(urlPatterns = {"/admin/manage/question"})
public class IndexHandle2 extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String id = request.getParameter("id");
        String sql = " and isQuestion is true and typeId is not null and star is  null and isReply is false  and id not in (<id>)";
        Map<String, List<Object>> map = new HashMap<>();
        List<Object> obs = new ArrayList<>(new PhoneReviewDAO().listValue(" commentId ", "", Integer.class));
        map.put("id", obs);
        if (id != null) {
            sql += " and phoneId=" + id;
        }
        request.setAttribute("question", "question");
        List<Review> reviews = new ReviewDAO().list(sql, Review.class, null, null, map, null);

        request.setAttribute("reviews", reviews);
        request.getRequestDispatcher("/views/admin/manage/review/index.jsp").forward(request, response);

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
