package QL_BanHang.dao;

import java.util.List;

import QL_BanHang.model.KhachHang;

public interface KhachHangDao {

	public void addKhachHang(KhachHang khachhang);

	public List<KhachHang> listKhachHang();

	public List<String> getMailKH();

	public KhachHang getKhachHang(String makh);

	public void deleteKhachHang(KhachHang khachhang);

	/*
	 * // lấy email public KhachHang selectKhachHang(String email);
	 */

	public KhachHang selectKhachHang(String email);

	public String genratemaKH();

	public int demKhachHang();
}
