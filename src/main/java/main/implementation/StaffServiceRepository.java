package main.implementation;

import java.util.List;

import org.hibernate.*;
import main.entity.StaffService;
public class StaffServiceRepository implements BaseRepository<StaffService> {
	private static StaffServiceRepository instance;
	public static StaffServiceRepository getInstance() {
		if (StaffServiceRepository.instance == null) {
			StaffServiceRepository.instance = new StaffServiceRepository();
		}
		
		return StaffServiceRepository.instance;
	}
	
	public List<StaffService> find(String options, Session session) {
		String hql = "FROM StaffService " + options;
		Query query = session.createQuery(hql);
		List<StaffService> list = query.list();
		
		return list;
	}
	
	public Boolean save(StaffService staffService, Session session) {
		Transaction transaction = session.beginTransaction();
		try {
			session.save(staffService);
			transaction.commit();
			return true;
		} catch(Exception e) {
			transaction.rollback();
			System.out.println("Error while saving Book: " + e);
		}
		
		return false;
	}
	
	public Boolean insertMany(List<StaffService> listStaffService, Session session) {
		int count = 0;
		for (;count < listStaffService.size(); count++) {
			this.save(listStaffService.get(count), session);
		}
		
		return count == listStaffService.size();
	}
	
	public void deleteByIdService(int idService, Session session) {
		Query queryDelete = session.createQuery("delete StaffService WHERE idService=?").setParameter(0, idService);
		queryDelete.executeUpdate();
	}

	public void deleteByIdStaff(String idStaff, Session session) {
		Query queryDelete = session.createQuery("delete StaffService WHERE idStaff=?").setParameter(0, idStaff);
		queryDelete.executeUpdate();
	}
}
