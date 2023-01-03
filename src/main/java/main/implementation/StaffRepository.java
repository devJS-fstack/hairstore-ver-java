package main.implementation;

import java.util.Date;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

import main.entity.Staff;
import main.util.Constants;

public class StaffRepository {
	private static StaffRepository instance;
	public static StaffRepository getInstance() {
		if (StaffRepository.instance == null) {
			StaffRepository.instance = new StaffRepository();
		}
		
		return StaffRepository.instance;
	}
	
	public List<Staff> find(String options, Session session) {
		String hql = "FROM Staff " + options;
		Query query = session.createQuery(hql);
		List<Staff> list = query.list();
		
		return list;
	}
	
	public List<Staff> findStaffActive(String options, Session session) {
		String hql = "FROM Staff WHERE status=? " + options;
		Query query = session.createQuery(hql).setParameter(0, Constants.STATUS_STAFF_ACTIVE);
		List<Staff> list = query.list();
		
		return list;
	}
	
	public List<Staff> findStylistActive(String idStore, Session session) {
		String hql = "FROM Staff WHERE status=? AND typeStaff = 1 AND store.idStore=?";
		Query query = session.createQuery(hql).setParameter(0, Constants.STATUS_STAFF_ACTIVE).setParameter(1, idStore);
		List<Staff> list = query.list();
		
		return list;
	}
	
	public List<Staff> findStaffByDateRegis(Date dateRegis, String idStore, Session session) {
		String hql = "FROM Staff s JOIN s.listRegis rs WHERE rs.dateRegis = ?"
				+ " AND s.store.idStore = ?";
		Query query = session.createQuery(hql)
											  .setParameter(0, dateRegis)
											  .setParameter(1, idStore);
		List<Staff> list = query.list();
		return list;
	}
	
	public Staff findById(String idStaff, Session session) {
		String hql = "FROM Staff WHERE idStaff=?";
		Query query = session.createQuery(hql).setParameter(0, idStaff);
		query.setMaxResults(1);
		
		List<Staff> staffs = query.list();
		
		if (staffs.size() > 0) {
			return staffs.get(0);
		}
		
		return null;
	}
	
	public Staff findByEmail(String email, Session session) {
		String hql = "FROM Staff WHERE email=?";
		Query query = session.createQuery(hql).setParameter(0, email);
		query.setMaxResults(1);
		
		List<Staff> staffs = query.list();
		
		if (staffs.size() > 0) {
			return staffs.get(0);
		}
		
		return null;
	}
	
	public Staff findByPhone(String phone, Session session) {
		String hql = "FROM Staff WHERE phone=?";
		Query query = session.createQuery(hql).setParameter(0, phone);
		query.setMaxResults(1);
		
		List<Staff> staffs = query.list();
		
		if (staffs.size() > 0) {
			return staffs.get(0);
		}
		
		return null;
	}
	
	public Boolean save(Staff st, Session session) {
		Transaction transaction = session.beginTransaction();
		try {
			session.save(st);
			transaction.commit();
			return true;
		} catch(Exception e) {
			transaction.rollback();
			System.out.println("Error while saving Staff: " + e.toString());
		}
		
		return false;
	}
	
	public Boolean update(Staff st, Session session) {
		Transaction transaction = session.beginTransaction();
		try {
			session.update(st);
			transaction.commit();
			return true;
		} catch(Exception e) {
			transaction.rollback();
			System.out.println("Error while saving Staff: " + e.toString());
		}
		
		return false;
	}
}
