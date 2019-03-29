package ems.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import ems.dao.HsDao;
import ems.entity.HwStudent;

@Service
public class HsService {

	@Autowired
	HsDao hsDao;
	
	public List<HwStudent> queryByhtIdx(Integer ht_idx, String s_no) {
		return hsDao.queryByhtIdx(ht_idx,s_no);
	}

	public void pubHs(HwStudent hwStudent) {
		hsDao.pubHs(hwStudent);
	}

	public void updateScore(Integer hs_idx, Integer hs_score) {
		hsDao.updateScore(hs_idx,hs_score);
	}

	public List<HwStudent> calStuScore(Integer bc_idx, String s_no) {
		return hsDao.calStuScore(bc_idx,s_no);
	}

}
