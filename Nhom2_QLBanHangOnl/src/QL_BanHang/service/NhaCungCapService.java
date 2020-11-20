package QL_BanHang.service;

import java.util.List;

import QL_BanHang.model.NhaCungCap;

public interface NhaCungCapService {

	public void addNhaCungCap	(NhaCungCap nhacungcap);

	public List<NhaCungCap> listNhaCungCap();
	
	public NhaCungCap getNhaCungCap(String manhacc);
	
	public void deleteNhaCungCap(NhaCungCap nhacungcap);
	
}
