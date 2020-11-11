package QL_BanHang.dao;

import java.util.List;

import QL_BanHang.model.SanPham;


public interface SanPhamDao {
	public void addSanPham(SanPham sanpham);

	public List<SanPham> listSanPham();
	
	public SanPham getSanPham(String masp);
	
	public void deleteSanPham(SanPham sanpham);
}
