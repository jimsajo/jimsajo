package com.jimsajo.config.auth;

import java.io.IOException;

import org.springframework.security.core.AuthenticationException;
import org.springframework.security.web.authentication.AuthenticationFailureHandler;
import org.springframework.stereotype.Component;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@Component
public class CustomAuthFailureHandler implements AuthenticationFailureHandler {
    @Override
    public void onAuthenticationFailure(HttpServletRequest request,
                                        HttpServletResponse response,
                                        AuthenticationException exception) throws IOException {
        // 세션이나 리퀘스트에 에러 플래그 설정 (리디렉션이 아닌 forward)
        request.setAttribute("loginError", true);
        try {
            request.getRequestDispatcher("/login").forward(request, response);  // 리다이렉트 아님!
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
