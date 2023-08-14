package vn.edu.hcmuaf.fit.common;

public class Constants {
    public static String GOOGLE_CLIENT_ID = "381145232155-tava3m5g6i6haltcg301fbncpg1b44ks.apps.googleusercontent.com";
    public static String GOOGLE_CLIENT_SECRET = "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";
    public static String GOOGLE_REDIRECT_URI = "http://localhost:8088/login-google";
    public static String GOOGLE_LINK_GET_TOKEN = "https://accounts.google.com/o/oauth2/token";
    public static String GOOGLE_LINK_GET_USER_INFO = "https://www.googleapis.com/oauth2/v1/userinfo?access_token=";
    public static String GOOGLE_GRANT_TYPE = "authorization_code";
    public static String FACEBOOK_APP_ID = "577448040948895";
    public static String FACEBOOK_APP_SECRET = "898622731493cc546a4237f9c2179da8";
    public static String FACEBOOK_REDIRECT_URL = "http://localhost:8088/login-facebook";
    public static String FACEBOOK_LINK_GET_TOKEN = "https://graph.facebook.com/oauth/access_token?client_id=%s&client_secret=%s&redirect_uri=%s&code=%s";
}
