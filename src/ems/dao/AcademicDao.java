package ems.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import ems.entity.Academic;

public interface AcademicDao {

	List<Academic> getAll();
	void addAca(Academic academic);
	Long countAca(String aca_name);
	Academic getAcaByIdx(Integer aca_idx); 
	void updataAca(Academic academic);
	void benchDel(String[] idxs);
	List<Academic> searchByName(@Param(value="aca_name")String aca_name);
}
