package ems.service;

import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import ems.dao.BanCourseDao;
import ems.entity.ClassCourse;

@Service
public class BanCourseService {

	@Autowired
	BanCourseDao banCourseDao;
	
	public List<ClassCourse> getAllWithBIdx(Integer b_idx){
		return banCourseDao.getAllWithBIdx(b_idx);
	}

	public List<ClassCourse> getAllWithTNo(String t_no) {
		// TODO Auto-generated method stub
		return banCourseDao.getAllWithTNo(t_no);
	}
	
	public ClassCourse queryBc(Integer bc_idx) {
		return banCourseDao.queryBc(bc_idx);
	}

	public List<ClassCourse> queryByCidx(Integer c_idx) {
		// TODO Auto-generated method stub
		return banCourseDao.queryByCidx(c_idx);
	}

	public void addBc(@Valid ClassCourse bc) {
		banCourseDao.addBc(bc);
	}

	public void delBc(String bc_idx) {
		banCourseDao.delBc(bc_idx);
	}
}
