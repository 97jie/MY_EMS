package ems.dao;

import java.util.List;

import ems.entity.HwStudent;
import ems.entity.HwTeacher;

public interface HsDao {

	List<HwStudent> queryByhtIdx(Integer ht_idx, String s_no);

	void pubHs(HwStudent hwStudent);

	void updateScore(Integer hs_idx, Integer hs_score);

	List<HwStudent> calStuScore(Integer bc_idx, String s_no);

	HwStudent queryByIdx(Integer hs_idx);
	
}
