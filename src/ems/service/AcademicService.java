package ems.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import ems.dao.AcademicDao;
import ems.entity.Academic;

@Service
public class AcademicService {

	@Autowired
	private AcademicDao academicDao;
	
	public List<Academic> getAll(){
		return academicDao.getAll();
	}
	
	public void addAca(Academic academic) {
		academicDao.addAca(academic);
	}

	public boolean checkAca(String aca_name) {
		Long count=academicDao.countAca(aca_name);
		return 0==count;
	}

	public Academic getAcaByIdx(Integer aca_idx) {
		return academicDao.getAcaByIdx(aca_idx);
	}
	
	public void updateAca(Academic academic) {
		academicDao.updataAca(academic);
	}
	
	public void benchDel(String[] idxs) {
		academicDao.benchDel(idxs);
	}

	public List<Academic> searchByName(String aca_name) {
		return academicDao.searchByName(aca_name);
	}

}
