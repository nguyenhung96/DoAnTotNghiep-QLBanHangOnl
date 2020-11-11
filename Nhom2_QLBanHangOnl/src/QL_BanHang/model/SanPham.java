package QL_BanHang.model;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "SanPham")
public class SanPham implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = -533061940716535277L;
	@Id
	@Column(name = "MaSP")
	private String MaSP;
	@Column(name = "TenSP")
	private String TenSP;
	@Column(name = "ThongTinSP")
	private String ThongTinSP;
	@Column(name = "Hinh")
	private String Hinh;
	@Column(name = "GiaSP")
	private float GiaSP;
	@Column(name = "TenNhomSP")
	private String TenNhomSP;
	@Column(name = "MaNhaCungCap")
	private String MaNhaCungCap;
	@Column(name = "SoLuongSP")
	private int SoLuongSP;

	public String getMaSP() {
		return MaSP;
	}

	public void setMaSP(String maSP) {
		MaSP = maSP;
	}

	public String getTenSP() {
		return TenSP;
	}

	public void setTenSP(String tenSP) {
		TenSP = tenSP;
	}

	public String getThongTinSP() {
		return ThongTinSP;
	}

	public void setThongTinSP(String thongTinSP) {
		ThongTinSP = thongTinSP;
	}

	public String getHinh() {
		return Hinh;
	}

	public void setHinh(String hinh) {
		Hinh = hinh;
	}

	public float getGiaSP() {
		return GiaSP;
	}

	public void setGiaSP(float giaSP) {
		GiaSP = giaSP;
	}

	public String getTenNhomSP() {
		return TenNhomSP;
	}

	public void setTenNhomSP(String tenNhomSP) {
		TenNhomSP = tenNhomSP;
	}

	public String getMaNhaCungCap() {
		return MaNhaCungCap;
	}

	public void setMaNhaCungCap(String maNhaCungCap) {
		MaNhaCungCap = maNhaCungCap;
	}

	public int getSoLuongSP() {
		return SoLuongSP;
	}

	public void setSoLuongSP(int soLuongSP) {
		SoLuongSP = soLuongSP;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

}
