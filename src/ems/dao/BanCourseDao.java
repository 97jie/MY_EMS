package ems.dao;

import java.util.List;

import javax.validation.Valid;

import ems.entity.ClassCourse;

public interface BanCourseDao {

	List<ClassCourse> getAllWithBIdx(Integer b_dx);

	List<ClassCourse> getAllWithTNo(String t_no);

	ClassCourse queryBc(Integer bc_idx);

	List<ClassCourse> queryByCidx(Integer c_idx);

	void addBc(@Valid ClassCourse bc);

	void delBc(String bc_idx);
}
