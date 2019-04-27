package ems.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Component;

import ems.entity.Teacher;

@Component
public interface TeacherDao {

	List<Teacher> getAll();

	void addTea(Teacher teacher);

	void benchDel(String[] nos);
	List<Teacher> searchByName(@Param(value="t_name")String t_name);

	Teacher queryTea(Teacher teacher);

	List<Teacher> getTeaByAca(String aca_idx);
}
