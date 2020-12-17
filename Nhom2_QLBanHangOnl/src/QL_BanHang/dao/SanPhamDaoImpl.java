package QL_BanHang.dao;

import java.io.File;
import java.util.List;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import QL_BanHang.model.NhaCungCap;
import QL_BanHang.model.NhomSanPham;
import QL_BanHang.model.SanPham;

@Repository("sanphamDao")
public class SanPhamDaoImpl implements SanPhamDao {

	@Autowired
	private SessionFactory sessionFactory;

	// Hàm thêm sản phẩm
	public void addSanPham(SanPham sanpham) {
		sessionFactory.getCurrentSession().saveOrUpdate(sanpham);
	}

	// Hàm lấy list sản phẩm
	@SuppressWarnings("unchecked")
	public List<SanPham> listSanPham() {
		return (List<SanPham>) sessionFactory.getCurrentSession().createCriteria(SanPham.class).list();
	}

	// Hàm lấy sản phẩm theo mã sản phẩm
	public SanPham getSanPham(String masp) {
		return (SanPham) sessionFactory.getCurrentSession().get(SanPham.class, masp);
	}

	// Hàm xóa sản phẩm
	public void deleteSanPham(SanPham sanpham) {
		sessionFactory.getCurrentSession().createQuery("DELETE FROM SanPham WHERE MaSP = '" + sanpham.getMaSP() + "'")
				.executeUpdate();
	}

	// Hàm xóa theo mã sản phẩm
	public void deleteSanPham1(String masp) {
		sessionFactory.getCurrentSession().createQuery("DELETE FROM SanPham WHERE MaSP = '" + masp + "'")
				.executeUpdate();

	}

//Hàm update image
	public void updateImage(SanPham sanpham, String tenhinh) {
		sessionFactory.getCurrentSession()
				.createQuery("update SanPham set Hinh ='" + tenhinh + "' where MaSP = '" + sanpham.getMaSP() + "'")
				.executeUpdate();

	}

	public String folderlocation() {
		String basePath = new File("").getAbsolutePath();
		System.out.println(basePath);
		return basePath;
	}
}
