package QL_BanHang.model;

import java.io.Serializable;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name = "PhieuNhapChiTiet")
public class PhieuNhapChiTiet implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = 7610062365581433787L;

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer Id;

	@ManyToOne(fetch=FetchType.LAZY)
	@JoinColumn(name = "MaPhieuNhap")
	private PhieuNhap phieunhap;

	@ManyToOne(fetch=FetchType.LAZY)
	@JoinColumn(name = "MaSP")
	private SanPham sanpham;

	@ManyToOne(fetch=FetchType.LAZY)
	@JoinColumn(name = "MaNhaCungCap")
	private NhaCungCap nhacungcap;

	private Integer SoLuong;

	private Float DonGia;

	public Integer getId() {
		return Id;
	}

	public void setId(Integer id) {
		Id = id;
	}

	public PhieuNhap getPhieunhap() {
		return phieunhap;
	}

	public void setPhieunhap(PhieuNhap phieunhap) {
		this.phieunhap = phieunhap;
	}

	public SanPham getSanpham() {
		return sanpham;
	}

	public void setSanpham(SanPham sanpham) {
		this.sanpham = sanpham;
	}

	public NhaCungCap getNhacungcap() {
		return nhacungcap;
	}

	public void setNhacungcap(NhaCungCap nhacungcap) {
		this.nhacungcap = nhacungcap;
	}

	public Integer getSoLuong() {
		return SoLuong;
	}

	public void setSoLuong(Integer soLuong) {
		SoLuong = soLuong;
	}

	public Float getDonGia() {
		return DonGia;
	}

	public void setDonGia(Float donGia) {
		DonGia = donGia;
	}
	
	

}
