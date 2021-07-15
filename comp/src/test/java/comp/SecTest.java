package comp;

import egovframework.com.utl.sim.service.EgovFileScrty;

public class SecTest {

	public static void main(String[] args) throws Exception {
		String a =  EgovFileScrty.encryptPassword("rhdxhd12", "admin");
		System.out.println(a);

	}

}
