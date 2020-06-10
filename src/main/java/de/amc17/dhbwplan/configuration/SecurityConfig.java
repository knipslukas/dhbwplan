package de.amc17.dhbwplan.configuration;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;

@EnableWebSecurity
@Configuration
public class SecurityConfig extends WebSecurityConfigurerAdapter {

	@Override
	protected void configure(HttpSecurity http) throws Exception {
		http
			.csrf()
				.ignoringAntMatchers("/studiengang/addSturi")
				.ignoringAntMatchers("/studiengang/deleteSturi/**")
				.ignoringAntMatchers("/kurs/addPRZ")
				.ignoringAntMatchers("/kurs/deletePRZ/**")
				.and()
			.authorizeRequests()
				.antMatchers("/static/**").permitAll()
				.antMatchers("/setup").permitAll()
				.anyRequest().authenticated()
				.and()
			.httpBasic()
				.and()
			.formLogin()
				.loginPage("/login")
				.defaultSuccessUrl("/")
				.usernameParameter("email")
				.passwordParameter("password")
				.permitAll()
				.and()
			.logout()
				.logoutUrl("/usrlgt")
				.permitAll();
	}

	@Bean
	public PasswordEncoder passwordEncoder() {
		return new BCryptPasswordEncoder();
	}

	@Bean
	public AuthenticationManager customAuthenticationManager() throws Exception {
		return authenticationManager();
	}

}