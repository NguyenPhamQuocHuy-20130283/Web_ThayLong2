/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package vn.edu.hcmuaf.fit.until;

import lombok.Data;
import org.apache.commons.validator.routines.EmailValidator;
import org.apache.commons.validator.routines.RegexValidator;
import vn.edu.hcmuaf.fit.dao.impl.UserDAO;
import vn.edu.hcmuaf.fit.model.user.User;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.Part;
import java.sql.Date;
import java.sql.Timestamp;
import java.util.HashMap;
import java.util.Map;

@Data
public class Validate {

    private final Map<String, String> map = new HashMap<>();


    public String getField(HttpServletRequest request, String fieldName, String type, boolean required) {
        String v = request.getParameter(fieldName);

        if (v == null) map.put(fieldName, " loi ");
        if (v.trim().isEmpty() == required) map.put(fieldName, " khong duoc de trong");
        switch (type) {
            case "name":
                if (v.length() > 25) map.put("name", " name is too long");
                if (!new RegexValidator("[A-Za-z ]{2,20}").isValid(v)) {
                    map.put("name", "Invalid name format");
                }
                break;
            case "pass":
                if (!new RegexValidator("^(?=.*[0-9])(?=.*[a-z])(?=.*[A-Z])(?=.*[@#$%^&+=])(?=\\S+$).{8,}$").isValid(v))
                    map.put("password", "Invalid password format");
                break;
            case "email":
                if (!EmailValidator.getInstance().isValid(v)) {
                    map.put("email", "Invalid email format");
                }
                if (new UserDAO().get(" and email='" + v + "'", User.class, null).orElse(null) != null)
                    map.put("email", "email da ton tai");
                break;

            case "phone":
                if (!new RegexValidator("^\\+(?:[0-9] ?){6,14}[0-9]$").isValid(v))
                    map.put("phone", "phone invalid");
                if (new UserDAO().get(" and phone='" + v + "'", User.class, null).orElse(null) != null)
                    map.put("email", "phone da ton tai");
                break;


        }

        return v;
    }

    public Part getFieldAjaxFile(HttpServletRequest request, String fieldName, boolean required) throws Exception {
        Part value = null;
        value = request.getPart(fieldName);
        if (value == null) {
            if (required) {
                String error = "Field " + fieldName + " is required";
                throw new Exception(error);
            } else {
                value = null; // Make empty string null so that you don't need to hassle with equals("") afterwards.
            }
        }
        return value;
    }

    public String getFieldAjax(HttpServletRequest request, String fieldName, boolean required) throws Exception {
        String value = null;
        value = request.getParameter(fieldName);
        if (value == null || value.trim().isEmpty()) {
            if (required) {
                String error = "Field " + fieldName + " is required";
                throw new Exception(error);
            } else {
                value = null; // Make empty string null so that you don't need to hassle with equals("") afterwards.
            }
        }
        return value;
    }

    public int fieldInt(String value, String message) throws Exception {
        int number = 0;
        try {
            number = Integer.parseInt(value);
        } catch (NumberFormatException e) {
            throw new Exception(message);
        }
        return number;
    }

    public double fieldDouble(String value, String message) throws Exception {
        double number = 0;
        try {
            number = Double.parseDouble(value);
        } catch (NumberFormatException e) {
            throw new Exception(message);
        }
        return number;
    }

    public String fieldString(String value, String regex, String message) throws Exception {
        if (!value.matches(regex)) {
            throw new Exception(message);
        }
        return value;
    }

    public boolean fieldBoolean(String value, String message) throws Exception {
        boolean bool = false;
        try {
            bool = Boolean.parseBoolean(value);
        } catch (Exception e) {
            throw new Exception(message);
        }
        return bool;
    }

    public Date fieldDate(String value, String message) throws Exception {
        Date date = null;
        try {
            date = Date.valueOf(value);
        } catch (Exception e) {
            throw new Exception(message);
        }
        return date;
    }

    public Timestamp fieldTimestamp(String value, String message) throws Exception {
        Timestamp timestamp = null;
        try {
            timestamp = new Timestamp(new java.util.Date(Long.parseLong(value)).getTime());
        } catch (Exception e) {
            throw new Exception(message);
        }
        return timestamp;
    }
}
