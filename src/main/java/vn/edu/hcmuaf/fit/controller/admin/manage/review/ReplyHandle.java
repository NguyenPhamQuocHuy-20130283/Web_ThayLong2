package vn.edu.hcmuaf.fit.controller.admin.manage.review;

import vn.edu.hcmuaf.fit.constant.Variable;
import vn.edu.hcmuaf.fit.dao.impl.PhoneReviewDAO;
import vn.edu.hcmuaf.fit.dao.impl.ReviewDAO;
import vn.edu.hcmuaf.fit.model.review.PhoneReview;
import vn.edu.hcmuaf.fit.model.review.Review;
import vn.edu.hcmuaf.fit.until.SessionUntil;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(urlPatterns = {"/admin/manage/question/reply"})
public class ReplyHandle extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String id = request.getParameter("id");
        if (id != null) {

            Review review = new ReviewDAO().get(" and id=" + id, Review.class, null).get();
            request.setAttribute("review", review);
        }
        request.getRequestDispatcher("/views/admin/manage/review/reply.jsp").forward(request, response);

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id = request.getParameter("id");
        String content = request.getParameter("content");
        String userId = request.getParameter("userId");
        String phoneId = request.getParameter("phoneId");


        Review review = new Review();
        review.setContent(content);
//        review.setReply(true);
//        review.setQuestion(false);
        review.setUserId(Integer.parseInt(userId));
        review.setPhoneId(Integer.parseInt(phoneId));

        int rep = new ReviewDAO().save(review);

        PhoneReview pr = new PhoneReview();
        pr.setCommentId(Integer.parseInt(id));
        pr.setReplyId(rep);

        new PhoneReviewDAO().insert(pr);


        SessionUntil.set(request, Variable.Global.TYPE.toString(), "success");
        SessionUntil.set(request, Variable.Global.MESSAGE.toString(), "da tra loi thanh cong");

        response.sendRedirect("/admin/manage/question");

    }
}
