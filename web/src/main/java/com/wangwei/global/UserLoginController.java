package com.wangwei.global;

import javax.servlet.*;
import javax.servlet.Filter;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * 实现用户登录的设置
 */
@WebFilter("/username/*")
public class UserLoginController implements Filter {
    public void init(FilterConfig filterConfig) throws ServletException {

    }

    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain) throws IOException, ServletException {
        HttpServletRequest request = (HttpServletRequest) servletRequest;
        HttpServletResponse response = (HttpServletResponse) servletResponse;

        Object object = request.getSession().getAttribute("username");
        if (object==null){
            response.sendRedirect(request.getContextPath()+"/index");
            return;
        }
        filterChain.doFilter(request,response);
    }

    public void destroy() {

    }
}
