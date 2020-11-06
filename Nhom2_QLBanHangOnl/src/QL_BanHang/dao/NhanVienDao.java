package QL_BanHang.dao;

import java.util.List; 

import QL_BanHang.model.NhanVien;

public interface NhanVienDao {

	
	public void addNhanVien(NhanVien nhanvien);

	public List<NhanVien> listNhanVien();
	
	public NhanVien getNhanVien(String manv);
	
	public void deleteNhanVien(NhanVien nhanvien);
}
