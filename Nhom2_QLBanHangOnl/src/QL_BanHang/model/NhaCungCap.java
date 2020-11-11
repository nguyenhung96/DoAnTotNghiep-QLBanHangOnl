package QL_BanHang.model;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "NhaCungCap")

public class NhaCungCap  implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = -139267623633725318L;
	@Id
	@Column(name="MaNhaCungCap")
	private String MaNhaCungCap;
	@Column(name="TenNhaCungCap")
	private String TenNhaCungCap;
	@Column(name="SDT")
	private String SDT;
	@Column(name="Email")
	private String Email;
	@Column(name="DiaChi")
	private String DiaChi;
	public String getMaNhaCungCap() {
		return MaNhaCungCap;
	}
	public void setMaNhaCungCap(String maNhaCungCap) {
		MaNhaCungCap = maNhaCungCap;
	}
	public String getTenNhaCungCap() {
		return TenNhaCungCap;
	}
	public void setTenNhaCungCap(String tenNhaCungCap) {
		TenNhaCungCap = tenNhaCungCap;
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
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	
}
