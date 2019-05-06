package com.wangwei.global;

import javax.servlet.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class Filter implements javax.servlet.Filter {
    private String enCoding = "utf-8";
    public void init(FilterConfig filterConfig) throws ServletException {
        enCoding = filterConfig.getInitParameter("enCoding");
    }

    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain chain) throws IOException, ServletException {
        HttpServletRequest request = (HttpServletRequest) servletRequest;
        HttpServletResponse response = (HttpServletResponse) servletResponse;
        request.setCharacterEncoding(enCoding);
        response.setCharacterEncoding(enCoding);
        chain.doFilter(request,response);
    }

    public void destroy() {

    }
}
