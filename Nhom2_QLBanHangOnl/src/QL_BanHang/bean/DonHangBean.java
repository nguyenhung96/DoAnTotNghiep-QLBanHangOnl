package QL_BanHang.bean;

import java.sql.Date;
import java.text.DecimalFormat;
import java.text.NumberFormat;
import java.util.Collection;
import java.util.Locale;

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

	private String TrangThaiString;
	
	private String TongTienString;
	
	private String MaNhanVienDuyetDon;
	

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

	public String getTrangThaiString() {
		return TrangThaiString;
	}

	public void setTrangThaiString(int trangThai) {
		String trangthai = null;
		if (trangThai == 1) {
			trangthai = "Chưa duyệt";
		} else if (trangThai == 2) {
			trangthai = "Đang giao";
		} else if (trangThai == 4) {
			trangthai = "Đơn bị hủy";
		} else if (trangThai == 3) {
			trangthai = "Hoàn thành";
		}
		
		TrangThaiString = trangthai;
	}

	public String getTongTienString() {
		return TongTienString;
	}

	public void setTongTienString(String tongTienString) {
		TongTienString = tongTienString;
	}

	public String getMaNhanVienDuyetDon() {
		return MaNhanVienDuyetDon;
	}

	public void setMaNhanVienDuyetDon(String maNhanVienDuyetDon) {
		MaNhanVienDuyetDon = maNhanVienDuyetDon;
	}

}
