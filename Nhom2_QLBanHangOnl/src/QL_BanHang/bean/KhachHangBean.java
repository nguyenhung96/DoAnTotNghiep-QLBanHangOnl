package QL_BanHang.bean;

import java.sql.Date;

public class KhachHangBean {
	private String MaKH;
	private String HoTenKH;
	private String MatKhau;
	private String SDT;
	private String Email;
	private String DiaChi;

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

}
