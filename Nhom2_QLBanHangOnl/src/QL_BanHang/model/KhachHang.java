package QL_BanHang.model;

import java.io.Serializable;
import java.sql.Date;
import java.util.Collection;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name = "KhachHang")
public class KhachHang implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = -3221326695082255954L;
	@Id
	@Column(name = "MaKH")
	private String MaKH;

	@Column(name = "HoTenKH")
	private String HoTenKH;

	@Column(name = "MatKhau")
	private String MatKhau;

	@Column(name = "SDT")
	private String SDT;

	@Column(name = "Email")
	private String Email;

	@Column(name = "DiaChi")
	private String DiaChi;

	@OneToMany(mappedBy = "khachhang")
	private Collection<DonHang> donhang;

	public String getMaKH() {
		return MaKH;
	}

	public void setMaKH(String maKH) {
		MaKH = maKH;
	}

	public String getHoTenKH() {
		return HoTenKH;
	}

	public void setHoTenKH(String hoTenKH) {
		HoTenKH = hoTenKH;
	}

	public String getMatKhau() {
		return MatKhau;
	}

	public void setMatKhau(String matKhau) {
		MatKhau = matKhau;
	}

	public String getSDT() {
		return SDT;
	}

	public void setSDT(String sDT) {
		SDT = sDT;
	}

	public String getEmail() {
		return Email;
	}

	public void setEmail(String email) {
		Email = email;
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
