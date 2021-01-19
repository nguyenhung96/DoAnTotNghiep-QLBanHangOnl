package QL_BanHang.service;

import java.util.List;

import QL_BanHang.model.NhanVien;
import QL_BanHang.model.QuyenNV;

/**
 * @author Dinesh Rajput
 *
 */
public interface NhanVienService {

	public void addNhanVien(NhanVien nhanvien);

	public List<NhanVien> listNhanVien();

	public NhanVien getNhanVien(String manv);

	public void deleteNhanVien(NhanVien nhanvien);

	public String genratemaNV();

	public QuyenNV getquyennv(String manv);

	public List<QuyenNV> listQuyenNhanVien();

	public void taoquyenchonhanvien(QuyenNV quyenNV);

	List<QuyenNV> listquyennvtheoma(String manv);

	public void setpasworld(NhanVien nhanvien, String matkhau);

	public void deleteRole(String manv);
}
