package ems.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import ems.dao.MyClassDao;
import ems.entity.MyClass;

@Service
public class MyClassService {
	@Autowired
	MyClassDao myClassDao;

	public List<MyClass> getBanJi(int aca_idx,String b_grade){
		return myClassDao.getBanJi(aca_idx, b_grade);
	}

	public List<MyClass> getAll() {
		// TODO Auto-generated method stub
		return myClassDao.getAll();
	}

	public void addClass(MyClass myclass) {
		myClassDao.addClass(myclass);
	}

	public MyClass getBan(int b_idx) {
		return myClassDao.getBan(b_idx);
	}

	public void savaBan(MyClass myClass) {
		myClassDao.savaBan(myClass);
	}

	public void benchDel(String[] idxs) {
		myClassDao.benchDel(idxs);
	}

	public List<MyClass> searchByName(String b_name) {
		return myClassDao.searchByName(b_name);
	}
}
