package ems.service;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import ems.dao.HtDao;
import ems.entity.HwTeacher;

@Service
public class HtService {

	@Autowired
	HtDao htDao;
	
	public void pubHt(HwTeacher hwTeacher) {
		htDao.pubHt(hwTeacher);
	}

	public List<HwTeacher> getAllHt(Integer bc_idx) {
		String today=new SimpleDateFormat("yyyy-MM-dd").format(new Date());
		
		List<HwTeacher> list=htDao.getAllHt(bc_idx);
		for(HwTeacher hwTeacher: list) {
			if(today.compareTo(hwTeacher.getHt_over_time())>0) {
				hwTeacher.setHt_zt("提交已截止");
			}else {
				hwTeacher.setHt_zt("作业进行中");
			}
		}
		return list;
	}

	public void updateWeight(Integer ht_idx, Double ht_weight) {
		htDao.updateWeight(ht_idx,ht_weight);
	}

	public HwTeacher queryByIdx(Integer ht_idx) {
		return htDao.queryByIdx(ht_idx);
	}

}
