package vn.edu.hcmuaf.fit.controller.admin.api;

import com.fasterxml.jackson.databind.ObjectMapper;
import vn.edu.hcmuaf.fit.dao.impl.PhoneDAO;
import vn.edu.hcmuaf.fit.helper.FileManage;
import vn.edu.hcmuaf.fit.model.phone.Phone;
import vn.edu.hcmuaf.fit.until.HttpUtil;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import java.io.IOException;

@WebServlet(urlPatterns = {"/api/phone"})
@MultipartConfig
public class PhoneAPI extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ObjectMapper mapper = new ObjectMapper();
        request.setCharacterEncoding("UTF-8");
        response.setContentType("application/json");
        String id = request.getParameter("id");

        if (id != null) {
            Phone users = new PhoneDAO().get(" and id= " + id, Phone.class, null).get();
            mapper.writeValue(response.getOutputStream(), users);
        } else
            mapper.writeValue(response.getOutputStream(), "{}");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ObjectMapper mapper = new ObjectMapper();
        request.setCharacterEncoding("UTF-8");
        response.setContentType("application/json");
        Phone phone = new Phone();
        phone.setName(request.getParameter("name"));
//        phone.setPrice(Integer.parseInt(request.getParameter("price")));
        phone.setDesc(request.getParameter("desc"));
        phone.setContent(request.getParameter("content"));
//        phone.setTotal(Integer.parseInt(request.getParameter("total")));
//        phone.setTypeId(Integer.parseInt(request.getParameter("typeId")));
        phone.setNew(Integer.parseInt(request.getParameter("isNew")) == 1);
        phone.setBrandId(Integer.parseInt(request.getParameter("brandId")));
        phone.setModelId(Integer.parseInt(request.getParameter("modelId")));
        phone.setCapId(Integer.parseInt(request.getParameter("capId")));
        phone.setSaleId(Integer.parseInt(request.getParameter("saleId")));
        phone.setCreated_by(Integer.parseInt(request.getParameter("created_by")));
        phone.setUpdated_by(Integer.parseInt(request.getParameter("created_by")));
        phone.setPhone_stateId(Integer.parseInt(request.getParameter("phone_stateId")));
        Part part = request.getPart("thumbnail");
        String folder = request.getServletContext().getRealPath("/assets/images/phone");
        FileManage fileManage = new FileManage();
        String file = fileManage.upLoad(part, folder);
        phone.setThumbnail("/assets/images/phone/" + file);
        new PhoneDAO().savePhone(phone);
        mapper.writeValue(response.getOutputStream(), "");
    }

    @Override
    protected void doPut(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ObjectMapper mapper = new ObjectMapper();
        request.setCharacterEncoding("UTF-8");
        response.setContentType("application/json");
        String id = request.getParameter("id");
        Phone phone = new PhoneDAO().get(" and id = " + id, Phone.class, null).get();
        phone.setName(request.getParameter("name"));
//        phone.setPrice(Integer.parseInt(request.getParameter("price")));
        phone.setDesc(request.getParameter("desc"));
        phone.setContent(request.getParameter("content"));
//        phone.setTotal(Integer.parseInt(request.getParameter("total")));
//        phone.setTypeId(Integer.parseInt(request.getParameter("typeId")));
        phone.setNew(request.getParameter("isNew") != null && Integer.parseInt(request.getParameter("isNew")) == 1);
        phone.setBrandId(Integer.parseInt(request.getParameter("brandId")));
        phone.setModelId(Integer.parseInt(request.getParameter("modelId")));
        phone.setCapId(Integer.parseInt(request.getParameter("capId")));
        phone.setSaleId(Integer.parseInt(request.getParameter("saleId")));
        phone.setUpdated_by(Integer.parseInt(request.getParameter("updated_by")));
        phone.setPhone_stateId(Integer.parseInt(request.getParameter("phone_stateId")));
        Part part = request.getPart("thumbnail");
        FileManage fileManage = new FileManage();
        String folder = request.getServletContext().getRealPath("/assets/images/phone");
        String filename = null;
        if (part.getSize() != 0) {
            if (phone.getThumbnail() != null && !phone.getThumbnail().isEmpty()) {
                fileManage.delete(phone.getThumbnail().split("/")[4], folder);
            }
            filename = fileManage.upLoad(part, folder);
        }
        if (filename != null) {
            phone.setThumbnail("/assets/images/phone/" + filename);
        }
        new PhoneDAO().updatePhone(phone);
        mapper.writeValue(response.getOutputStream(), "");
    }

    @Override
    protected void doDelete(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ObjectMapper mapper = new ObjectMapper();
        request.setCharacterEncoding("UTF-8");
        response.setContentType("application/json");
        Phone phone = HttpUtil.of(request.getReader()).toModel(Phone.class);
        new PhoneDAO().deleteSoftPhone(phone);
        mapper.writeValue(response.getOutputStream(), phone);
    }
}
