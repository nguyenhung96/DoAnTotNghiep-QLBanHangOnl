package QL_BanHang.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import QL_BanHang.dao.NhanVienDao;
import QL_BanHang.model.NhanVien;
import QL_BanHang.model.QuyenNV;

/**
 * @author Dinesh Rajput
 *
 */

@Service("nhanvienService")
@Transactional(propagation = Propagation.SUPPORTS, readOnly = true)
public class NhanVienServiceImpl implements NhanVienService {

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

	public String genratemaNV() {
		return nhanvienDao.genratemaNV();
	}

	@Override
	public QuyenNV getquyennv(String manv) {

		return nhanvienDao.getquyennv(manv);
	}

	@Override
	public List<QuyenNV> listQuyenNhanVien() {
		// TODO Auto-generated method stub
		return nhanvienDao.listQuyenNhanVien();
	}

	@Override
	public void taoquyenchonhanvien(QuyenNV quyenNV) {
		nhanvienDao.taoquyenchonhanvien(quyenNV);
		
	}

	@Override
	public List<QuyenNV> listquyennvtheoma(String manv) {
	
		return nhanvienDao.listquyennvtheoma(manv);
	}

	@Override
	public void setpasworld(NhanVien nhanvien, String matkhau) {
	nhanvienDao.setpasworld(nhanvien, matkhau);
		
	}

	@Override
	public void deleteRole(String manv) {
		nhanvienDao.deleteRole(manv);
		
	}


}
