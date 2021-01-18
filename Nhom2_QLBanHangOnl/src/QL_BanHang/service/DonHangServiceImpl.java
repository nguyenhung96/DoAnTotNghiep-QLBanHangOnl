package QL_BanHang.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import QL_BanHang.dao.DonHangDao;
import QL_BanHang.model.DonHang;
import QL_BanHang.model.DonHangChiTiet;

@Service("donhangService")
@Transactional(propagation = Propagation.SUPPORTS, readOnly = true)
public class DonHangServiceImpl implements DonHangService {

	@Autowired
	private DonHangDao donhangDao;

	@Transactional(propagation = Propagation.REQUIRED, readOnly = false)
	public void addDonHang(DonHang donhang) {
		donhangDao.addDonHang(donhang);
	}

	public List<DonHang> listDonHang() {
		return donhangDao.listDonHang();
	}

	public DonHang getDonHang(String madh) {
		return donhangDao.getDonHang(madh);
	}

	public void deleteDonHang(DonHang donhang) {
		donhangDao.deleteDonHang(donhang);
	}

	public List<DonHangChiTiet> listDonHangChiTiet(String madh) {
		return donhangDao.listDonHangChiTiet(madh);
	}

	public void DuyetDonHang(DonHang donhang) {
		donhangDao.DuyetDonHang(donhang);

	}

	public String autoGenrate() {

		return donhangDao.autoGenrate();
	}

	@Override
	public void createdonhangchitiet(DonHangChiTiet donHangChiTiet) {
		donhangDao.createdonhangchitiet(donHangChiTiet);

	}

	@Override
	public void HuyDonHang(String madh) {
		donhangDao.HuyDonHang(madh);

	}

	@Override
	public void completeDonHang(String madh) {
		donhangDao.completeDonHang(madh);

	}

	@Override
	public int demsanphamdaban() {

		return donhangDao.demsanphamdaban();
	}

	@Override
	public int demdonhangdanggiao() {

		return donhangDao.demdonhangdanggiao();
	}

	@Override
	public int demdonhangchuaduyet() {

		return donhangDao.demdonhangchuaduyet();
	}

	@Override
	public List<DonHang> listDonHangByMaKhachHang(String makh) {
		return donhangDao.listDonHangByMaKhachHang(makh);
	}
}
