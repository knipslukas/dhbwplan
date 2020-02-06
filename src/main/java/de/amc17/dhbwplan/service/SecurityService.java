package de.amc17.dhbwplan.service;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Service;

@Service
public class SecurityService {
	
	@Autowired
	private AuthenticationManager authManag;
	
	@Autowired
	private UserService uservice;
	
	private static final Logger LOG = LoggerFactory.getLogger(SecurityService.class);

	public String findLoggedInUsername() {
		Object userDetails = SecurityContextHolder.getContext().getAuthentication().getDetails();
		if (userDetails instanceof UserDetails) {
			return ((UserDetails)userDetails).getUsername();
		}
		return null;
	}
	
	public void autoLogin(String email, String password) {
		UserDetails userDetail = uservice.loadUserByUsername(email);
		UsernamePasswordAuthenticationToken usernamePwdAuthToken = new UsernamePasswordAuthenticationToken(userDetail, password, userDetail.getAuthorities());
		
		authManag.authenticate(usernamePwdAuthToken);
		
		if (usernamePwdAuthToken.isAuthenticated()) {
			SecurityContextHolder.getContext().setAuthentication(usernamePwdAuthToken);
			LOG.debug(String.format("Auto login %s succesfully", email));
		}
	}
} 