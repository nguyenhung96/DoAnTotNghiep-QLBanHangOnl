package QL_BanHang.model;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "LoaiSanPham")
public class LoaiSanPham implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 4978028938396795668L;
	
	@Id
	@Column(name = "ID")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int ID;
	
	@Id
	@Column(name = "TenNhomSP")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private String TenNhomSP;
	
	@Id
	@Column(name = "MaNhaCungCap")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private String MaNhaCungCap;

	public int getID() {
		return ID;
	}

	public void setID(int iD) {
		ID = iD;
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
}
