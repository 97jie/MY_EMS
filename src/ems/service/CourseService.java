package ems.service;

import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import ems.dao.CourseDao;
import ems.entity.Course;

@Service
public class CourseService {
	@Autowired 
	CourseDao courseDao;
	
	public List<Course> getAll(){
		return courseDao.getAll();
	}

	public void addCourse(@Valid Course course) {
		courseDao.addCourse(course);
	}

	public void benchDel(String[] idxs) {
		courseDao.benchDel(idxs);
	}

	public List<Course> search(String c) {
		return courseDao.search(c);
	}
}
