package ems.service;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import ems.dao.AdminDao;
import ems.entity.Admin;

@Service
public class AdminService {

	@Autowired
	private AdminDao adminDao;

	public Admin verify(Admin admin) {
		return adminDao.verify(admin);
	}

	public void saveA(@Valid Admin admin) {
		adminDao.saveA(admin);
	}
}
