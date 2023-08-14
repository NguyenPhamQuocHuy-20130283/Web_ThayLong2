package vn.edu.hcmuaf.fit.until;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class CookieUntil {
    public static String get(String name, HttpServletRequest request) {
        Cookie[] cookies = request.getCookies();

        if (cookies != null) {
            for (Cookie cookie : cookies) {
                if (cookie.getName().equals(name)) return cookie.getValue();
            }
        }
        return null;
    }

    public static Cookie get0(String name, HttpServletRequest request) {
        Cookie[] cookies = request.getCookies();

        if (cookies != null) {
            for (Cookie cookie : cookies) {
                if (cookie.getName().equals(name)) return cookie;
            }
        }
        return null;
    }

    public static Cookie add(String name, String value, int hours, HttpServletResponse response) {
        Cookie cookie = new Cookie(name, value);
        cookie.setMaxAge(60 * 60 * hours);
        cookie.setPath("/");
        response.addCookie(cookie);

        return cookie;
    }

    public static Cookie addM(String name, String value, int hours, HttpServletResponse response) {
        Cookie cookie = new Cookie(name, value);
        cookie.setMaxAge(60 * hours);
        cookie.setPath("/");
        response.addCookie(cookie);

        return cookie;
    }

    public static Cookie message(String name, String value, int hours, HttpServletResponse response) {

        Cookie cookie = new Cookie(name, value);
        cookie.setMaxAge(hours);
        cookie.setPath("/");
        response.addCookie(cookie);

        return cookie;
    }


}
