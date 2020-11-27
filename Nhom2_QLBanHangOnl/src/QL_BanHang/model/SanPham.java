package QL_BanHang.model;

import java.io.Serializable;
import java.util.Collection;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
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

	@ManyToOne
	@JoinColumn(name = "Id_NhomSP")
	private NhomSanPham nhomsanpham;

	@ManyToOne
	@JoinColumn(name = "MaNhaCungCap")
	private NhaCungCap nhacungcap;

	@Column(name = "SoLuongSP")
	private Integer SoLuongSP;

	@OneToMany(mappedBy = "sanpham")
	private Collection<DonHangChiTiet> donhangchitiet;

	@OneToMany(mappedBy = "sanpham")
	private Collection<PhieuNhapChiTiet> phieunhapchitiet;

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

	public NhomSanPham getNhomsanpham() {
		return nhomsanpham;
	}

	public void setNhomsanpham(NhomSanPham nhomsanpham) {
		this.nhomsanpham = nhomsanpham;
	}

	public NhaCungCap getNhacungcap() {
		return nhacungcap;
	}

	public void setNhacungcap(NhaCungCap nhacungcap) {
		this.nhacungcap = nhacungcap;
	}

	public Integer getSoLuongSP() {
		return SoLuongSP;
	}

	public void setSoLuongSP(Integer soLuongSP) {
		SoLuongSP = soLuongSP;
	}

	public Collection<DonHangChiTiet> getDonhangchitiet() {
		return donhangchitiet;
	}

	public void setDonhangchitiet(Collection<DonHangChiTiet> donhangchitiet) {
		this.donhangchitiet = donhangchitiet;
	}

	public Collection<PhieuNhapChiTiet> getPhieunhapchitiet() {
		return phieunhapchitiet;
	}

	public void setPhieunhapchitiet(Collection<PhieuNhapChiTiet> phieunhapchitiet) {
		this.phieunhapchitiet = phieunhapchitiet;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

}
