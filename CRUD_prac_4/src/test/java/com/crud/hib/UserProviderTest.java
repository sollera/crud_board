package com.crud.hib;

import java.util.List;

import org.junit.Before;
import org.junit.Test;

public class UserProviderTest {
	private UserProvider provider;
	@Before
	public void setUp() throws Exception {
		provider = new UserHibernateProviderImpl();
	}
	 
	@Test
	public void testSelectList() throws Exception {
		List<User> list = provider.selectList(0);
		for(int i = 0; i < list.size();i++) {
			System.out.println(list.get(i).getTitle());
		}
	}
}
