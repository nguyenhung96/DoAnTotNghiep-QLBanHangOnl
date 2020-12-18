package QL_BanHang.service;

import java.util.List;

import QL_BanHang.model.NhomSanPham;

/**
 * @author Dinesh Rajput
 *
 */
public interface NhomSanPhamService {

	public void addNhomSanPham(NhomSanPham nhomsanpham);

	public List<NhomSanPham> listNhomSanPham();

	public NhomSanPham getNhomSanPham(int Id);

	public NhomSanPham getNhomSanPhamtheoten(String TenNhomSP);

	public void deleteNhomSanPham(NhomSanPham nhomsanpham);

	public void deleteNhomSanPham1(int i);
}
