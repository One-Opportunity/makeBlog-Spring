package kr.co.jwo.common.security;

import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

import kr.co.jwo.user.dto.UserDTO;

public class UserDetail implements UserDetails {

	private static final long serialVersionUID = -8131959684520725990L;
	
	private List<GrantedAuthority> authorities;
	private UserDTO user;
	
	public UserDetail(UserDTO _user) {
		this.user = _user;
		authorities = new ArrayList<GrantedAuthority>();
		authorities.add( new SimpleGrantedAuthority("ROLE_"+ _user.getRole() ) );
	}
	
	@Override
	public Collection<GrantedAuthority> getAuthorities() {
		// TODO Auto-generated method stub
		return authorities;
	}
		
	public UserDTO getUser() {
		return this.user;
	}
	
	public void setMember(UserDTO _user) {
		this.user = _user;
	}

	@Override
	public String getPassword() {
		// TODO Auto-generated method stub
		return user.getLoginPw();
	}
	
	@Override
	public String getUsername() {
		// TODO Auto-generated method stub
		return user.getName();
	}

	@Override
	public boolean isAccountNonExpired() {
		// TODO Auto-generated method stub
		return true;
	}

	@Override
	public boolean isAccountNonLocked() {
		// TODO Auto-generated method stub
		if( user.getStatus().equals(4) )
			return false;
		
		return true;
	}

	@Override
	public boolean isCredentialsNonExpired() {
		// TODO Auto-generated method stub
		return true;
	}

	@Override
	public boolean isEnabled() {
		// TODO Auto-generated method stub
		return user.getStatus() == 9 ? true : false;
	}
	

	public int hashCode() {
		// TODO Auto-generated method stub
		return user.getUserId();
	}
	

	public boolean equals(Object obj) {
		
		if( !(obj instanceof UserDetail ) ) {
			return false;
		}
		
		UserDetail detail = (UserDetail)obj;
		
		if( this.user.getUserId() == null && detail.getUser().getUserId() != null ) {
			return false;
		}
		
		if( this.user.getUserId() != null && detail.getUser().getUserId() == null ) {
			return false;
		}
		
		return true;
	}
	
}
