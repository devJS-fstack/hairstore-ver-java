package main.implementation;

import java.util.List;

import org.hibernate.*;

import main.entity.TaiKhoan;
import main.entity.TypeService;
public class TypeServiceRepository implements BaseRepository<TypeService> {
	private static TypeServiceRepository instance;
	public static TypeServiceRepository getInstance() {
		if (TypeServiceRepository.instance == null) {
			TypeServiceRepository.instance = new TypeServiceRepository();
		}
		
		return TypeServiceRepository.instance;
	}
	
	public List<TypeService> find(String options, Session session) {
		String hql = "FROM TypeService " + options;
		Query query = session.createQuery(hql);
		List<TypeService> list = query.list();
		
		return list;
	}
	
	public Boolean save(TypeService ts, Session session) {
		Transaction transaction = session.beginTransaction();
		try {
			session.save(ts);
			transaction.commit();
			return true;
		} catch(Exception e) {
			transaction.rollback();
			System.out.println("Error while saving TypeService: " + e);
		}
		
		return false;
	}
	
	public Boolean update(TypeService ts, Session session) {
		Transaction transaction = session.beginTransaction();
		try {
			session.update(ts);
			transaction.commit();
			return true;
		} catch(Exception e) {
			transaction.rollback();
			System.out.println("Error while saving TaiKhoan: " + e);
		}
		
		return false;
	}
	
	public Boolean delete(TypeService ts, Session session) {
		Transaction transaction = session.beginTransaction();
		try {
			session.delete(ts);
			transaction.commit();
			return true;
		} catch(Exception e) {
			transaction.rollback();
			System.out.println("Error while saving TaiKhoan: " + e);
		}
		
		return false;
	}
	
	public int maxIdType(Session session) {
		String hql = "SELECT MAX(idTypeService) FROM TypeService";
		Query query = session.createQuery(hql);
		int max = (int) query.uniqueResult();
		return max;
	}
	
	public void updateAmount(Session session) {
		Query query = session.createQuery("update TypeService t SET amount = (SELECT Count(idService) FROM Service s WHERE s.typeService = t.idTypeService)");
		query.executeUpdate();
	}
}
