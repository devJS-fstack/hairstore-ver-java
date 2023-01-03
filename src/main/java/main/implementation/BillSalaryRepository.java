package main.implementation;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

import main.entity.BillSalary;

public class BillSalaryRepository implements BaseRepository<BillSalary>{
	private static BillSalaryRepository instance;
	public static BillSalaryRepository getInstance() {
		if (BillSalaryRepository.instance == null) {
			BillSalaryRepository.instance = new BillSalaryRepository();
		}
		
		return BillSalaryRepository.instance;
	}
	
	public List<BillSalary> find(String options, Session session) {
		String hql = "FROM BillSalary " + options;
		Query query = session.createQuery(hql);
		List<BillSalary> list = query.list();
		
		return list;
	}
	
	public Boolean save(BillSalary bill, Session session) {
		Transaction transaction = session.beginTransaction();
		try {
			session.save(bill);
			transaction.commit();
			return true;
		} catch(Exception e) {
			transaction.rollback();
			System.out.println("Error while saving BillSalary: " + e);
		}
		
		return false;
	}
}
