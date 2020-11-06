package QL_BanHang.dao;

import java.util.List;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import QL_BanHang.model.NhanVien;

@Repository("nhanvienDao")
public class NhanVienDaoImpl  implements NhanVienDao{

	@Autowired
	private SessionFactory sessionFactory;
	
	public void addNhanVien(NhanVien nhanvien) {
		sessionFactory.getCurrentSession().saveOrUpdate(nhanvien);
	}

	@SuppressWarnings("unchecked")
	public List<NhanVien> listNhanVien() {
		return (List<NhanVien>) sessionFactory.getCurrentSession().createCriteria(NhanVien.class).list();
	}

	public NhanVien getNhanVien(String manv) {
		return (NhanVien) sessionFactory.getCurrentSession().get(NhanVien.class, manv);
	}

	public void deleteNhanVien(NhanVien nhanvien) {
		sessionFactory.getCurrentSession().createQuery("DELETE FROM NhanVien WHERE MaNhanVien = '"+ nhanvien.getMaNhanVien()+"'").executeUpdate();
	}
}
