package QL_BanHang.dao;

import java.util.List;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import QL_BanHang.model.SanPham;

@Repository("sanphamDao")
public class SanPhamDaoImpl implements SanPhamDao {

	@Autowired
	private SessionFactory sessionFactory;
	
	public void addSanPham(SanPham sanpham) {
		sessionFactory.getCurrentSession().saveOrUpdate(sanpham);
	}

	@SuppressWarnings("unchecked")
	public List<SanPham> listSanPham() {
		return (List<SanPham>) sessionFactory.getCurrentSession().createCriteria(SanPham.class).list();
	}

	public SanPham getSanPham(String masp) {
		return (SanPham) sessionFactory.getCurrentSession().get(SanPham.class, masp);
	}

	public void deleteSanPham(SanPham sanpham) {
		sessionFactory.getCurrentSession().createQuery("DELETE FROM SanPham WHERE MaSP = '"+ sanpham.getMaSP()+"'").executeUpdate();
	}
}
