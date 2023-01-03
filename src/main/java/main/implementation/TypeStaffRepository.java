package main.implementation;

import java.util.List;

import org.hibernate.*;
import main.entity.TypeStaff;
public class TypeStaffRepository implements BaseRepository<TypeStaff> {
	private static TypeStaffRepository instance;
	public static TypeStaffRepository getInstance() {
		if (TypeStaffRepository.instance == null) {
			TypeStaffRepository.instance = new TypeStaffRepository();
		}
		
		return TypeStaffRepository.instance;
	}
	
	public List<TypeStaff> find(String options, Session session) {
		String hql = "FROM TypeStaff " + options;
		Query query = session.createQuery(hql);
		List<TypeStaff> list = query.list();
		
		return list;
	}
}
