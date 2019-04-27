package ems.dao;

public interface TrLikeDao {
	int countNum(String tr_idx,String tr_no);

	void insert(Integer tr_idx, String like_no);

	void delete(Integer tr_idx, String like_no);
}
