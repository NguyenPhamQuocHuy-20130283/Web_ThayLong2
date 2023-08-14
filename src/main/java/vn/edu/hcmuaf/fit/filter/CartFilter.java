package vn.edu.hcmuaf.fit.filter;

import vn.edu.hcmuaf.fit.constant.Variable;
import vn.edu.hcmuaf.fit.model.cart.Carts;
import vn.edu.hcmuaf.fit.until.SessionUntil;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import java.io.IOException;

@WebFilter(urlPatterns = {"/*"}, filterName = "CartFilter")
public class CartFilter implements Filter {
    public void init(FilterConfig config) throws ServletException {
    }

    public void destroy() {
    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws ServletException, IOException {
        HttpServletRequest request1 = (HttpServletRequest) request;
        Carts carts = (Carts) SessionUntil.get(request1, Variable.Global.CART.toString());
        if (carts == null) SessionUntil.set(request1, Variable.Global.CART.toString(), new Carts());
        chain.doFilter(request, response);
    }
}
