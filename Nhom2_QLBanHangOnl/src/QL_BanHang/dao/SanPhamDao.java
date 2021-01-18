package QL_BanHang.dao;

import java.util.List;

import QL_BanHang.model.NhaCungCap;
import QL_BanHang.model.NhomSanPham;
import QL_BanHang.model.SanPham;

public interface SanPhamDao {

	// Hàm thêm
	public void addSanPham(SanPham sanpham);

	// Hàm lấy list sp
	public List<SanPham> listSanPham();

	// Hàm lấy sp theo mã
	public SanPham getSanPham(String masp);

	// Hàm xóa sp
	public void deleteSanPham(SanPham sanpham);

	// Hàm xóa sp theo mã
	public void deleteSanPham1(String masp);

	// Hàm thêm
	public void updateImage(SanPham sanpham, String tenhinh);

	// lấy email khách hàng
//	public List<String> getMailKH();

	public String folderlocation();

	public String autoGenrate();

	public int demSanPham();

}
