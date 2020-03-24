package de.amc17.dhbwplan.service;

import java.util.Collection;
import java.util.HashSet;
import java.util.List;
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

import de.amc17.dhbwplan.entity.Dozent;
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
	
	public long getUserCount() {
		try {
			return userRepo.count();
		}
		catch (Exception e) {
			LOG.error("UserService - Cannot count Users");
			return 0;
		}
	}
	
	public User getUserByID(long id) {
		try {
			return userRepo.findById(id).get();
		}
		catch (Exception e) {
			LOG.error("UserService - User not found with ID "+id);
			return null;
		}
	}
	
	public boolean deleteUser(long id) {
		try {
			userRepo.delete(this.getUserByID(id));
			return true;
		}
		catch (Exception e) {
			LOG.error(e);
			return false;
		}
	}
	
	public List<User> getAllUsers() {
		try {
			return userRepo.findAll();
		}
		catch (Exception e) {
			LOG.error("UserService - 'GetAllUsers' crashed, no users found or someting else");
			return null;
		}
	}
	
	public User createUser(String uname, String email, String pwd, Dozent dozent) {
		if (uname != "" && email != "" && pwd != "" && dozent != null) {
			User user = new User();
			try {
				user.setEmail(email);
				user.setUsername(uname);
				user.setDisplayName(dozent.getVorname()+" "+dozent.getNachname());
				user.setPassword(passwordEncoder.encode(pwd));
				user.setDozent(dozent);
				
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
	
	public User updatePwd(long id, String pwd_old, String pwd_1, String pwd_2) {
		User user = userRepo.findById(id).get();
		if (user != null) {
			if (isPwdValid(user, pwd_old)) {
				try {
					user.setPassword(passwordEncoder.encode(pwd_1));
					userRepo.save(user);
					return user;
				}
				catch (Exception e) {
					LOG.error("UserService - Password couldnt be changed");
				}
			}
			user.setPassword(null);
			return user;
		}	
		return null;
	}
	
	private boolean isPwdValid(User user, String pwd_old) {
		if (passwordEncoder.matches(pwd_old, user.getPassword())) {
			return true;
		}
		else return false;
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
