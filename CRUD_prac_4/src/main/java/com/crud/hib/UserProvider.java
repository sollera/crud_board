package com.crud.hib;

import java.util.List;

public interface UserProvider {
	public List<User> selectList(int startNo);
}
