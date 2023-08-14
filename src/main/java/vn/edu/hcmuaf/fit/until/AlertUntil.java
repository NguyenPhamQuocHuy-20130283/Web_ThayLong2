package vn.edu.hcmuaf.fit.until;

import javax.servlet.http.HttpServletRequest;

public class AlertUntil {

    public static void setMessage(HttpServletRequest request, String type, String message) {

        request.setAttribute("message", message);
        request.setAttribute("type", type);

    }

}
