package ems.dao;

import java.util.List;

import ems.entity.HwStudent;

public interface HsDao {

	List<HwStudent> queryByhtIdx(Integer ht_idx, String s_no);

	void pubHs(HwStudent hwStudent);

	void updateScore(Integer hs_idx, Integer hs_score);
	
}
