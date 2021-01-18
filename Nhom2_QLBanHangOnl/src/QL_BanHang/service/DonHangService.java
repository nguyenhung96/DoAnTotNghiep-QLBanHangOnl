package QL_BanHang.service;

import java.util.List;

import QL_BanHang.model.DonHang;
import QL_BanHang.model.DonHangChiTiet;

public interface DonHangService {

	public void addDonHang(DonHang donhang);

	public List<DonHang> listDonHang();

	public DonHang getDonHang(String madh);

	public void deleteDonHang(DonHang donhang);

	public List<DonHangChiTiet> listDonHangChiTiet(String madh);

	public void DuyetDonHang(DonHang donhang);

	public void HuyDonHang(String madh);

	public String autoGenrate();

	public void createdonhangchitiet(DonHangChiTiet donHangChiTiet);

	public void completeDonHang(String madh);

	public int demsanphamdaban();

	public int demdonhangdanggiao();

	public int demdonhangchuaduyet();

	public List<DonHang> listDonHangByMaKhachHang(String makh);

}
