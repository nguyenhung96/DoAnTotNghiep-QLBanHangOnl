package QL_BanHang.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import QL_BanHang.bean.ChiTietDonHangBean;
import QL_BanHang.bean.DonHangBean;
import QL_BanHang.bean.NhanVienBean;
import QL_BanHang.model.DonHang;
import QL_BanHang.model.DonHangChiTiet;
import QL_BanHang.model.NhanVien;
import QL_BanHang.service.DonHangService;
import QL_BanHang.service.KhachHangService;
import QL_BanHang.service.NhanVienService;

@Controller
public class DonHangController {
	@Autowired
	private DonHangService donhangService;
	@Autowired
	private NhanVienService nhanvienService;
	@Autowired
	private KhachHangService khachhangService;

	@RequestMapping(value = "home/duyetdonhang", method = RequestMethod.POST)
	public ModelAndView saveDonHang(@ModelAttribute("command") DonHangBean donhangBean, BindingResult result) {
		DonHang donhang = prepareModel(donhangBean);
		donhangService.DuyetDonHang(donhang);
		return new ModelAndView("redirect:/home/order.do");
	}

	@RequestMapping(value = "home/order", method = RequestMethod.GET)
	public ModelAndView listDonHang() {
		Map<String, Object> model = new HashMap<String, Object>();
		model.put("donhangList", prepareListofBean(donhangService.listDonHang()));
		return new ModelAndView("home/OrderList", model);
	}
	@RequestMapping(value = "home/detailorder", method = RequestMethod.GET)
	public ModelAndView editDonHang(@ModelAttribute("command") DonHangBean donhangBean, BindingResult result) {
		Map<String, Object> model = new HashMap<String, Object>();
		model.put("donhang", prepareDonHangBean(donhangService.getDonHang(donhangBean.getMaDonHang())));
		model.put("donhangList", prepareListofBean1(donhangService.listDonHangChiTiet(donhangBean.getMaDonHang())));
		model.put("nhanvienList", nhanvienService.listNhanVien());
		return new ModelAndView("home/DetailOrder", model);
	}

	private DonHang prepareModel(DonHangBean donhangBean) {
		DonHang donhang = new DonHang();
		donhang.setMaDonHang(donhangBean.getMaDonHang());
		donhang.setNhanvien(nhanvienService.getNhanVien(donhangBean.getMaNhanVien()));
		donhang.setNgayDat(donhangBean.getNgayDat());
		donhang.setTongTien(donhangBean.getTongTien());
		donhang.setTrangThai(donhangBean.getTrangThai());
		donhangBean.setMaDonHang(null);
		return donhang;
	}

	private List<DonHangBean> prepareListofBean(List<DonHang> donhangList) {
		List<DonHangBean> beans = null;
		if (donhangList != null && !donhangList.isEmpty()) {
			beans = new ArrayList<DonHangBean>();
			DonHangBean bean = null;
			for (DonHang donhang : donhangList) {
				bean = new DonHangBean();
				bean.setMaDonHang(donhang.getMaDonHang());
				try {
					bean.setMaNhanVien(donhang.getNhanvien().getMaNhanVien());
				}catch(Exception e) {
					bean.setMaNhanVien("chưa được duyệt");
				}
		
				bean.setMaKH(donhang.getKhachhang().getMaKH());
				bean.setNgayDat(donhang.getNgayDat());
				bean.setTongTien(donhang.getTongTien());
				bean.setTrangThai(donhang.getTrangThai());
				bean.setDiaChi(donhang.getKhachhang().getDiaChi());
				bean.setTrangThaiString(donhang.getTrangThai());
				beans.add(bean);

			}
		}
		return beans;
	}

	private DonHangBean prepareDonHangBean(DonHang donhang) {
		DonHangBean bean = new DonHangBean();
		bean.setMaDonHang(donhang.getMaDonHang());
		try {
			bean.setMaNhanVien(donhang.getNhanvien().getMaNhanVien());
		}catch(Exception e) {
			bean.setMaNhanVien("...");
		}
		bean.setMaKH(donhang.getKhachhang().getMaKH());
		bean.setNgayDat(donhang.getNgayDat());
		bean.setTongTien(donhang.getTongTien());
		bean.setTrangThai(donhang.getTrangThai());
		bean.setTrangThaiString(donhang.getTrangThai());
		bean.setDiaChi(donhang.getKhachhang().getDiaChi());
		bean.setTongTien(donhang.getTongTien());
		return bean;
	}

	private List<ChiTietDonHangBean> prepareListofBean1(List<DonHangChiTiet> list) {
		List<ChiTietDonHangBean> beans = null;
		if (list != null && !list.isEmpty()) {
			beans = new ArrayList<ChiTietDonHangBean>();
			ChiTietDonHangBean bean = null;
			for (DonHangChiTiet donhang : list) {

				bean = new ChiTietDonHangBean();
				bean.setId(donhang.getId());
				bean.setTenSanPham(donhang.getSanpham().getTenSP());
				bean.setSoLuong(donhang.getSoLuong());
				bean.setDonGia(donhang.getSanpham().getGiaSP());
				bean.setTongTien(donhang.getSanpham().getGiaSP() * donhang.getSoLuong());

				beans.add(bean);
			}
		}
		return beans;
	}
}
