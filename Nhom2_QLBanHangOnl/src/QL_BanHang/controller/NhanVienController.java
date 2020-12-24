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

import QL_BanHang.bean.NhanVienBean;
import QL_BanHang.bean.QuyenNVBean;
import QL_BanHang.model.NhanVien;
import QL_BanHang.model.QuyenNV;
import QL_BanHang.service.NhanVienService;

@Controller
public class NhanVienController {
	@Autowired
	private NhanVienService nhanvienService;

	@RequestMapping(value = "admin/savenhanvien", method = RequestMethod.POST)
	public ModelAndView saveNhanVien(@ModelAttribute("command") NhanVienBean nhanvienBean, BindingResult result) {
		NhanVien nhanvien = prepareModel(nhanvienBean);
		nhanvienService.addNhanVien(nhanvien);
		return new ModelAndView("redirect:/admin/nhansu.do");
	}

	@RequestMapping(value = "admin/nhansu", method = RequestMethod.GET)
	public ModelAndView listNhanVien() {
		Map<String, Object> model = new HashMap<String, Object>();
		model.put("nhanvienList", prepareListofBean(nhanvienService.listNhanVien()));
		model.put("quyennvList", prepareListofBeanQuyenNV(nhanvienService.listQuyenNhanVien()));
		return new ModelAndView("home/Staff", model);
	}

	@RequestMapping(value = "admin/createstaff", method = RequestMethod.GET)
	public ModelAndView addNhanVien(@ModelAttribute("command") NhanVienBean nhanvienBean, BindingResult result) {
		Map<String, Object> model = new HashMap<String, Object>();
		model.put("nhanvienList", prepareListofBean(nhanvienService.listNhanVien()));
		return new ModelAndView("home/CreateStaff", model);
	}

	@RequestMapping(value = "admin/deletenhanvien", method = RequestMethod.GET)
	public ModelAndView editNhanVien(@ModelAttribute("command") NhanVienBean nhanvienBean, BindingResult result) {
		nhanvienService.deleteNhanVien(prepareModel1(nhanvienBean));
		Map<String, Object> model = new HashMap<String, Object>();
		model.put("nhanvien", null);
		model.put("nhanvienList", prepareListofBean(nhanvienService.listNhanVien()));
		return new ModelAndView("redirect:/admin/nhansu.do");
	}

	@RequestMapping(value = "admin/editnhanvien", method = RequestMethod.GET)
	public ModelAndView deleteNhanVien(@ModelAttribute("command") NhanVienBean nhanvienBean, QuyenNVBean quyennvBean,
			BindingResult result) {
		Map<String, Object> model = new HashMap<String, Object>();
		model.put("nhanvien", prepareNhanVienBean(nhanvienService.getNhanVien(nhanvienBean.getMaNhanVien())));
		model.put("nhanvienList", prepareListofBean(nhanvienService.listNhanVien()));
		return new ModelAndView("home/CreateStaff", model);
	}

	@RequestMapping(value = "admin/editquyennv", method = RequestMethod.GET)
	public ModelAndView editquyenNhanVien(@ModelAttribute("command") NhanVienBean nhanvienBean, QuyenNVBean quyennvBean,
			BindingResult result) {
		Map<String, Object> model = new HashMap<String, Object>();
		model.put("nhanvien", prepareNhanVienBean(nhanvienService.getNhanVien(nhanvienBean.getMaNhanVien())));
		model.put("listuyennv", prepareListofBeanQuyenNV(nhanvienService.listQuyenNhanVien()));
		return new ModelAndView("home/SetRole", model);
	}

	@RequestMapping(value = "admin/luuquyennv", method = RequestMethod.POST)
	public ModelAndView savequyenNhanVien(@ModelAttribute("command") NhanVienBean nhanvienBean, QuyenNVBean quyennvBean,
			BindingResult result) {
		Map<String, Object> model = new HashMap<String, Object>();
		model.put("nhanvien", prepareNhanVienBean(nhanvienService.getNhanVien(nhanvienBean.getMaNhanVien())));
		model.put("listuyennv", prepareListofBeanQuyenNV(nhanvienService.listQuyenNhanVien()));
		QuyenNV quyenNV = prepareModelquyennv(nhanvienBean);
		nhanvienService.taoquyenchonhanvien(quyenNV);
		return new ModelAndView("home/SetRole", model);
	}

