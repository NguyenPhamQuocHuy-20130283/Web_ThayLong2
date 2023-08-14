package vn.edu.hcmuaf.fit.controller.admin.api;

import com.fasterxml.jackson.databind.ObjectMapper;
import vn.edu.hcmuaf.fit.dao.impl.ImageDAO;
import vn.edu.hcmuaf.fit.helper.FileManage;
import vn.edu.hcmuaf.fit.model.phone.Image;
import vn.edu.hcmuaf.fit.until.HttpUtil;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import java.io.File;
import java.io.IOException;
import java.util.List;

@WebServlet(value = "/api/image")
@MultipartConfig
public class ImageAPI extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ObjectMapper mapper = new ObjectMapper();
        request.setCharacterEncoding("UTF-8");
        response.setContentType("application/json");
        String id = request.getParameter("id");

        if (id != null) {
            Image users = new ImageDAO().get(" and id= " + id, Image.class, null).get();
            mapper.writeValue(response.getOutputStream(), users);
        } else
            mapper.writeValue(response.getOutputStream(), "{}");
    }

    @Override

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ObjectMapper mapper = new ObjectMapper();
        request.setCharacterEncoding("UTF-8");
        response.setContentType("application/json");

        String phoneId = request.getParameter("phoneId");
        String des = request.getParameter("desc");
        FileManage fileManage = new FileManage();
        List<String> listFiles = fileManage.uploadFiles("assets" + File.separator + "images" + File.separator + "phone", request);
        for (String file : listFiles) {
            Image image = new Image();
            image.setLink("/assets/images/phone/" + file.toString());
//            image.setDesc(des);
            image.setPhoneId(Integer.parseInt(phoneId));
            new ImageDAO().insertImage(image);
        }
        mapper.writeValue(response.getOutputStream(), "");
    }

    @Override
    protected void doPut(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ObjectMapper mapper = new ObjectMapper();
        request.setCharacterEncoding("UTF-8");
        response.setContentType("application/json");
        Part part = request.getPart("link");
        String id = request.getParameter("id");
        String des = request.getParameter("desc");

        Image image = new ImageDAO().get(" and id = " + id, Image.class, null).get();
        FileManage fileManage = new FileManage();
        String folder = request.getServletContext().getRealPath("/assets/images/phone");
        String filename = null;
        if (part.getSize() != 0) {
            if (image.getLink() != null && !image.getLink().isEmpty()) {
                fileManage.delete(image.getLink().split("/")[4], folder);
            }
            filename = fileManage.upLoad(part, folder);
        }
        if (filename != null) {
            image.setLink("/assets/images/phone/" + filename);
        }
//        image.setDesc(des);
        new ImageDAO().updateImage(image);
        mapper.writeValue(response.getOutputStream(), "");
    }

    @Override
    protected void doDelete(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ObjectMapper mapper = new ObjectMapper();
        request.setCharacterEncoding("UTF-8");
        response.setContentType("application/json");
        Image image = HttpUtil.of(request.getReader()).toModel(Image.class);
        FileManage fileManage = new FileManage();
        String folder = request.getServletContext().getRealPath("/assets/images/phone");
        try {
            fileManage.delete(image.getLink().split("/")[4], folder);
        } catch (Exception e) {
        }
        new ImageDAO().deleteImage(image);
        mapper.writeValue(response.getOutputStream(), "");
    }

}
