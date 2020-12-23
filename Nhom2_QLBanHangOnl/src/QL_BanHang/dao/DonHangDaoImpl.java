package QL_BanHang.dao;

import java.io.File;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import QL_BanHang.model.DonHang;
import QL_BanHang.model.DonHangChiTiet;
import QL_BanHang.model.KhachHang;

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

	@Override
	public void DuyetDonHang(DonHang donhang) {
		sessionFactory.getCurrentSession().createQuery("update DonHang set TrangThai = 2, MaNhanVien = '"
				+ donhang.getNhanvien().getMaNhanVien() + "' where MaDonHang = '" + donhang.getMaDonHang() + "'")
				.executeUpdate();
	}

	@Override
	public String autoGenrate() {
		int coso = 0;
		String hql = "FROM DonHang";
		Query query = sessionFactory.getCurrentSession().createQuery(hql);
		List<DonHang> list = query.list();
		DonHang lastId = list.get(list.size() - 1);
		coso = Integer.parseInt(lastId.getMaDonHang().toString().substring(2)) + 1;
		if (list.size() == 0) {
			coso = 1;
			return "DH00" + coso;
		} else if (coso < 10) {
			return "DH00" + coso;
		} else if (10 <= coso && 100 > coso) {
			return "DH0" + coso;
		} else {
			return "DH" + coso;
		}
	}

	public void createdonhangchitiet(DonHangChiTiet donHangChiTiet) {
		sessionFactory.getCurrentSession().saveOrUpdate(donHangChiTiet);

	}

}
