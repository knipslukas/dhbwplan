package de.amc17.dhbwplan.repository;

import java.util.List;

import org.springframework.data.repository.CrudRepository;

import de.amc17.dhbwplan.entity.User;

public interface UserRepository extends CrudRepository<User, Long> {
	User findByemail(String email);
	User findByusername(String username);
	
	List<User> findAll();
}
