package de.amc17.dhbwplan.repository;

import org.springframework.data.repository.CrudRepository;

import de.amc17.dhbwplan.entity.User;

public interface UserRepository extends CrudRepository<User, Integer> {
	User findByemail(String email);
	User findByusername(String username);
}
