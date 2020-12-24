package QL_BanHang.bean;

import java.sql.Date;

import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

import QL_BanHang.model.KhachHang;
import QL_BanHang.model.NhanVien;

public class ChiTietDonHangBean {
	private int Id;
	private String TenSanPham;
	private int SoLuong;
	private String DonGia;
	private String TongTien;
	public int getId() {
		return Id;
	}
	public void setId(int id) {
		Id = id;
	}
	public String getTenSanPham() {
		return TenSanPham;
	}
	public void setTenSanPham(String tenSanPham) {
		TenSanPham = tenSanPham;
	}
	public int getSoLuong() {
		return SoLuong;
	}
	public void setSoLuong(int soLuong) {
		SoLuong = soLuong;
	}
	public String getDonGia() {
		return DonGia;
	}
	public void setDonGia(String donGia) {
		DonGia = donGia;
	}
	public String getTongTien() {
		return TongTien;
	}
	public void setTongTien(String tongTien) {
		TongTien = tongTien;
	}
	
	
}
