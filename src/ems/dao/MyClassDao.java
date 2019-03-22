package ems.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Component;

import ems.entity.MyClass;

@Component
public interface MyClassDao {
	
	List<MyClass> getBanJi(int aca_idx,String b_grade);

	List<MyClass> getAll();

	void addClass(MyClass myclass);

	MyClass getBan(int b_idx);

	void savaBan(MyClass myClass);

	void benchDel(String[] idxs);

	List<MyClass> searchByName(@Param(value="b_name")String b_name);
}
