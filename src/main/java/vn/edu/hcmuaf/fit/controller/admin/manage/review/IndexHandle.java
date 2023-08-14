package vn.edu.hcmuaf.fit.controller.admin.manage.review;

import vn.edu.hcmuaf.fit.dao.impl.ReviewDAO;
import vn.edu.hcmuaf.fit.model.review.Review;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(urlPatterns = {"/admin/manage/review"})
public class IndexHandle extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String id = request.getParameter("id");
        String sql = " and isQuestion is false and typeId is null and star is not null and isReply is false";

        if (id != null) {
            sql = " and phoneId=" + id;
        }
        List<Review> reviews = new ReviewDAO().list(sql, Review.class, null, null, null, null);
        request.setAttribute("reviews", reviews);
        request.getRequestDispatcher("/views/admin/manage/review/index.jsp").forward(request, response);

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
