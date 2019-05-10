package ems.dao;

import java.util.List;

import javax.validation.Valid;

import org.apache.ibatis.annotations.Param;

import ems.entity.ZoneTopic;

public interface ZtDao {

	void savaZt(@Valid ZoneTopic zt);

	List<ZoneTopic> getWithBcIdx(String bc_idx,@Param(value = "sort") String sort);

	ZoneTopic getWithKey(Integer zt_idx);

	void updateHeat(int zt_idx, int num);

}
