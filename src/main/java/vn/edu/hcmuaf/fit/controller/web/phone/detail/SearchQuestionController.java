package vn.edu.hcmuaf.fit.controller.web.phone.detail;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "SearchQuestion", value = "/SearchQuestion")
public class SearchQuestionController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String query = request.getParameter("query");

        // Xử lý tìm kiếm và tạo kết quả dưới dạng HTML

        // Code xử lý tìm kiếm và tạo kết quả
        // ...
//        html += "</body></html>";

        // Trả về kết quả dưới dạng HTML
        response.setContentType("text/html");
        response.setCharacterEncoding("UTF-8");
        PrintWriter out = response.getWriter();
//        out.print(html);
        out.flush();

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
