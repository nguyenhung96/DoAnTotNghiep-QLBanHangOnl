package QL_BanHang.service;

import java.util.List;

import QL_BanHang.model.KhachHang;

public interface KhachHangService {

	public void addKhachHang(KhachHang khachhang);

	public List<KhachHang> listKhachHang();

	public KhachHang getKhachHang(String makh);

//	public KhachHang selectKhachHang(String email);
	public List<String> getMailKH();

	public KhachHang selectKhachHang(String email);

	public void deleteKhachHang(KhachHang khachhang);

	public String genratemaKH();

	public int demKhachHang();

}
