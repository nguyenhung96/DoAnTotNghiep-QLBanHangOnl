package QL_BanHang.controller;

import java.sql.Date;
import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import QL_BanHang.bean.ChiTietDonHangBean;
import QL_BanHang.bean.DonHangBean;
import QL_BanHang.bean.KhachHangBean;
import QL_BanHang.bean.NhanVienBean;
import QL_BanHang.model.Cart;
import QL_BanHang.model.DonHang;
import QL_BanHang.model.DonHangChiTiet;
import QL_BanHang.model.KhachHang;
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

	@RequestMapping(value = "home/huydonhang", method = RequestMethod.GET)
	public ModelAndView huyDonHang(@ModelAttribute("command") DonHangBean donhangBean, BindingResult result) {
		DonHang donhang = donhangService.getDonHang(donhangBean.getMaDonHang());
		donhangService.HuyDonHang(donhang.getMaDonHang());
		return new ModelAndView("redirect:/home/order.do");
	}

	@RequestMapping(value = "home/completedonhang", method = RequestMethod.GET)
	public ModelAndView completeDonHang(@ModelAttribute("command") DonHangBean donhangBean, BindingResult result) {
		DonHang donhang = donhangService.getDonHang(donhangBean.getMaDonHang());
		donhangService.completeDonHang(donhang.getMaDonHang());
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

	// Chức năng in hóa đơn

	// Chức năng in hóa đơn

	private DonHang prepareModel(DonHangBean donhangBean) {
		DonHang donhang = new DonHang();
		donhang.setMaDonHang(donhangBean.getMaDonHang());
		donhang.setNhanvien(nhanvienService.getNhanVien(donhangBean.getMaNhanVienDuyetDon()));
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
				} catch (Exception e) {
					bean.setMaNhanVien("chưa được duyệt");
				}

				bean.setMaKH(donhang.getKhachhang().getMaKH());
				bean.setNgayDat(donhang.getNgayDat());
				DecimalFormat formatter = new DecimalFormat("###,###,###");
				bean.setTongTienString(formatter.format(donhang.getTongTien()));
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
		} catch (Exception e) {
			bean.setMaNhanVien("");
		}
		bean.setMaKH(donhang.getKhachhang().getMaKH());
		bean.setNgayDat(donhang.getNgayDat());
		bean.setTongTien(donhang.getTongTien());
		bean.setTrangThai(donhang.getTrangThai());
		bean.setTrangThaiString(donhang.getTrangThai());
		bean.setDiaChi(donhang.getKhachhang().getDiaChi());
		DecimalFormat formatter = new DecimalFormat("###,###,###");
		bean.setTongTienString(formatter.format(donhang.getTongTien()));
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
				DecimalFormat formatter = new DecimalFormat("###,###,###");
				bean.setDonGia(formatter.format(donhang.getSanpham().getGiaSP()).toString());
				bean.setTongTien(formatter.format(donhang.getSanpham().getGiaSP() * donhang.getSoLuong()));
				beans.add(bean);
			}
		}
		return beans;
	}

	@RequestMapping(value = "home/print", method = RequestMethod.GET)
	public ModelAndView print(@ModelAttribute("command") DonHangBean donhangBean, BindingResult result) {
		Map<String, Object> model = new HashMap<String, Object>();
		DonHang donhang = donhangService.getDonHang(donhangBean.getMaDonHang());
		model.put("DonHang", donhang);
		model.put("listDonhangchitiet", donhangService.listDonHangChiTiet(donhangBean.getMaDonHang()));
		return new ModelAndView("pdfView", model);
	}
}
