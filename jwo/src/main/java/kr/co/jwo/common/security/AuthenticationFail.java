package kr.co.jwo.common.security;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.core.AuthenticationException;
import org.springframework.security.web.authentication.AbstractAuthenticationTargetUrlRequestHandler;
import org.springframework.security.web.authentication.AuthenticationFailureHandler;

public class AuthenticationFail extends AbstractAuthenticationTargetUrlRequestHandler implements AuthenticationFailureHandler {

	@Override
	public void onAuthenticationFailure(HttpServletRequest request, HttpServletResponse response, AuthenticationException exeption)
			throws IOException, ServletException {
		// TODO Auto-generated method stub
		
		getRedirectStrategy().sendRedirect(request, response,  getDefaultTargetUrl() );
	}

}
