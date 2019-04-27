package ems.dao;

import java.util.List;

import javax.validation.Valid;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Component;

import ems.entity.Student;
@Component
public interface StudentDao {
	public Student queryStudent(Student student); //根据学号密码查询学生

	public List<Student> getAllStus();

	public void addStu(@Valid Student student);

	public void benchDel(String[] nos);

	public List<Student> search(@Param(value="stu") String stu);

	public List<Student> moSearch(Student student);

	public List<Student> queryByBan(Integer b_idx);

	public void saveStu(Student s);
		
}
