package QL_BanHang.model;

import java.io.Serializable;
import java.sql.Date;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name = "PhieuNhap")
public class PhieuNhap implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = -3739557924281986556L;

	@Id
	private String MaPhieuNhap;
	
	@ManyToOne
	@JoinColumn(name = "MaNhanVien")
	private NhanVien nhanvien;

	private Date NgayNhap;

	private Float TongTien;

	private String GhiChu;

	public String getMaPhieuNhap() {
		return MaPhieuNhap;
	}

	public void setMaPhieuNhap(String maPhieuNhap) {
		MaPhieuNhap = maPhieuNhap;
	}

	public NhanVien getNhanvien() {
		return nhanvien;
	}

	public void setNhanvien(NhanVien nhanvien) {
		this.nhanvien = nhanvien;
	}

	public Date getNgayNhap() {
		return NgayNhap;
	}

	public void setNgayNhap(Date ngayNhap) {
		NgayNhap = ngayNhap;
	}

	public Float getTongTien() {
		return TongTien;
	}

	public void setTongTien(Float tongTien) {
		TongTien = tongTien;
	}

	public String getGhiChu() {
		return GhiChu;
	}

	public void setGhiChu(String ghiChu) {
		GhiChu = ghiChu;
	}

}
