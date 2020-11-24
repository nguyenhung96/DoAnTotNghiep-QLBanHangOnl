package QL_BanHang.controller;

import java.util.ArrayList;
import java.util.Collection;
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
import QL_BanHang.bean.DonHangBean;
import QL_BanHang.model.DonHang;
import QL_BanHang.model.DonHangChiTiet;
import QL_BanHang.service.DonHangService;

@Controller
public class DonHangController {
	@Autowired
	private DonHangService donhangService;

	/*
	 * @RequestMapping(value = "home/saveorder", method = RequestMethod.POST) public
	 * ModelAndView saveDonHang(@ModelAttribute("command") DonHangBean donhangBean,
	 * BindingResult result) { DonHang donhang = prepareModel(donhangBean);
	 * donhangService.addDonHang(donhang); return new
	 * ModelAndView("redirect:/home/order.do"); }
	 */

	@RequestMapping(value = "home/order", method = RequestMethod.GET)
	public ModelAndView listDonHang() {
		Map<String, Object> model = new HashMap<String, Object>();
		model.put("donhangList", prepareListofBean(donhangService.listDonHang()));
		return new ModelAndView("home/OrderList", model);
	}

	/*
	 * @RequestMapping(value = "home/createorder", method = RequestMethod.GET)
	 * public ModelAndView addDonHang(@ModelAttribute("command") DonHangBean
	 * donhangBean, BindingResult result) { Map<String, Object> model = new
	 * HashMap<String, Object>(); model.put("donhangList",
	 * prepareListofBean(donhangService.listDonHang())); return new
	 * ModelAndView("home/CreateOrder", model); }
	 */

	/*
	 * @RequestMapping(value = "home/deleteorder", method = RequestMethod.GET)
	 * public ModelAndView editDonHang(@ModelAttribute("command") DonHangBean
	 * donhangBean, BindingResult result) {
	 * donhangService.deleteDonHang(prepareModel(donhangBean)); Map<String, Object>
	 * model = new HashMap<String, Object>(); model.put("donhang", null);
	 * model.put("donhangList", prepareListofBean(donhangService.listDonHang()));
	 * return new ModelAndView("redirect:/home/order.do"); }
	 */
	@RequestMapping(value = "home/detailorder", method = RequestMethod.GET)
	public ModelAndView editDonHang(@ModelAttribute("command") DonHangBean donhangBean, BindingResult result) {
		Map<String, Object> model = new HashMap<String, Object>();
		model.put("donhang", prepareDonHangBean(donhangService.getDonHang(donhangBean.getMaDonHang())));
		model.put("donhangList", prepareListofBean1(donhangService.listDonHangChiTiet(donhangBean.getMaDonHang())));
		return new ModelAndView("home/DetailOrder", model);
	}

	private List<DonHangBean> prepareListofBean(List<DonHang> donhangList) {
		List<DonHangBean> beans = null;
		if (donhangList != null && !donhangList.isEmpty()) {
			beans = new ArrayList<DonHangBean>();
			DonHangBean bean = null;
			for (DonHang donhang : donhangList) {
				bean = new DonHangBean();
				bean.setMaDonHang(donhang.getMaDonHang());
				bean.setMaNhanVien(donhang.getNhanvien().getMaNhanVien());
				bean.setMaKH(donhang.getKhachhang().getMaKH());
				bean.setNgayDat(donhang.getNgayDat());
				bean.setTongTien(donhang.getTongTien());
				bean.setTrangThai(donhang.getTrangThai());
				bean.setDiaChi(donhang.getKhachhang().getDiaChi());
				beans.add(bean);
			}
		}
		return beans;
	}

	private DonHangBean prepareDonHangBean(DonHang donhang) {
		DonHangBean bean = new DonHangBean();
		bean.setMaDonHang(donhang.getMaDonHang());
		bean.setMaNhanVien(donhang.getNhanvien().getMaNhanVien());
		bean.setMaKH(donhang.getKhachhang().getMaKH());
		bean.setNgayDat(donhang.getNgayDat());
		bean.setTongTien(donhang.getTongTien());
		bean.setTrangThai(donhang.getTrangThai());
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
