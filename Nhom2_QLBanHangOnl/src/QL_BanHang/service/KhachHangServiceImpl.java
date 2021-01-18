package QL_BanHang.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import QL_BanHang.dao.KhachHangDao;
import QL_BanHang.model.KhachHang;

@Service("khachhangService")
@Transactional(propagation = Propagation.SUPPORTS, readOnly = true)
public class KhachHangServiceImpl implements KhachHangService {

	@Autowired
	private KhachHangDao khachhangDao;

	@Transactional(propagation = Propagation.REQUIRED, readOnly = false)
	public void addKhachHang(KhachHang khachhang) {
		khachhangDao.addKhachHang(khachhang);
	}

	public List<KhachHang> listKhachHang() {
		return khachhangDao.listKhachHang();
	}

	public KhachHang getKhachHang(String makh) {
		return khachhangDao.getKhachHang(makh);
	}
	
	public List<String> getMailKH() {
		return khachhangDao.getMailKH();
	}
	
//	//lấy email
//	public KhachHang selectKhachHang(String email) {
//		return khachhangDao.getKhachHang(email);
//	}
	
	public KhachHang selectKhachHang(String email) {
		return khachhangDao.selectKhachHang(email);
	}

	public void deleteKhachHang(KhachHang khachhang) {
		khachhangDao.deleteKhachHang(khachhang);
	}

	public String genratemaKH() {
		return khachhangDao.genratemaKH();
	}

	@Override
	public int demKhachHang() {
		return khachhangDao.demKhachHang();
	}

}
