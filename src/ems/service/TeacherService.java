package ems.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import ems.dao.TeacherDao;
import ems.entity.Teacher;

@Service
public class TeacherService {
	
	@Autowired
	private TeacherDao teacherDao;

	public List<Teacher> getAll() {
		return teacherDao.getAll();
	}

	public void addTea(Teacher teacher) {
		teacherDao.addTea(teacher);
	}

	public void benchDel(String[] nos) {
		teacherDao.benchDel(nos);
	}
	public List<Teacher> searchByName(String t_name) {
		return teacherDao.searchByName(t_name);
	}

	public Teacher queryTea(Teacher teacher) {
		// TODO Auto-generated method stub
		return teacherDao.queryTea(teacher);
	}
	
	
}
