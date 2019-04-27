package ems.entity;

import java.util.Collections;
import java.util.Comparator;
import java.util.List;

public class Common {

	public static void calStuScore(List<HwStudent> hwStudents, StudentScore studentScore, double total_weight) {
		Collections.sort(hwStudents,new Comparator<HwStudent>() {
			@Override
			public int compare(HwStudent o1, HwStudent o2) {
				return o1.getHs_score().compareTo(o2.getHs_score());
			}
		});
		studentScore.setMax_score(hwStudents.get(hwStudents.size()-1).getHs_score());
		studentScore.setMin_score(hwStudents.get(0).getHs_score());
		studentScore.setCommit_num(hwStudents.size());
		double score=0.0;
		for(HwStudent hwStudent1:hwStudents) {
			score+=(hwStudent1.getHs_score()*hwStudent1.getHt_weight()/total_weight);
		}
		studentScore.setS_score(Math.ceil(score));
	}

	public static double calTotalWeight(List<HwTeacher> hwTeachers) {
		double w = 0.0;
		if(hwTeachers!=null&&hwTeachers.size()>0) {
			for(HwTeacher hwTeacher:hwTeachers) {
				w+=hwTeacher.getHt_weight();
			}
			return Math.ceil(w);
		}
		return 0.0;
	}

	
}
