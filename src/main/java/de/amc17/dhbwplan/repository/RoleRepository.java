package de.amc17.dhbwplan.repository;

import org.springframework.data.repository.CrudRepository;

import de.amc17.dhbwplan.entity.Role;
import de.amc17.dhbwplan.enums.UserRoles;

public interface RoleRepository extends CrudRepository<Role, Integer> {
	Role findByrole(UserRoles role);
}
