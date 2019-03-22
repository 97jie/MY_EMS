package ems.dao;

import java.util.List;

import javax.validation.Valid;

import org.apache.ibatis.annotations.Param;

import ems.entity.Course;

public interface CourseDao {
	
	List<Course> getAll();

	void addCourse(@Valid Course course);

	void benchDel(String[] idxs);

	List<Course> search(@Param(value="c") String c);
}
