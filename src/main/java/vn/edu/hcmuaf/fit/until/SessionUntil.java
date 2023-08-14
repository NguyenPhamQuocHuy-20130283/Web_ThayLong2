package vn.edu.hcmuaf.fit.until;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

public class SessionUntil {

    public static void set(HttpServletRequest request, String name, Object value) {
        HttpSession session = request.getSession(true);
        session.setAttribute(name, value);
    }

    public static void message(HttpServletRequest request, String name, Object value) {
        HttpSession session = request.getSession(true);
        session.setAttribute(name, value);
        session.setMaxInactiveInterval(5);
    }


    public static Object get(HttpServletRequest request, String name) {
        HttpSession session = request.getSession(true);
        return session.getAttribute(name);
    }

    public static void invalidate(HttpServletRequest request) {
        HttpSession session = request.getSession(true);
        session.invalidate();
    }

    public static boolean isLogin(HttpServletRequest request) {
        return get(request, "username") != null;
    }

    public static String getLoginUserName(HttpServletRequest request) {
        Object username = get(request, "username");
        return username == null ? null : username.toString();

    }

    public static void delItem(HttpServletRequest request, String name) {
        HttpSession session = request.getSession();
        session.removeAttribute(name);
    }


}
