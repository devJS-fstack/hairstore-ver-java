package main.implementation;

import java.util.List;

import org.hibernate.*;
import main.entity.Service;
import main.util.Constants;
public class ServiceRepository implements BaseRepository<Service> {
	private static ServiceRepository instance;
	public static ServiceRepository getInstance() {
		if (ServiceRepository.instance == null) {
			ServiceRepository.instance = new ServiceRepository();
		}
		
		return ServiceRepository.instance;
	}
	
	public List<Service> find(String options, Session session) {
		String hql = "FROM Service " + options;
		Query query = session.createQuery(hql);
		List<Service> list = query.list();
		
		return list;
	}
	
	public Service findById(int idService, Session session) {
		String hql = "FROM Service WHERE idService=?";
		Query query = session.createQuery(hql).setParameter(0, idService);
		query.setMaxResults(1);
		
		List<Service> list = query.list();
		
		if (list.size() > 0) {
			return list.get(0);
		}
		
		return null;
	}
	
	public List<Service> findServicesActive(String options, Session session) {
		String hql = "FROM Service WHERE status=?" + options;
		Query query = session.createQuery(hql).setParameter(0, Constants.STATUS_SERVICE_ACTIVE);
		List<Service> list = query.list();
		
		return list;
	}
	
	public int maxId(Session session) {
		String hql = "SELECT MAX(idService) FROM Service";
		Query query = session.createQuery(hql);
		int max = (int) query.uniqueResult();
		return max;
	}
	
	public Boolean save(Service sv, Session session) {
		Transaction transaction = session.beginTransaction();
		try {
			session.save(sv);
			transaction.commit();
			return true;
		} catch(Exception e) {
			transaction.rollback();
			System.out.println("Error while saving Service: " + e);
		}
		
		return false;
	}
	
	public Boolean update(Service sv, Session session) {
		Transaction transaction = session.beginTransaction();
		try {
			session.update(sv);
			transaction.commit();
			return true;
		} catch(Exception e) {
			transaction.rollback();
			System.out.println("Error while saving Service: " + e);
		}
		
		return false;
	}
	
	
}
