package QL_BanHang.bean;

public class NhanVienBean {

	private String MaNhanVien;
	private String HoTenNV;
	private String MatKhau;
	private String Email;
	private String SDT;
	private int CMND;
	private boolean GioiTinh;
	private String Hinh;
	private String DiaChi;
	private int Enable;
	private String EnableString;
	private String GioiTinhString;
	private String QuyenNV;

	private String MatKhauNhap;
	private String MatKhauNhap2;
	private int Code;
	private int CodeNhap;

	public String getMaNhanVien() {
		return MaNhanVien;
	}

	public void setMaNhanVien(String maNhanVien) {
		MaNhanVien = maNhanVien;
	}

	public String getHoTenNV() {
		return HoTenNV;
	}

	public void setHoTenNV(String hoTenNV) {
		HoTenNV = hoTenNV;
	}

	public String getMatKhau() {
		return MatKhau;
	}

	public void setMatKhau(String matKhau) {
		MatKhau = matKhau;
	}

	public String getEmail() {
		return Email;
	}

	public void setEmail(String email) {
		Email = email;
	}

	public String getSDT() {
		return SDT;
	}

	public void setSDT(String sDT) {
		SDT = sDT;
	}

	public int getCMND() {
		return CMND;
	}

	public void setCMND(int cMND) {
		CMND = cMND;
	}

	public boolean isGioiTinh() {
		return GioiTinh;
	}

	public void setGioiTinh(boolean gioiTinh) {
		GioiTinh = gioiTinh;
	}

	public String getHinh() {
		return Hinh;
	}

	public void setHinh(String hinh) {
		Hinh = hinh;
	}

	public String getDiaChi() {
		return DiaChi;
	}

	public void setDiaChi(String diaChi) {
		DiaChi = diaChi;
	}

	public int getEnable() {
		return Enable;
	}

	public void setEnable(int enable) {
		Enable = enable;
	}

	public String getEnableString() {
		return EnableString;
	}

	public void setEnableString(int enableString) {
		String trangthai = null;
		if (enableString == 1) {
			trangthai = "Đang bật";
		} else if (enableString == 2) {
			trangthai = "Đang tắt";
		}
		EnableString = trangthai;
	}

	public String getGioiTinhString() {
		return GioiTinhString;
	}

	public void setGioiTinhString(Boolean gioiTinhboolean) {
		String gioitinh = null;
		if (gioiTinhboolean == true) {
			gioitinh = "Nam";
		} else if (gioiTinhboolean == false) {
			gioitinh = "Nữ";
		}
		GioiTinhString = gioitinh;
	}

	public String getQuyenNV() {
		return QuyenNV;
	}

	public void setQuyenNV(String quyenNV) {
		QuyenNV = quyenNV;
	}

	public int getCodeNhap() {
		return CodeNhap;
	}

	public void setCodeNhap(int codeNhap) {
		CodeNhap = codeNhap;
	}

	public int getCode() {
		return Code;
	}

	public void setCode(int code) {
		Code = code;
	}

	public String getMatKhauNhap() {
		return MatKhauNhap;
	}

	public void setMatKhauNhap(String matKhauNhap) {
		MatKhauNhap = matKhauNhap;
	}

	public String getMatKhauNhap2() {
		return MatKhauNhap2;
	}

	public void setMatKhauNhap2(String matKhauNhap2) {
		MatKhauNhap2 = matKhauNhap2;
	}

}
