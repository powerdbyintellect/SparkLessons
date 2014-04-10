package com.intuit.Facebook4j;

import com.intuit.tutor.entity.Address;
import com.intuit.tutor.entity.Customer;
import facebook4j.Facebook;
import facebook4j.FacebookException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class CallbackServlet extends HttpServlet {
    private static final long serialVersionUID = 6305643034487441839L;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Facebook facebook = (Facebook) request.getSession().getAttribute("facebook");
        String oauthCode = request.getParameter("code");
        try {
            facebook.getOAuthAccessToken(oauthCode);
            System.out.print(facebook.getName());
            Customer customer = new Customer();
            customer.setFirstname(facebook.getMe().getFirstName());
            customer.setLastname(facebook.getMe().getLastName());
            customer.setDob(facebook.getMe().getBirthday());
            customer.setEmail(facebook.getMe().getEmail());
            customer.setDbaName(facebook.getMe().getUsername());
            Address address = new Address();
            address.setCity(facebook.getMe().getHometown().getName());
            request.getSession().setAttribute("customer", customer);
        } catch (FacebookException e) {
            throw new ServletException(e);
        }
        response.sendRedirect(request.getContextPath() + "/order");
    }
}