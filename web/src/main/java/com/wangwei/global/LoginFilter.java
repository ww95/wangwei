package com.wangwei.global;

import javax.servlet.*;
import javax.servlet.Filter;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebFilter("/backstage/admin/*")
public class LoginFilter implements Filter {
    public void init(FilterConfig filterConfig) throws ServletException {

    }

    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain chain) throws IOException, ServletException {
        HttpServletRequest request = (HttpServletRequest) servletRequest;
        HttpServletResponse  response = (HttpServletResponse) servletResponse;
        Object object = request.getSession().getAttribute("account");
        if(object==null){
            response.sendRedirect(request.getContextPath()+"/backstage/toLogin");
            return;
        }
        chain.doFilter(request,response);
    }

    public void destroy() {

    }
}
