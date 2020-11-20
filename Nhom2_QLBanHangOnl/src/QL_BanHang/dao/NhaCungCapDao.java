package QL_BanHang.dao;

import java.util.List;

import QL_BanHang.model.NhaCungCap;

public interface NhaCungCapDao {
	
	public void addNhaCungCap(NhaCungCap nhacungcap);

	public List<NhaCungCap> listNhaCungCap();

	public NhaCungCap getNhaCungCap(String manhacc);

	public void deleteNhaCungCap(NhaCungCap nhacungcap);
	
}
