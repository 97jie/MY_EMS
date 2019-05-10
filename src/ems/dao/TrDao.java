package ems.dao;

import java.util.List;

import javax.validation.Valid;

import org.apache.ibatis.annotations.Param;

import ems.entity.TopicReply;

public interface TrDao {

	List<TopicReply> getAll(String zt_idx,@Param(value = "sort") String sort);

	void savaTr(@Valid TopicReply tr);

	void changeLike(Integer tr_idx, Integer num);

	List<TopicReply> getTrsWithNo(String zt_no);
	
}
