package QL_BanHang.model;

import java.io.Serializable; 
import java.sql.Date;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
/*
 * @NamedEntityGraph(name="graph.DonHang.donhangchitiet", attributeNodes
 * = @NamedAttributeNode(value = "donhangchitiet", subgraph = "donhangchitiet"))
 */
@Table(name = "DonHang")
public class DonHang implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = 7019153685645557366L;

	@Id
	private String MaDonHang;

	private Date NgayDat;

	@ManyToOne
	@JoinColumn(name = "MaNhanVien")
	private NhanVien nhanvien;

	@ManyToOne
	@JoinColumn(name = "MaKH")
	private KhachHang khachhang;

	private int TrangThai;

	private float TongTien;

	@OneToMany(mappedBy = "donhang", cascade = CascadeType.ALL)
	private Collection<DonHangChiTiet> donhangchitiet;

	public String getMaDonHang() {
		return MaDonHang;
	}

	public void setMaDonHang(String maDonHang) {
		MaDonHang = maDonHang;
	}

	public Date getNgayDat() {
		return NgayDat;
	}

	public void setNgayDat(Date ngayDat) {
		NgayDat = ngayDat;
	}

	public NhanVien getNhanvien() {
		return nhanvien;
	}

	public void setNhanvien(NhanVien nhanvien) {
		this.nhanvien = nhanvien;
	}

	public KhachHang getKhachhang() {
		return khachhang;
	}

	public void setKhachhang(KhachHang khachhang) {
		this.khachhang = khachhang;
	}

	public int getTrangThai() {
		return TrangThai;
	}

	public void setTrangThai(int trangThai) {
		TrangThai = trangThai;
	}

	public float getTongTien() {
		return TongTien;
	}

	public void setTongTien(float tongTien) {
		TongTien = tongTien;
	}

	public Collection<DonHangChiTiet> getDonhangchitiet() {
		return donhangchitiet;
	}

	public void setDonhangchitiet(ArrayList<DonHangChiTiet> donhangchitiet) {
		this.donhangchitiet = donhangchitiet;
	}

}
