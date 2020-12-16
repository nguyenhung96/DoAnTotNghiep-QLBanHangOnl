package QL_BanHang.bean;

import java.sql.Date;
import java.util.Collection;

import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

import QL_BanHang.model.DonHangChiTiet;
import QL_BanHang.model.KhachHang;
import QL_BanHang.model.NhanVien;

public class DonHangBean {

	private String MaDonHang;

	private Date NgayDat;

	private String MaNhanVien;

	private String MaKH;

	private int TrangThai;

	private float TongTien;

	private String DiaChi;

	private String GhiChu;

	public String getMaDonHang() {
		return MaDonHang;
	}

	public void setMaDonHang(String maDonHang) {
		MaDonHang = maDonHang;
	}

	public Date getNgayDat() {
		return NgayDat;
	}

	public void setNgayDat(Date ngayDat) {
		NgayDat = ngayDat;
	}

	public String getMaNhanVien() {
		return MaNhanVien;
	}

	public void setMaNhanVien(String maNhanVien) {
		MaNhanVien = maNhanVien;
	}

	public String getMaKH() {
		return MaKH;
	}

	public void setMaKH(String maKH) {
		MaKH = maKH;
	}

	public int getTrangThai() {
		return TrangThai;
	}

	public void setTrangThai(int trangThai) {
		TrangThai = trangThai;
	}

	public float getTongTien() {
		return TongTien;
	}

	public void setTongTien(float tongTien) {
		TongTien = tongTien;
	}

	public String getDiaChi() {
		return DiaChi;
	}

	public void setDiaChi(String diaChi) {
		DiaChi = diaChi;
	}

	public String getGhiChu() {
		return GhiChu;
	}

	public void setGhiChu(String ghiChu) {
		GhiChu = ghiChu;
	}
	
	
}