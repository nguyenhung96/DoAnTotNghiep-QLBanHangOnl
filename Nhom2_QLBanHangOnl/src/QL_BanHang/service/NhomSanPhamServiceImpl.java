package QL_BanHang.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import QL_BanHang.dao.NhanVienDao;
import QL_BanHang.dao.NhomSanPhamDao;
import QL_BanHang.model.NhanVien;
import QL_BanHang.model.NhomSanPham;
import QL_BanHang.dao.NhomSanPhamDaoImpl;

/**
 * @author Dinesh Rajput
 *
 */

@Service("NhomSanPhamService")
@Transactional(propagation = Propagation.SUPPORTS, readOnly = true)
public class NhomSanPhamServiceImpl implements NhomSanPhamService {

	@Autowired
	private NhomSanPhamDao nhomsanphamDao;

	@Transactional(propagation = Propagation.REQUIRED, readOnly = false)
	public void addNhomSanPham(NhomSanPham nhomsanpham) {
		nhomsanphamDao.addNhomSanPham(nhomsanpham);
	}

	public List<NhomSanPham> listNhomSanPham() {
		return nhomsanphamDao.listNhomSanPham();
	}
	public List<Integer> getMaNSP() {
		return nhomsanphamDao.getMaNSP();
	}
	public NhomSanPham getNhomSanPham(int Id) {
		return nhomsanphamDao.getNhomSanPham(Id);
	}

	public NhomSanPham getNhomSanPhamtheoten(String TenNhomSP) {
		return nhomsanphamDao.getNhomSanPhamtheoten(TenNhomSP);
	}

	public void deleteNhomSanPham(NhomSanPham nhomsanpham) {
		nhomsanphamDao.deleteNhomSanPham(nhomsanpham);
	}

	public void deleteNhomSanPham1(int Id) {
		nhomsanphamDao.deleteNhomSanPham1(Id);

	}
}
