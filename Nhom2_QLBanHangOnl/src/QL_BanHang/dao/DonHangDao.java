package QL_BanHang.dao;

import java.util.List;

import QL_BanHang.model.DonHang;
import QL_BanHang.model.DonHangChiTiet;

public interface DonHangDao {

	public void addDonHang(DonHang donhang);

	public List<DonHang> listDonHang();

	public DonHang getDonHang(String madh);

	public void deleteDonHang(DonHang madh);

	public List<DonHangChiTiet> listDonHangChiTiet(String madh);

	public void DuyetDonHang(DonHang donhang);

	public void HuyDonHang(String madh);

	public void completeDonHang(String madh);

	public String autoGenrate();

	public void createdonhangchitiet(DonHangChiTiet donHangChiTiet);
	
	public int demsanphamdaban();
	
	public int demdonhangdanggiao();
	
	public int demdonhangchuaduyet();
	
	public List<DonHang> listDonHangByMaKhachHang(String makh);

}
