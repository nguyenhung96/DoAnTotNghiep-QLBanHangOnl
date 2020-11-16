package QL_BanHang.dao;

import java.util.List;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

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

	public KhachHang getKhachHang(String makh) {
		return (KhachHang) sessionFactory.getCurrentSession().get(KhachHang.class, makh);
	}

	public void deleteKhachHang(KhachHang khachhang) {
		sessionFactory.getCurrentSession().createQuery("DELETE FROM KhachHang WHERE maKH = '"+ khachhang.getMaKH()+"'").executeUpdate();
	}

}
