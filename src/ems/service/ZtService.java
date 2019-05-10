package ems.service;

import java.util.Comparator;
import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import ems.dao.StudentDao;
import ems.dao.TeacherDao;
import ems.dao.ZtDao;
import ems.entity.Student;
import ems.entity.Teacher;
import ems.entity.ZoneTopic;

@Service
public class ZtService {

	@Autowired
	ZtDao ztDao;
	@Autowired
	StudentDao studentDao;
	@Autowired
	TeacherDao teacherDao;
	
	public void savaZt(@Valid ZoneTopic zt) {
		ztDao.savaZt(zt);
	}

	public List<ZoneTopic> getWithBcIdx(String bc_idx, String sort) {
		List<ZoneTopic> list=ztDao.getWithBcIdx(bc_idx,sort);
		if(list!=null&&list.size()>0) {
			for(ZoneTopic zt:list) {
				getZtName(zt);
				String content=zt.getZt_content();
				if(content.length()>44) {
					zt.setZt_content(content.substring(0, 44)+"...");
				}
			}
		}
		return list;
	}

	public ZoneTopic getWithKey(Integer zt_idx) {
		ZoneTopic zt=ztDao.getWithKey(zt_idx);
		getZtName(zt);
		return zt;
	}
	
	void getZtName(ZoneTopic zt) {
		if(zt.getZt_no().startsWith("4")) {
			zt.setZt_name(studentDao.search(zt.getZt_no()).get(0).getS_name()+"(学生) :");
		}else{
			zt.setZt_name(teacherDao.searchByName(zt.getZt_no()).get(0).getT_name()+"(教师) :");
		}
	}

	public void updateHeat(int zt_idx, int num) {
		ztDao.updateHeat(zt_idx,num);
	}
}
