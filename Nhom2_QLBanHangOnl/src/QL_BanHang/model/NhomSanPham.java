package QL_BanHang.model;

import java.io.Serializable;
import java.util.Collection;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name = "NhomSanPham")
public class NhomSanPham implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = -696615745144011090L;

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer Id;

	private String TenNhomSP;

	@ManyToOne
	@JoinColumn(name = "MaNhaCungCap")
	private NhaCungCap nhacungcap;

	@OneToMany(mappedBy = "nhomsanpham")
	private Collection<SanPham> sanpham;

	public Integer getId() {
		return Id;
	}

	public void setId(Integer id) {
		Id = id;
	}

	public String getTenNhomSP() {
		return TenNhomSP;
	}

	public void setTenNhomSP(String tenNhomSP) {
		TenNhomSP = tenNhomSP;
	}

	public NhaCungCap getNhacungcap() {
		return nhacungcap;
	}

	public void setNhacungcap(NhaCungCap nhacungcap) {
		this.nhacungcap = nhacungcap;
	}

	public Collection<SanPham> getSanpham() {
		return sanpham;
	}

	public void setSanpham(Collection<SanPham> sanpham) {
		this.sanpham = sanpham;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

}
