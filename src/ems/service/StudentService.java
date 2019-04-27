package ems.service;

import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import ems.dao.StudentDao;
import ems.entity.Student;

@Service
public class StudentService {
	
	@Autowired
	private StudentDao studentDao;
	
	public List<Student> getAllStus() {
		return studentDao.getAllStus();
	}

	public void addStu(@Valid Student student) {
		studentDao.addStu(student);
	}

	public void benchDel(String[] nos) {
		studentDao.benchDel(nos);
	}


	public List<Student> search(String stu) {
		return studentDao.search(stu);
	}

	public List<Student> moSearch(Student student) {
		// TODO Auto-generated method stub
		return studentDao.moSearch(student);
	}

	public Student queryStudent(Student student) {
		return studentDao.queryStudent(student);
	}

	public List<Student> queryByBan(Integer b_idx){
		return studentDao.queryByBan(b_idx);
	}

	public void saveStu(Student s) {
		studentDao.saveStu(s);
	}
}
