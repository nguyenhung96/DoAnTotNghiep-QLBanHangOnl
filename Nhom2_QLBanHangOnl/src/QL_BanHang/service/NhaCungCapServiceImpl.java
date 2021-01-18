package QL_BanHang.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import QL_BanHang.dao.NhaCungCapDao;
import QL_BanHang.model.NhaCungCap;

@Service("nhacungcapService")
@Transactional(propagation = Propagation.SUPPORTS, readOnly = true)
public class NhaCungCapServiceImpl implements NhaCungCapService {

	@Autowired
	private NhaCungCapDao nhacungcapDao;

	@Transactional(propagation = Propagation.REQUIRED, readOnly = false)
	public void addNhaCungCap(NhaCungCap nhacungcap) {
		nhacungcapDao.addNhaCungCap(nhacungcap);
	}

	public List<NhaCungCap> listNhaCungCap() {
		return nhacungcapDao.listNhaCungCap();
	}
	public List<String> getMaNCC() {
		return nhacungcapDao.getMaNCC();
	}
	public List<String> getMaNCCFromNCC(){
		return nhacungcapDao.getMaNCCFromNCC();
	}
	public List<String> getMaNCCFromNhomSP() {
		return nhacungcapDao.getMaNCCFromNhomSP();
	}
	public NhaCungCap getNhaCungCap(String manhacc) {
		return nhacungcapDao.getNhaCungCap(manhacc);
	}

	public void deleteNhaCungCap(NhaCungCap nhacungcap) {
		nhacungcapDao.deleteNhaCungCap(nhacungcap);
	}
}
