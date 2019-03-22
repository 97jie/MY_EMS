package ems.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import ems.dao.AdminDao;
import ems.entity.Admin;

@Service
public class AdminService {

	@Autowired
	private AdminDao adminDao;

	public Long verify(Admin admin) {
		return adminDao.verify(admin);
	}
}
