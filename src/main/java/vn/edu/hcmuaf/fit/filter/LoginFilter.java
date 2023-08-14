package vn.edu.hcmuaf.fit.filter;

import vn.edu.hcmuaf.fit.until.CookieUntil;

import javax.servlet.*;
import javax.servlet.annotation.*;
import javax.servlet.http.HttpServletRequest;
import java.io.IOException;

@WebFilter(urlPatterns = {"/*"},filterName = "LoginFilter")
public class LoginFilter implements Filter {
    public void init(FilterConfig config) throws ServletException {
    }

    public void destroy() {
    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws ServletException, IOException {
        String username = CookieUntil.get("username", (HttpServletRequest) request);
        String password = CookieUntil.get("password", (HttpServletRequest) request);
        if (username != null && password != null) {
            request.setAttribute("username", username);
            request.setAttribute("password", password);
        }
        chain.doFilter(request, response);
    }
}
