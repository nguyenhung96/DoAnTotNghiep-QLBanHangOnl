package QL_BanHang.service;

import java.util.List;

import QL_BanHang.model.SanPham;

public interface SanPhamService {

	public void addSanPham(SanPham sanpham);

	public List<SanPham> listSanPham();

	public SanPham getSanPham(String masp);

	public void deleteSanPham(SanPham sanpham);

	public void deleteSanPham1(String masp);

//	public List<String> getMailKH();

	public void updateImage(SanPham sanpham, String tenhinh);

	public String locationfolder();

	public String autoGenrate();

	public int demSanPham();
}
