package QL_BanHang.dao;

import java.util.List;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import QL_BanHang.model.NhaCungCap;
@Repository("nhacungcapDao")
public class NhaCungCapDaoImpl implements NhaCungCapDao {
	@Autowired
	private SessionFactory sessionFactory;
	
	public void addNhaCungCap(NhaCungCap nhacungcap) {
		sessionFactory.getCurrentSession().saveOrUpdate(nhacungcap);
	}

	@SuppressWarnings("unchecked")
	public List<NhaCungCap> listNhaCungCap() {
		return (List<NhaCungCap>) sessionFactory.getCurrentSession().createCriteria(NhaCungCap.class).list();
	}
	@SuppressWarnings("unchecked")
	public List<String> getMaNCC() {
		return (List<String>) sessionFactory.getCurrentSession().createQuery("select sp.nhacungcap.MaNhaCungCap from SanPham sp group by sp.nhacungcap.MaNhaCungCap").list();
	}
	@SuppressWarnings("unchecked")
	public List<String> getMaNCCFromNCC() {
		return (List<String>) sessionFactory.getCurrentSession().createQuery("select MaNhaCungCap from NhaCungCap").list();
	}
	@SuppressWarnings("unchecked")
	public List<String> getMaNCCFromNhomSP() {
		return (List<String>) sessionFactory.getCurrentSession().createQuery("SELECT nsp.nhacungcap.MaNhaCungCap FROM NhomSanPham nsp GROUP BY nsp.nhacungcap.MaNhaCungCap").list();
	}
	public NhaCungCap getNhaCungCap(String manhacc) {
		return (NhaCungCap) sessionFactory.getCurrentSession().get(NhaCungCap.class, manhacc);
	}

	public void deleteNhaCungCap(NhaCungCap nhacungcap) {
		sessionFactory.getCurrentSession().createQuery("DELETE FROM NhaCungCap WHERE MaNhaCungCap = '"+ nhacungcap.getMaNhaCungCap()+"'").executeUpdate();
	}
}
