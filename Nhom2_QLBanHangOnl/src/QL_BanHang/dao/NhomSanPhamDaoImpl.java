package QL_BanHang.dao;

import java.util.List;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import QL_BanHang.model.NhomSanPham;

@Repository("nhomsanphamDao")
public class NhomSanPhamDaoImpl implements NhomSanPhamDao {

	@Autowired
	private SessionFactory sessionFactory;

	public void addNhomSanPham(NhomSanPham nhomsanpham) {
		sessionFactory.getCurrentSession().saveOrUpdate(nhomsanpham);
	}

	@SuppressWarnings("unchecked")
	public List<NhomSanPham> listNhomSanPham() {
		return (List<NhomSanPham>) sessionFactory.getCurrentSession().createCriteria(NhomSanPham.class).list();
	}
	@SuppressWarnings("unchecked")
	public List<Integer> getMaNSP() {
		return (List<Integer>) sessionFactory.getCurrentSession().createQuery("select sp.nhomsanpham.Id FROM SanPham sp group by sp.nhomsanpham.Id").list();
	}
	public NhomSanPham getNhomSanPham(int Id) {
		return (NhomSanPham) sessionFactory.getCurrentSession().get(NhomSanPham.class, Id);
	}

	public void deleteNhomSanPham(NhomSanPham nhomsanpham) {
		sessionFactory.getCurrentSession()
				.createQuery("DELETE FROM NhomSanPham WHERE ID = '" + nhomsanpham.getId() + "'").executeUpdate();
	}

	public NhomSanPham getNhomSanPhamtheoten(String TenNhomSP) {
		return (NhomSanPham) sessionFactory.getCurrentSession().get(NhomSanPham.class, TenNhomSP);
	}

	public void deleteNhomSanPham1(int Id) {

		sessionFactory.getCurrentSession().createQuery("DELETE FROM NhomSanPham WHERE ID = " + Id).executeUpdate();
	}

}
