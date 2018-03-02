package com.crud.hib;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
//import org.hibernate.Transaction;

public class UserHibernateProviderImpl implements UserProvider {
	 public List<User> selectList(int startNo) {
		Session session = HibernateUtil.getSessionFactory().openSession();
		Query query = session.createQuery("FROM User WHERE textlvl=0 ORDER BY ref desc");
		query.setFirstResult(startNo);
		query.setMaxResults(10);
		List list = query.list();
		
		session.close();
		return list;
	 }
}
