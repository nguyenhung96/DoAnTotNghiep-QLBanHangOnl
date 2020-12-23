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
	
	public String autoGenrate();
	
	public void createdonhangchitiet(DonHangChiTiet donHangChiTiet);

}
