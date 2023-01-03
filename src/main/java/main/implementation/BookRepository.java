package main.implementation;
import java.util.Date;
import java.util.List;

import org.hibernate.*;
import main.entity.Book;
import main.util.Constants;
public class BookRepository implements BaseRepository<Book> {
	private static BookRepository instance;
	public static BookRepository getInstance() {
		if (BookRepository.instance == null) {
			BookRepository.instance = new BookRepository();
		}
		
		return BookRepository.instance;
	}
	
	public List<Book> find(String options, Session session) {
		String hql = "FROM Book " + options;
		Query query = session.createQuery(hql);
		List<Book> list = query.list();
		
		return list;
	}
	
	public Book findOne(String options, Session session) {
		String hql = "FROM Book " + options;
		Query query = session.createQuery(hql);
		query.setMaxResults(1);
		List<Book> list = query.list();
		
		if (list.size() > 0) {
			return list.get(0);
		}
		
		return null;	
	}
	
	public Book findBookNew(String phone, Session session) {
		String hql = "FROM Book where phoneCustomer=? and statusBook=?";;
		Query query = session.createQuery(hql).setParameter(0, phone).setParameter(1, Constants.BOOKED);
		query.setMaxResults(1);
		List<Book> list = query.list();
		
		if (list.size() > 0) {
			return list.get(0);
		}
		
		return null;	
	}
	
	public Book findByPhoneAndStatus(String phone, String status, Session session) {
		String hql = "FROM Book WHERE phoneCustomer =? AND statusBook =? order by DateBook desc";
		Query query = session.createQuery(hql).setParameter(0, phone).setParameter(1, status);
		query.setMaxResults(1);
		List<Book> list = query.list();
		
		if (list.size() > 0) {
			return list.get(0);
		}
		
		return null;	
	}
	
	public List<Book> customFind(Date firstDate, Date lastDate, int idStore, Session session) {
		String hql = "FROM Book WHERE dateBook between ? and ? and idStore=?";
		Query query = session.createQuery(hql).setParameter(0, firstDate).setParameter(1, lastDate).setParameter(2, idStore);
		List<Book> list = query.list();
		
		return list;
	}
	
	public List<Book> findBySkip(int skip, int idStore, Session session) {
		String hql = "FROM Book WHERE idStore=? ORDER BY(dateBook) desc";
		Query query = session.createQuery(hql).setParameter(0, idStore);
		query.setFirstResult(skip);
		query.setMaxResults(10);
		List<Book> list = query.list();
		
		return list;
	}
	
	public int deleteByField(Date dateBook, String idShift, String idStaff, Session session) {
		String hql = "DELETE FROM Book WHERE "
				+ "dateBook=? AND idShiftBook=? AND idStaff=?";
		
		Query query = session.createQuery(hql)
							 .setParameter(0, dateBook)
							 .setParameter(1, idShift)
							 .setParameter(2, idStaff);
		
		int matchedRemove = query.executeUpdate();
		System.out.println("Matched remove: " + matchedRemove);
		
		return matchedRemove;
	}
	
	public Date maxDateBook(Session session) {
		String hql = "SELECT MAX(dateBook) FROM Book";
		Query query = session.createQuery(hql);
		Date max = (Date) query.uniqueResult();
		return max;
	}
	
	public long countBookByStatusAndDate(Date firstDate, Date lastDate, int idStore, String status, Session session) {
		String hql = "SELECT Count(dateBook) FROM Book WHERE dateBook between ? and ? and statusBook = ? and idStore = ?";
		Query query = session.createQuery(hql)
							 .setParameter(0, firstDate)
							 .setParameter(1, lastDate)
							 .setParameter(2, status)
							 .setParameter(3, idStore);
		long count = (Long) query.uniqueResult();
		return count;
	}
	
	public long totalPaymentByDate(Date firstDate, Date lastDate, int idStore, Session session) {
		String hql = "SELECT Sum(payment) FROM Book WHERE dateBook between ? and ? and idStore = ?";
		Query query = session.createQuery(hql)
							 .setParameter(0, firstDate)
							 .setParameter(1, lastDate)
							 .setParameter(2, idStore);
		long sum = 0;
		if (query.uniqueResult() != null) {
			sum = (Long) query.uniqueResult();	
		}
		return sum;
	}
	
	public long count(String options, Session session) {
		String hql = "SELECT Count(dateBook) FROM Book " + options;
		Query query = session.createQuery(hql);
		long count = (Long) query.uniqueResult();
		return count;
	}
	
	public Date minDateBook(Session session) {
		String hql = "SELECT Min(dateBook) FROM Book";
		Query query = session.createQuery(hql);
		Date min = (Date) query.uniqueResult();
		return min;
	}
	
	public Boolean save(Book book, Session session) {
		Transaction transaction = session.beginTransaction();
		try {
			session.save(book);
			transaction.commit();
			return true;
		} catch(Exception e) {
			transaction.rollback();
			System.out.println("Error while saving Book: " + e);
		}
		
		return false;
	}
	
	public Boolean update(Book book, Session session) {
		Transaction transaction = session.beginTransaction();
		try {
			session.update(book);
			transaction.commit();
			return true;
		} catch(Exception e) {
			transaction.rollback();
			System.out.println("Error while updating Book: " + e);
		}
		
		return false;
	}
}
