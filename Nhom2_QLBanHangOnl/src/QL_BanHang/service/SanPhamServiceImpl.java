package QL_BanHang.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import QL_BanHang.dao.KhachHangDao;
import QL_BanHang.dao.SanPhamDao;
import QL_BanHang.model.SanPham;

@Service("sanphamService")
@Transactional(propagation = Propagation.SUPPORTS, readOnly = true)
public class SanPhamServiceImpl implements SanPhamService {

	@Autowired
	private SanPhamDao sanphamDao;
	
	@Autowired
	private KhachHangDao khachhangDao;

	@Transactional(propagation = Propagation.REQUIRED, readOnly = false)
	public void addSanPham(SanPham sanpham) {
		sanphamDao.addSanPham(sanpham);
	}

	public List<SanPham> listSanPham() {
		return sanphamDao.listSanPham();
	}
	
//	public List<String> getMailKH() {
//		return khachhangDao.getMailKH();
//	}

	public SanPham getSanPham(String masp) {
		return sanphamDao.getSanPham(masp);
	}

	public void deleteSanPham(SanPham sanpham) {
		sanphamDao.deleteSanPham(sanpham);
	}

	public void deleteSanPham1(String masp) {
		sanphamDao.deleteSanPham1(masp);

	}

	public void updateImage(SanPham sanpham, String tenhinh) {
		sanphamDao.updateImage(sanpham, tenhinh);

	}
	public String locationfolder() {
		return sanphamDao.folderlocation();
	}

	public String autoGenrate() {
		
		return sanphamDao.autoGenrate();
	}
	
	@Override
	public int demSanPham() {
		return sanphamDao.demSanPham();
	}
}
