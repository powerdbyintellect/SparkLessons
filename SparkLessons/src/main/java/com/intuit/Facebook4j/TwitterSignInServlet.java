package com.intuit.Facebook4j;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import facebook4j.Facebook;
import facebook4j.FacebookFactory;
import twitter4j.Twitter;
import twitter4j.TwitterException;
import twitter4j.TwitterFactory;
import twitter4j.auth.RequestToken;

public class TwitterSignInServlet extends HttpServlet {
    private static final long serialVersionUID = -6205814293093350242L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//        Twitter twitter = new TwitterFactory().getInstance();
//        request.getSession().setAttribute("twitter", twitter);
//        try {
//            StringBuffer callbackURL = request.getRequestURL();
//            int index = callbackURL.lastIndexOf("/");
//            callbackURL.replace(index, callbackURL.length(), "").append("/twitter");
//
//            RequestToken requestToken = twitter.getOAuthRequestToken(callbackURL.toString());
//            request.getSession().setAttribute("requestToken", requestToken);
//            response.sendRedirect(requestToken.getAuthenticationURL());
//
//        } catch (TwitterException e) {
//            throw new ServletException(e);
//        }
    	
    	Twitter twitter = new TwitterFactory().getInstance();
        request.getSession().setAttribute("twitter", twitter);
        StringBuffer callbackURL = request.getRequestURL();
        int index = callbackURL.lastIndexOf("/");
        callbackURL.replace(index, callbackURL.length(), "").append("/twitter");
        
		try {
			RequestToken requestToken = twitter.getOAuthRequestToken(callbackURL.toString());
			request.getSession().setAttribute("requestToken", requestToken);
            response.sendRedirect(requestToken.getAuthenticationURL());
		} catch (TwitterException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		

    }
}
