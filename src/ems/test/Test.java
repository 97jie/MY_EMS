package ems.test;

import static org.junit.jupiter.api.Assertions.*;

class Test {

	@org.junit.jupiter.api.Test
	void test() {
		String s="dsadajkshdas-1001";
		s=s.replaceAll("/^-", "1");
		System.out.println(s);
	}

}
