package vn.edu.hcmuaf.fit.filter;

import vn.edu.hcmuaf.fit.constant.Variable;
import vn.edu.hcmuaf.fit.model.user.User;
import vn.edu.hcmuaf.fit.until.SessionUntil;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebFilter(urlPatterns = {"/admin/*"}, filterName = "AdminFilter")
public class AdminFilter implements Filter {
    public void init(FilterConfig config) throws ServletException {
    }

    public void destroy() {
    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws ServletException, IOException {
        HttpServletResponse response1 = (HttpServletResponse) response;
        User user = (User) SessionUntil.get((HttpServletRequest) request, Variable.Global.USER.toString());
        if (user.getPermission() != null && user.getPermission().equals(Variable.Global.ADMIN.toString()))
            chain.doFilter(request, response);
        else {
            SessionUntil.set((HttpServletRequest) request, Variable.Global.TYPE.toString(), "error");
            SessionUntil.set((HttpServletRequest) request, Variable.Global.MESSAGE.toString(), " ban ko co quyen");
            response1.sendRedirect("/home?page=1&different=moi");
        }
    }
}
