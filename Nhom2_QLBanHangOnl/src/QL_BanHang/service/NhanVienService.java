package QL_BanHang.service;

import java.util.List;


import QL_BanHang.model.NhanVien;

/**
 * @author Dinesh Rajput
 *
 */
public interface NhanVienService {

	
	public void addNhanVien	(NhanVien nhanvien);

	public List<NhanVien> listNhanVien();
	
	public NhanVien getNhanVien(String manv);
	
	public void deleteNhanVien(NhanVien nhanvien);
}
