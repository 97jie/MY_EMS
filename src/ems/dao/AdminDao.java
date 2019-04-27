package ems.dao;


import javax.validation.Valid;

import ems.entity.Admin;

public interface AdminDao {

	public Admin verify(Admin admin);

	public void saveA(@Valid Admin admin);
}
