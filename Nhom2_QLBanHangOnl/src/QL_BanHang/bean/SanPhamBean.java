package QL_BanHang.bean;

import java.text.DecimalFormat;

import org.springframework.web.multipart.MultipartFile;

public class SanPhamBean {
	private String MaSP;
	private String TenSP;
	private String ThongTinSP;
	private String Hinh;
	private float GiaSP;
	private String TenNhomSP;
	private String MaNhaCungCap;
	private int Id_NhomSP;
	private int Enable;
	private String EnableString;
	private MultipartFile multipartFile;
	private String GiaFormat;

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

	public int getId_NhomSP() {
		return Id_NhomSP;
	}

	public void setId_NhomSP(int id_NhomSP) {
		Id_NhomSP = id_NhomSP;
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
			trangthai = "Đang chạy";
		} else if (enableString == 2) {
			trangthai = "Đang tắt";
		}
		EnableString = trangthai;
	}

	public MultipartFile getMultipartFile() {
		return multipartFile;
	}

	public void setMultipartFile(MultipartFile multipartFile) {
		this.multipartFile = multipartFile;
	}

	public String getGiaFormat() {
		return GiaFormat;
	}

	public void setGiaFormat(float giaSP) {
		DecimalFormat formatter = new DecimalFormat("###,###,###");
		GiaFormat = formatter.format(giaSP);
	}

}
