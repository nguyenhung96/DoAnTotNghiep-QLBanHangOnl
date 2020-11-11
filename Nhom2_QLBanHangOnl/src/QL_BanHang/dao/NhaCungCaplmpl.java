package QL_BanHang.dao;

import java.util.List;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import QL_BanHang.model.NhaCungCap;
import QL_BanHang.model.NhanVien;

@Repository("NhaCungCapDao")
public class NhaCungCaplmpl implements NhaCungCapDao{
	@Autowired
	private SessionFactory sessionFactory;
	
	public void addNhaCungCap(NhaCungCap nhacungcap) {
		sessionFactory.getCurrentSession().saveOrUpdate(nhacungcap);
	}

	@SuppressWarnings("unchecked")
	public List<NhaCungCap> listNhaCungCap() {
		return (List<NhaCungCap>) sessionFactory.getCurrentSession().createCriteria(NhaCungCap.class).list();
	}

	public NhaCungCap getNhaCungCap(String MaNhaCungCap) {
		return (NhaCungCap) sessionFactory.getCurrentSession().get(NhaCungCap.class, MaNhaCungCap);
	}

	public void deleteNhaCungCap(NhaCungCap nhacungcap) {
		sessionFactory.getCurrentSession().createQuery("DELETE FROM NhanVien WHERE MaNhanVien = '"+ nhacungcap.getMaNhaCungCap()+"'").executeUpdate();
	}
}
