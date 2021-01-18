package QL_BanHang.dao;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import QL_BanHang.model.DonHang;
import QL_BanHang.model.KhachHang;

@Repository("khachhangDao")
public class KhachHangDaoImpl implements KhachHangDao {

	@Autowired
	private SessionFactory sessionFactory;

	public void addKhachHang(KhachHang khachhang) {
		sessionFactory.getCurrentSession().saveOrUpdate(khachhang);
	}

	@SuppressWarnings("unchecked")
	public List<KhachHang> listKhachHang() {
		return (List<KhachHang>) sessionFactory.getCurrentSession().createCriteria(KhachHang.class).list();
	}
	
	// Don hang
	@SuppressWarnings("unchecked")
	public List<DonHang> listDonHang() {
		return (List<DonHang>) sessionFactory.getCurrentSession().createQuery("Select * from DonHang where MaKH =").list();
	}
	@SuppressWarnings("unchecked")
	public List<String> getMailKH() {
		return (List<String>) sessionFactory.getCurrentSession().createQuery("select Email from KhachHang").list();
	}

	public KhachHang getKhachHang(String makh) {
		return (KhachHang) sessionFactory.getCurrentSession().get(KhachHang.class, makh);
	}
	
	public void deleteKhachHang(KhachHang khachhang) {
		sessionFactory.getCurrentSession()
				.createQuery("DELETE FROM KhachHang WHERE maKH = '" + khachhang.getMaKH() + "'").executeUpdate();
	}
	
	// lấy thông tin email
//	public KhachHang selectKhachHang(String email) {
//		return (KhachHang) sessionFactory.getCurrentSession().get(KhachHang.class, email);
//	}
//	
	public KhachHang selectKhachHang(String email) {
		return (KhachHang) sessionFactory.getCurrentSession()
				.createQuery("FROM KhachHang WHERE MaKH = '" + email + "'");
	}

	
	public String genratemaKH() {
		int coso = 0;
		String hql = "FROM KhachHang";
		Query query = sessionFactory.getCurrentSession().createQuery(hql);
		List<KhachHang> list = query.list();
		KhachHang lastId = list.get(list.size() - 1);
		coso = Integer.parseInt(lastId.getMaKH().toString().substring(2)) + 1;
		if (list.size() == 0) {
			coso = 1;
			return "KH00" + coso;
		} else if (coso < 10) {
			return "KH00" + coso;
		} else if (10 <= coso && 100 > coso) {
			return "KH0" + coso;
		} else {
			return "KH" + coso;
		}

	}

	@Override
	public int demKhachHang() {
		String hql = "FROM KhachHang";
		Query query = sessionFactory.getCurrentSession().createQuery(hql);
		List<KhachHang> list = query.list();
		int sokh = list.size();
		return sokh;
	}

	

}
