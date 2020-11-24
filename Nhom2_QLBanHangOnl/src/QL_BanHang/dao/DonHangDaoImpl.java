package QL_BanHang.dao;

import java.util.List;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import QL_BanHang.model.DonHang;
import QL_BanHang.model.DonHangChiTiet;

@Repository("donhangDao")
public class DonHangDaoImpl implements DonHangDao {
	@Autowired
	private SessionFactory sessionFactory;

	public void addDonHang(DonHang donhang) {
		sessionFactory.getCurrentSession().saveOrUpdate(donhang);
	}

	@SuppressWarnings("unchecked")
	public List<DonHang> listDonHang() {
		return (List<DonHang>) sessionFactory.getCurrentSession().createCriteria(DonHang.class).list();
	}

	public DonHang getDonHang(String manhacc) {
		return (DonHang) sessionFactory.getCurrentSession().get(DonHang.class, manhacc);
	}

	public void deleteDonHang(DonHang donhang) {
		sessionFactory.getCurrentSession()
				.createQuery("DELETE FROM DonHang WHERE MaDonHang = '" + donhang.getMaDonHang() + "'").executeUpdate();
	}

	/*
	 * public List<DonHangChiTiet> listDonHangChiTiet(String madh) {
	 * sessionFactory.getCurrentSession().
	 * createQuery("select * FROM DonHangChiTiet WHERE MaDonHang = '" + madh +
	 * "'").executeUpdate(); return null; }
	 */
	@SuppressWarnings("unchecked")
	public List<DonHangChiTiet> listDonHangChiTiet(String madh) {
		return (List<DonHangChiTiet>) sessionFactory.getCurrentSession()
				.createQuery(" FROM DonHangChiTiet WHERE MaDonHang = '" + madh + "'").list();
	}
}
