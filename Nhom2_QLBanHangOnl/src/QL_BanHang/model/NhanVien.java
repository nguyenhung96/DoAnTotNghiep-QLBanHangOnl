package QL_BanHang.model;

import java.io.Serializable;
import java.util.Collection;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;

@Entity
@Table(name = "NhanVien")
public class NhanVien implements Serializable {
	/**
		 * 
		 */
	private static final long serialVersionUID = 530795520327444207L;
	@Id
	@Column(name = "MaNhanVien")

	private String MaNhanVien;

	@Column(name = "HoTenNV")
	private String HoTenNV;
	@NotNull
	@Column(name = "MatKhau")
	private String MatKhau;

	@Column(name = "Email")
	private String Email;

	@Column(name = "SDT")
	private String SDT;

	@Column(name = "CMND")
	private int CMND;

	@Column(name = "GioiTinh")
	private boolean GioiTinh;

	@Column(name = "Enable")
	private int Enable;

	@Column(name = "Hinh")
	private String Hinh;

	@Column(name = "DiaChi")
	private String DiaChi;

	@OneToMany(mappedBy = "nhanvien", fetch = FetchType.LAZY)
	private Collection<DonHang> donhang;

	public String getMaNhanVien() {
		return MaNhanVien;
	}

	public void setMaNhanVien(String maNhanVien) {
		MaNhanVien = maNhanVien;
	}

	public String getHoTenNV() {
		return HoTenNV;
	}

	public void setHoTenNV(String hoTenNV) {
		HoTenNV = hoTenNV;
	}

	public String getMatKhau() {
		return MatKhau;
	}

	public void setMatKhau(String matKhau) {
		MatKhau = matKhau;
	}

	public String getEmail() {
		return Email;
	}

	public void setEmail(String email) {
		Email = email;
	}

	public String getSDT() {
		return SDT;
	}

	public void setSDT(String sDT) {
		SDT = sDT;
	}

	public int getCMND() {
		return CMND;
	}

	public void setCMND(int cMND) {
		CMND = cMND;
	}

	public boolean isGioiTinh() {
		return GioiTinh;
	}

	public void setGioiTinh(boolean gioiTinh) {
		GioiTinh = gioiTinh;
	}

	public int getEnable() {
		return Enable;
	}

	public void setEnable(int enable) {
		Enable = enable;
	}

	public String getHinh() {
		return Hinh;
	}

	public void setHinh(String hinh) {
		Hinh = hinh;
	}

	public String getDiaChi() {
		return DiaChi;
	}

	public void setDiaChi(String diaChi) {
		DiaChi = diaChi;
	}

	public Collection<DonHang> getDonhang() {
		return donhang;
	}

	public void setDonhang(Collection<DonHang> donhang) {
		this.donhang = donhang;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

}
