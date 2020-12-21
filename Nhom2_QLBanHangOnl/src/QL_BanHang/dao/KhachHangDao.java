package QL_BanHang.dao;

import java.util.List;

import QL_BanHang.model.KhachHang;

public interface KhachHangDao {
	
	public void addKhachHang(KhachHang khachhang);

	public List<KhachHang> listKhachHang();
	
	public KhachHang getKhachHang(String makh);
	
	public void deleteKhachHang(KhachHang khachhang);
	
	public String genratemaKH();
}
