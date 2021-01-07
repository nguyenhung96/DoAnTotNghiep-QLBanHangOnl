package QL_BanHang.model;

import java.text.DecimalFormat;

public class Cart {
	private SanPham sanpham;
	private int Total;
	private int Soluong;
	private int GiaSP;
	private String GiaSPFormat;
	private String ThanhTienFormat;

	public SanPham getSanpham() {
		return sanpham;
	}

	public void setSanpham(SanPham sanpham) {
		this.sanpham = sanpham;
	}

	public int getTotal() {
		return Total;
	}

	public void setTotal(int total) {
		Total = total;
	}

	public int getSoluong() {
		return Soluong;
	}

	public void setSoluong(int soluong) {
		Soluong = soluong;
	}

	public int getGiaSP() {
		return GiaSP;
	}

	public void setGiaSP(int giaSP) {
		GiaSP = giaSP;
	}

	public String getGiaSPFormat() {
		return GiaSPFormat;
	}

	public void setGiaSPFormat(float giaSP) {
		DecimalFormat formatter = new DecimalFormat("###,###,###");
		this.GiaSPFormat = formatter.format(giaSP);
	}

	public String getThanhTienFormat() {
		return ThanhTienFormat;
	}

	public void setThanhTienFormat(float giaSP, int soLuong) {
		DecimalFormat formatter = new DecimalFormat("###,###,###");
		ThanhTienFormat = formatter.format(giaSP * soLuong);
	}

}
