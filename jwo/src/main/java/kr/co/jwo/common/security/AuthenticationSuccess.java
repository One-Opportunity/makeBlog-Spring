package kr.co.jwo.common.security;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.security.core.Authentication;
import org.springframework.security.web.authentication.AbstractAuthenticationTargetUrlRequestHandler;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;
import org.springframework.stereotype.Component;

import kr.co.jwo.user.dto.UserDTO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
public class AuthenticationSuccess extends AbstractAuthenticationTargetUrlRequestHandler implements AuthenticationSuccessHandler {
	/**
	 * 	HttpServletRequest	: 클라이언트에서 서버로
	 *	ttpServletResponse 	: 서버에서 클라이언트
	 *	Authentication		: 시큐리티에서 정보 보냄
	**/ 
	@Override
	public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response, Authentication authentication) throws IOException, ServletException {
		UserDetail userDetail = (UserDetail)authentication.getPrincipal();
		UserDTO userDTO = userDetail.getUser();
		
		// true : session이 있으면 그대로 보내고 없으면 새롭게 생성
		HttpSession session = request.getSession(true);
		log.debug("AuthenticationSuccess userDTO@@@@@@@@" + userDTO);
		session.setAttribute("_user", userDTO);
		
		getRedirectStrategy().sendRedirect(request, response,  "/main/index.god" );
	}
}