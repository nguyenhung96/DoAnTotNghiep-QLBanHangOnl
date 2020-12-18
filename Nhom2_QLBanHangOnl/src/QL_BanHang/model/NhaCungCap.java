package QL_BanHang.model;

import java.io.Serializable;
import java.util.Collection;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name = "NhaCungCap")
public class NhaCungCap implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = -7231978662402961382L;

	@Id
	private String MaNhaCungCap;

	private String TenNhaCungCap;

	private String SDT;

	private String Email;

	private String DiaChi;



	@OneToMany(mappedBy = "nhacungcap")
	private Collection<NhomSanPham> nhomsanpham;

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


	public Collection<NhomSanPham> getNhomsanpham() {
		return nhomsanpham;
	}

	public void setNhomsanpham(Collection<NhomSanPham> nhomsanpham) {
		this.nhomsanpham = nhomsanpham;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

}
