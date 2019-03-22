package ems.dao;

import java.util.List;

import ems.entity.ClassCourse;

public interface BanCourseDao {

	List<ClassCourse> getAllWithBIdx(Integer b_dx);

	List<ClassCourse> getAllWithTNo(String t_no);

	ClassCourse queryBc(Integer bc_idx);
}
