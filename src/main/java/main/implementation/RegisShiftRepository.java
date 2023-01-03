package main.implementation;

import java.util.Date;
import java.util.List;

import org.hibernate.*;

import main.entity.RegisShift;
public class RegisShiftRepository implements BaseRepository<RegisShift> {
	private static RegisShiftRepository instance;
	public static RegisShiftRepository getInstance() {
		if (RegisShiftRepository.instance == null) {
			RegisShiftRepository.instance = new RegisShiftRepository();
		}
		
		return RegisShiftRepository.instance;
	}
	
	public List<RegisShift> find(String options, Session session) {
		String hql = "FROM RegisShift " + options;
		Query query = session.createQuery(hql);
		List<RegisShift> list = query.list();
		
		return list;
	}
	
	public List<RegisShift> findByCondition(Date date, String idStore, Session session) {
		String hql = "FROM RegisShift WHERE dateRegis >=? AND store.idStore=?";
		Query query = session.createQuery(hql).setParameter(0, date).setParameter(1, idStore);
		
		List<RegisShift> list = query.list();
		return list;
	}
	
	public RegisShift findByDateAndIdStaff(Date date, String idStaff, Session session) {
		String hql = "FROM RegisShift WHERE dateRegis=? AND idStaff=?";
		Query query = session.createQuery(hql).setParameter(0, date).setParameter(1, idStaff);
		query.setMaxResults(1);
		List<RegisShift> list = query.list();
		if (list.size() > 0) {
			return list.get(0);
		}
		
		return null;
	}
	
	public Boolean save(RegisShift rs, Session session) {
		Transaction transaction = session.beginTransaction();
		try {
			session.save(rs);
			transaction.commit();
			return true;
		} catch(Exception e) {
			transaction.rollback();
			System.out.println("Error while saving RegisShift: " + e);
		}
		
		return false;
	}
	
	public Boolean update(RegisShift rs, Session session) {
		Transaction transaction = session.beginTransaction();
		try {
			session.update(rs);
			transaction.commit();
			return true;
		} catch(Exception e) {
			transaction.rollback();
			System.out.println("Error while updating RegisShift: " + e);
		}
		
		return false;
	}
}
