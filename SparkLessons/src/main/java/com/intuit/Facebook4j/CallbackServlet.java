package com.intuit.Facebook4j;

import com.intuit.tutor.entity.Address;
import com.intuit.tutor.entity.Customer;
import com.intuit.tutor.entity.UserEntity;
import com.intuit.tutor.entity.dao.UserEntityDAO;

import facebook4j.Facebook;
import facebook4j.FacebookException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;

import java.io.IOException;

public class CallbackServlet extends HttpServlet {
    private static final long serialVersionUID = 6305643034487441839L;

    @Autowired
	private UserEntityDAO userEntityDAO;
    
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
            
            
        	response.sendRedirect(request.getContextPath() + "/order");
           
            
        } catch (FacebookException e) {
            throw new ServletException(e);
        }
        
    }
}