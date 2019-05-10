package ems.service;

import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import ems.dao.HtDao;
import ems.dao.StudentDao;
import ems.dao.TeacherDao;
import ems.dao.TrDao;
import ems.dao.TrLikeDao;
import ems.entity.TopicReply;

@Service
public class TrService {

	@Autowired
	TrDao trDao;
	@Autowired
	StudentDao studentDao;
	@Autowired
	TeacherDao teacherDao;
	@Autowired
	TrLikeDao trLikeDao;
	@Autowired
	HtDao htDao;
	
	
	public List<TopicReply> getAll(String zt_idx, Integer tr_no, String sort) {
		List<TopicReply> list=trDao.getAll(zt_idx,sort);
		if(list!=null&&list.size()>0) {
			for(TopicReply tr:list) {
				getTrName(tr);
				int countNum = trLikeDao.countNum(tr.getTr_idx()+"", tr_no+"");
				if(countNum>0) {
					tr.setFlag("1");//点赞过
				}else {
					tr.setFlag("2");
				}
			}
		}
		return list;
	}
	
	void getTrName(TopicReply tr) {
		if(tr.getTr_no().startsWith("1")||tr.getTr_no().startsWith("2")) {
			tr.setTr_name(teacherDao.searchByName(tr.getTr_no()).get(0).getT_name()+"(教师) :");
		}else{
			tr.setTr_name(studentDao.search(tr.getTr_no()).get(0).getS_name()+"(学生) :");
		}
	}

	public void savaTr(@Valid TopicReply tr) {
		String tr_content=tr.getTr_content();
		if(tr.getZt_idx()==null) {
			String bc_idx=htDao.queryByIdx(Integer.parseInt(tr_content)).getBc_idx()+"";
			tr.setTr_content(bc_idx);
		}
		trDao.savaTr(tr);
	}
	
	@Transactional
	public void changeLike(Integer tr_idx, String like_no, int num) {
		if(num==1) {
			trLikeDao.insert(tr_idx,like_no);
		}else {
			trLikeDao.delete(tr_idx,like_no);
		}
		trDao.changeLike(tr_idx,num);
	}

	public List<TopicReply> getTrsWithNo(String zt_no) {
		List<TopicReply> list=trDao.getTrsWithNo(zt_no);
		if(list!=null&&list.size()>0) {
			for(TopicReply tr:list) {
				getTrName(tr);
			}
		}
		return list;
	}

}