	private NhanVien prepareModel(NhanVienBean nhanvienBean) {
		NhanVien nhanvien = new NhanVien();
		String manv = null;
		if (nhanvienBean.getMaNhanVien().isEmpty()) {
			manv = nhanvienService.genratemaNV();
		} else {
			manv = nhanvienBean.getMaNhanVien();
		}
		nhanvien.setMaNhanVien(manv);
		nhanvien.setHoTenNV(nhanvienBean.getHoTenNV());
		nhanvien.setMatKhau(nhanvienBean.getMatKhau());
		nhanvien.setEmail(nhanvienBean.getEmail());
		nhanvien.setDiaChi(nhanvienBean.getDiaChi());
		nhanvien.setCMND(nhanvienBean.getCMND());
		nhanvien.setGioiTinh(nhanvienBean.isGioiTinh());
		nhanvien.setHinh(nhanvienBean.getHinh());
		nhanvien.setEnable(nhanvienBean.getEnable());
		nhanvien.setSDT(nhanvienBean.getSDT());
		nhanvienBean.setMaNhanVien(null);
		return nhanvien;
	}

	// chuyen dl tu bean nhanvien ve model quyennv
	private QuyenNV prepareModelquyennv(NhanVienBean nhanvienBean) {
		QuyenNV quyenNV = new QuyenNV();

		quyenNV.setNhanVien(nhanvienService.getNhanVien(nhanvienBean.getMaNhanVien()));
		quyenNV.setQuyenNV(nhanvienBean.getQuyenNV());
		nhanvienBean.setMaNhanVien(null);
		return quyenNV;
	}

	private NhanVien prepareModel1(NhanVienBean nhanvienBean) {
		NhanVien nhanvien = new NhanVien();
		nhanvien.setMaNhanVien(nhanvienBean.getMaNhanVien());
		nhanvienBean.setMaNhanVien(null);
		return nhanvien;
	}

	// Lấy list danh sách nhân viên
	private List<NhanVienBean> prepareListofBean(List<NhanVien> nhanvienList) {
		List<NhanVienBean> beans = null;
		if (nhanvienList != null && !nhanvienList.isEmpty()) {
			beans = new ArrayList<NhanVienBean>();
			NhanVienBean bean = null;
			for (NhanVien nhanvien : nhanvienList) {
				bean = new NhanVienBean();
				bean.setMaNhanVien(nhanvien.getMaNhanVien());
				bean.setHoTenNV(nhanvien.getHoTenNV());
				bean.setMatKhau(nhanvien.getMatKhau());
				bean.setEmail(nhanvien.getEmail());
				bean.setDiaChi(nhanvien.getDiaChi());
				bean.setCMND(nhanvien.getCMND());
				bean.setGioiTinh(nhanvien.isGioiTinh());
				bean.setHinh(nhanvien.getHinh());
				bean.setSDT(nhanvien.getSDT());
				bean.setEnable(nhanvien.getEnable());
				bean.setEnableString(nhanvien.getEnable());
				bean.setGioiTinhString(nhanvien.isGioiTinh());
				beans.add(bean);
			}
		}
		return beans;
	}

	// lấy list danh sách quyền nv
	private List<QuyenNVBean> prepareListofBeanQuyenNV(List<QuyenNV> quyennvList) {
		List<QuyenNVBean> beans = null;
		if (quyennvList != null && !quyennvList.isEmpty()) {
			beans = new ArrayList<QuyenNVBean>();
			QuyenNVBean bean = null;
			for (QuyenNV quyennv : quyennvList) {
				bean = new QuyenNVBean();
				bean.setId(quyennv.getId());
				bean.setMaNhanVien(quyennv.getNhanVien().getMaNhanVien());
				bean.setHoTenNV(quyennv.getNhanVien().getHoTenNV());
				bean.setQuyenNV(quyennv.getQuyenNV());

				beans.add(bean);
			}
		}
		return beans;
	}

	private NhanVienBean prepareNhanVienBean(NhanVien nhanvien) {
		NhanVienBean bean = new NhanVienBean();
		bean.setMaNhanVien(nhanvien.getMaNhanVien());
		bean.setHoTenNV(nhanvien.getHoTenNV());
		bean.setMatKhau(nhanvien.getMatKhau());
		bean.setEmail(nhanvien.getEmail());
		bean.setDiaChi(nhanvien.getDiaChi());
		bean.setCMND(nhanvien.getCMND());
		bean.setGioiTinh(nhanvien.isGioiTinh());
		bean.setHinh(nhanvien.getHinh());
		bean.setSDT(nhanvien.getSDT());
		bean.setEnable(nhanvien.getEnable());
		bean.setEnableString(nhanvien.getEnable());
		return bean;
	}
}
