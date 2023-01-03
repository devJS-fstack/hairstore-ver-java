package main.implementation;

import java.util.List;

import org.hibernate.*;
import main.entity.Store;
public class StoreRepository implements BaseRepository<Store> {
	private static StoreRepository instance;
	public static StoreRepository getInstance() {
		if (StoreRepository.instance == null) {
			StoreRepository.instance = new StoreRepository();
		}
		
		return StoreRepository.instance;
	}
	
	public List<Store> find(String options, Session session) {
		String hql = "FROM Store " + options;
		Query query = session.createQuery(hql);
		List<Store> stores = query.list();
		
		return stores;
	}
	
	public Store findById(String idStore, Session session) {
		String hql = "FROM Store WHERE idStore=?";
		Query query = session.createQuery(hql).setParameter(0, idStore);
		query.setMaxResults(1);
		
		List<Store> list = query.list();
		
		if (list.size() > 0) {
			return list.get(0);
		}
		
		return null;
	}
}
