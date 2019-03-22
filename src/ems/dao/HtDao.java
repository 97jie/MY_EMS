package ems.dao;

import java.util.List;

import ems.entity.HwTeacher;

public interface HtDao {

	void pubHt(HwTeacher hwTeacher);

	List<HwTeacher> getAllHt(Integer bc_idx);

	void updateWeight(Integer ht_idx, Double ht_weight);

	HwTeacher queryByIdx(Integer ht_idx);

}
