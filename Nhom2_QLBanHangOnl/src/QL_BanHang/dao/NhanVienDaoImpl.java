package QL_BanHang.dao;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import QL_BanHang.model.DonHang;
import QL_BanHang.model.KhachHang;
import QL_BanHang.model.NhanVien;
import QL_BanHang.model.QuyenNV;

@Repository("nhanvienDao")
public class NhanVienDaoImpl implements NhanVienDao {

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
		sessionFactory.getCurrentSession()
				.createQuery("DELETE FROM NhanVien WHERE MaNhanVien = '" + nhanvien.getMaNhanVien() + "'")
				.executeUpdate();
	}

	public String genratemaNV() {
		int coso = 0;
		String hql = "FROM NhanVien";
		Query query = sessionFactory.getCurrentSession().createQuery(hql);
		List<NhanVien> list = query.list();
		NhanVien lastId = list.get(list.size() - 1);
		coso = Integer.parseInt(lastId.getMaNhanVien().toString().substring(2)) + 1;
		if (list.size() == 0) {
			coso = 1;
			return "NV00" + coso;
		} else if (coso < 10) {
			return "NV00" + coso;
		} else if (10 <= coso && 100 > coso) {
			return "NV0" + coso;
		} else {
			return "NV" + coso;
		}

	}

	@Override
	public QuyenNV getquyennv(String manv) {
		return (QuyenNV) sessionFactory.getCurrentSession().get(QuyenNV.class, manv);

	}

	@Override
	public List<QuyenNV> listQuyenNhanVien() {
		return (List<QuyenNV>) sessionFactory.getCurrentSession().createCriteria(QuyenNV.class).list();
	}

	@Override
	public void taoquyenchonhanvien(QuyenNV quyenNV) {
		sessionFactory.getCurrentSession().save(quyenNV);
	
	}

	// lay list quyen theo ma
	@Override
	public List<QuyenNV> listquyennvtheoma(String manv) {
		String hql = "FROM QuyenNV where MaNhanVien ='" + manv + "'";
		Query query = sessionFactory.getCurrentSession().createQuery(hql);
		List<QuyenNV> list = query.list();
		return list;
	}

	// Cấp lại mật khẩu
	public void setpasworld(NhanVien nhanvien, String matkhau) {
		sessionFactory.getCurrentSession().createQuery("Update NhanVien set MatKhau = '" + matkhau
				+ "' where MaNhanVien ='" + nhanvien.getMaNhanVien() + "'").executeUpdate();
	}

	@Override
	public void deleteRole(String manv) {
		sessionFactory.getCurrentSession()
		.createQuery("DELETE FROM QuyenNV WHERE MaNhanVien = '" + manv + "'")
		.executeUpdate();
		
	}

}
