package QL_BanHang.model;

import java.io.Serializable;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name = "DonHangChiTiet")
public class DonHangChiTiet implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = -5128903055475828978L;

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer Id;

	@ManyToOne
	@JoinColumn(name = "MaDonHang")
	private DonHang donhang;

	@ManyToOne
	@JoinColumn(name = "MaSP")
	private SanPham sanpham;

	private Integer SoLuong;

	private Float DonGia;

	public Integer getId() {
		return Id;
	}

	public void setId(Integer id) {
		Id = id;
	}

	public DonHang getDonhang() {
		return donhang;
	}

	public void setDonhang(DonHang donhang) {
		this.donhang = donhang;
	}

	public SanPham getSanpham() {
		return sanpham;
	}

	public void setSanpham(SanPham sanpham) {
		this.sanpham = sanpham;
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
