package vn.edu.hcmuaf.fit.controller.admin.api;

import com.fasterxml.jackson.databind.ObjectMapper;
import vn.edu.hcmuaf.fit.dao.impl.ImageDAO;
import vn.edu.hcmuaf.fit.dao.impl.PhoneDAO;
import vn.edu.hcmuaf.fit.helper.FileManage;
import vn.edu.hcmuaf.fit.model.phone.Image;
import vn.edu.hcmuaf.fit.model.phone.Phone;
import vn.edu.hcmuaf.fit.until.HttpUtil;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(value = "/api/phone-store")
public class PhoneStoreAPI extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPut(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ObjectMapper mapper = new ObjectMapper();
        request.setCharacterEncoding("UTF-8");
        response.setContentType("application/json");

        Phone phone = HttpUtil.of(request.getReader()).toModel(Phone.class);
        new PhoneDAO().updateDelete(phone);
        mapper.writeValue(response.getOutputStream(), "{}");

    }

    @Override
    protected void doDelete(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ObjectMapper mapper = new ObjectMapper();
        request.setCharacterEncoding("UTF-8");
        response.setContentType("application/json");
        Phone phone = HttpUtil.of(request.getReader()).toModel(Phone.class);
        new PhoneDAO().delete(phone);
        String folder = request.getServletContext().getRealPath("/assets/images/phone");
        FileManage fileManage = new FileManage();
        fileManage.delete(phone.getThumbnail().split("/")[4],
                folder
        );
        List<Image> images = new ImageDAO().list(" and phoneId=" + phone.getId(), Image.class, null, null, null, null);
        for (Image i : images
        ) {
            new ImageDAO().deleteImage(i);
            fileManage.delete(i.getLink().split("/")[4], folder);
        }
        mapper.writeValue(response.getOutputStream(), phone);
    }
}
