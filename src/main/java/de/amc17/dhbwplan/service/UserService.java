package de.amc17.dhbwplan.service;

import java.util.Collection;
import java.util.HashSet;
import java.util.Set;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import de.amc17.dhbwplan.entity.Role;
import de.amc17.dhbwplan.entity.User;
import de.amc17.dhbwplan.enums.UserRoles;
import de.amc17.dhbwplan.repository.RoleRepository;
import de.amc17.dhbwplan.repository.UserRepository;

@Service
public class UserService implements UserDetailsService {
	
	@Autowired
	private UserRepository userRepo;
	
	@Autowired
	private RoleRepository roleRepo;
	
	@Autowired
	private PasswordEncoder passwordEncoder;
	
	private static final Logger LOG = LogManager.getLogger(UserService.class.getName());
	
	@Override
	@Transactional(readOnly = true)
	public UserDetails loadUserByUsername(String uname) {
		User user = userRepo.findByemail(uname);
		if (user == null) {
			LOG.warn("User unknown: "+uname);
			throw new UsernameNotFoundException(uname);
		}
		Set<GrantedAuthority> grantedAuthority = new HashSet<>();
		for (Role role : user.getRoles()) {
			grantedAuthority.add(new SimpleGrantedAuthority(role.getRole().toString()));
		}
		
		return new org.springframework.security.core.userdetails.User(user.getUsername(), user.getPassword(), grantedAuthority);
	}
	
	public User getCurrentUser() {
		if (isAnonymous()) {
			return null;
		}
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		Collection<? extends GrantedAuthority> groups = auth.getAuthorities();
		if (groups != null && groups.stream().noneMatch(a -> "ROLE_ANONYMOUS".equals(a.getAuthority()))) {
			
			String username = auth.getName();
			User user = this.getUserByUsername(username);
			return user;
		}
		return null;
	}
	
	public boolean isAnonymous() {
		try {
			Authentication auth = SecurityContextHolder.getContext().getAuthentication();
			if (auth == null) {
				return false;
			}
			Collection<? extends GrantedAuthority> groups = auth.getAuthorities();
			if (groups != null && groups.stream().noneMatch(a -> "ROLE_ANONYMOUS".equals(a.getAuthority()))) {
				return false;
			}
		} catch (Exception e) {
			LOG.error(e);
		}
		return true;
	}
	
	public User getUserByUsername(String username) {
		User user = userRepo.findByusername(username);
		if (user == null) {
			LOG.error("Username not found: "+username);
			throw new UsernameNotFoundException(username);
		}
		return user;
	}
	
	public boolean findAdmin() {
		if (userRepo.findByusername("admin") != null) {
			return true;
		}
		else return false;
	}
	
	public User createUser(String uname, String email, String pwd) throws Exception {
		if (uname != "" && email != "" && pwd != "") {
			User user = new User();
			try {
				user.setEmail(email);
				user.setUsername(uname);
				user.setPassword(passwordEncoder.encode(pwd));
				
				createRoleIfNotFound(UserRoles.USER);
				Role role = roleRepo.findByrole(UserRoles.USER);
				Set<Role> roles = new HashSet<Role>();
				roles.add(role);
				user.setRoles(roles);
				
				user = userRepo.save(user);
			}
			catch (Exception e) {
				LOG.warn(e);
			}
			return user;
			
			
		}
		else return null;
	}
	
	@Transactional
    private Role createRoleIfNotFound(UserRoles urole) {
  
        Role role = roleRepo.findByrole(urole);
        if (role == null) {
            role = new Role();
            role.setRole(urole);
            roleRepo.save(role);
        }
        return role;
    }
}
