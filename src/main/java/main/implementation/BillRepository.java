package main.implementation;
import java.util.Date;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

import main.entity.Bill;
import main.entity.Customer;

public class BillRepository implements BaseRepository<Bill>{
	private static BillRepository instance;
	public static BillRepository getInstance() {
		if (BillRepository.instance == null) {
			BillRepository.instance = new BillRepository();
		}
		
		return BillRepository.instance;
	}
	
	public List<Bill> find(String options, Session session) {
		String hql = "FROM Bill " + options;
		Query query = session.createQuery(hql);
		List<Bill> list = query.list();
		
		return list;
	}
	
	public List<Bill> customFind(Date firstDate, Date lastDate, int idStore, Session session) {
		String hql = "FROM Bill WHERE dateCreate between ? and ? and idStore=?";
		Query query = session.createQuery(hql).setParameter(0, firstDate).setParameter(1, lastDate).setParameter(2, idStore);
		List<Bill> list = query.list();
		return list;
	}
	
	public Boolean save(Bill bill, Session session) {
		Transaction transaction = session.beginTransaction();
		try {
			session.save(bill);
			transaction.commit();
			return true;
		} catch(Exception e) {
			transaction.rollback();
			System.out.println("Error while saving Bill: " + e);
		}
		
		return false;
	}
}
