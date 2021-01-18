package QL_BanHang.dao;

import java.util.List;

import QL_BanHang.model.NhomSanPham;

public interface NhomSanPhamDao {

	//Hàm thêm nhóm sản phẩm
	public void addNhomSanPham(NhomSanPham nhomsanpham);

	//Hàm lấy list nhóm sp
	public List<NhomSanPham> listNhomSanPham();
	public List<Integer> getMaNSP();
	//Hàm lấy nhóm sp theo mã
	public NhomSanPham getNhomSanPham(int Id);

	//Hàm lấy nhóm sp theo tên nhóm sp
	public NhomSanPham getNhomSanPhamtheoten(String TenNhomSP);

	
	public void deleteNhomSanPham(NhomSanPham nhomsanpham);
	
	//Hàm Xóa nhóm sản phẩm theo mã
	public void deleteNhomSanPham1(int Id);
}
