package QL_BanHang.service;

import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import QL_BanHang.dao.NhanVienDao;
import QL_BanHang.model.NhanVien;

/**
 * @author Dinesh Rajput
 *
 */

@Service("nhanvienService")
@Transactional(propagation = Propagation.SUPPORTS, readOnly = true)
public class NhanVienServiceImpl implements NhanVienService{

	@Autowired
	private NhanVienDao nhanvienDao;
	
	@Transactional(propagation = Propagation.REQUIRED, readOnly = false)
	public void addNhanVien(NhanVien nhanvien) {
		nhanvienDao.addNhanVien(nhanvien);
	}
	
	public List<NhanVien> listNhanVien() {
		return nhanvienDao.listNhanVien();
	}

	public NhanVien getNhanVien(String manv) {
		return nhanvienDao.getNhanVien(manv);
	}
	
	public void deleteNhanVien(NhanVien nhanvien) {
		nhanvienDao.deleteNhanVien(nhanvien);
	}
}
