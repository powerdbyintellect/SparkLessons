package com.intuit.Facebook4j;

import facebook4j.Facebook;
import facebook4j.FacebookFactory;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class SignInServlet extends HttpServlet {
    private static final long serialVersionUID = -7453606094644144082L;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Facebook facebook = new FacebookFactory().getInstance();
        request.getSession().setAttribute("facebook", facebook);
        StringBuffer callbackURL = request.getRequestURL();
        int index = callbackURL.lastIndexOf("/");
        callbackURL.replace(index, callbackURL.length(), "").append("/callback");
        /*facebook.setOAuthAppId("226151517585978", "4941cc0c6ffb256adebd8ce019877104");
        facebook.setOAuthAccessToken(new AccessToken("9587ee7d9520ae13e700763f92576886", null));
        facebook.setOAuthCallbackURL(callbackURL.toString());
        facebook.setOAuthPermissions("ads_management, ads_read, create_event, create_note, email, export_stream, friends_about_me, friends_actions.books, friends_actions.music, friends_actions.news, friends_actions.video, friends_activities, friends_birthday, friends_education_history, friends_events, friends_games_activity, friends_groups, friends_hometown, friends_interests, friends_likes, friends_location, friends_notes, friends_online_presence, friends_photo_video_tags, friends_photos, friends_questions, friends_relationship_details, friends_relationships, friends_religion_politics, friends_status, friends_subscriptions, friends_videos, friends_website, friends_work_history, manage_friendlists, manage_notifications, manage_pages, photo_upload, publish_actions, publish_stream, read_friendlists, read_insights, read_mailbox, read_page_mailboxes, read_requests, read_stream, rsvp_event, share_item, sms, status_update, user_about_me, user_actions.books, user_actions.music, user_actions.news, user_actions.video, user_activities, user_birthday, user_education_history, user_events, user_friends, user_games_activity, user_groups, user_hometown, user_interests, user_likes, user_location, user_notes, user_online_presence, user_photo_video_tags, user_photos, user_questions, user_relationship_details, user_relationships, user_religion_politics, user_status, user_subscriptions, user_videos, user_website, user_work_history, video_upload, xmpp_login");*/
        response.sendRedirect(facebook.getOAuthAuthorizationURL(callbackURL.toString()));
    }
}
