package ems.dao;

import java.util.List;

import javax.validation.Valid;

import ems.entity.TopicReply;

public interface TrDao {

	List<TopicReply> getAll(String zt_idx);

	void savaTr(@Valid TopicReply tr);

	void changeLike(Integer tr_idx, Integer num);

	List<TopicReply> getTrsWithNo(String zt_no);
	
}
