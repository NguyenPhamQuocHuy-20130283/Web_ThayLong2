package vn.edu.hcmuaf.fit.controller.admin.api;

import com.fasterxml.jackson.databind.ObjectMapper;
import vn.edu.hcmuaf.fit.dao.impl.VoteDAO;
import vn.edu.hcmuaf.fit.model.review.Vote;
import vn.edu.hcmuaf.fit.until.HttpUtil;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(value = "/api/vote")
public class VoteAPI extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ObjectMapper mapper = new ObjectMapper();
        request.setCharacterEncoding("UTF-8");

        response.setContentType("application/json");
        Vote vote = HttpUtil.of(request.getReader()).toModel(Vote.class);
        Vote v = new VoteDAO().get(" and userId =" + vote.getUserId() + " and commentId =" + vote.getCommentId(), Vote.class, null).orElse(null);

        if (v != null) {
            new VoteDAO().delete(vote);
        } else {
            new VoteDAO().save(vote);
        }

        mapper.writeValue(response.getOutputStream(), new VoteDAO().list(" and commentId =" + vote.getCommentId(), Vote.class, null, null, null, null).size() + 1);
    }

}
