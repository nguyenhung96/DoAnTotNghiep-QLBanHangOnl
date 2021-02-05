package QL_BanHang.controller;

import java.security.Principal;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.sun.mail.util.BEncoderStream;

import QL_BanHang.bean.NhanVienBean;
import QL_BanHang.bean.QuyenNVBean;
import QL_BanHang.model.NhanVien;
import QL_BanHang.model.QuyenNV;
import QL_BanHang.service.NhanVienService;

@Controller
public class NhanVienController {
	@Autowired
	private NhanVienService nhanvienService;

	// Lưu và update nhân viên
	@RequestMapping(value = "admin/savenhanvien", method = RequestMethod.POST)
	public ModelAndView saveNhanVien(@ModelAttribute("command") NhanVienBean nhanvienBean, BindingResult result) {
		NhanVien nhanvien = prepareModel(nhanvienBean);
		System.out.println(nhanvienBean.getMaNhanVien());
		nhanvienService.addNhanVien(nhanvien);
		return new ModelAndView("redirect:/admin/nhansu.do");
	}

	// TRang nhân sự
	@RequestMapping(value = "admin/nhansu", method = RequestMethod.GET)
	public ModelAndView listNhanVien() {
		Map<String, Object> model = new HashMap<String, Object>();
		model.put("nhanvienList", prepareListofBean(nhanvienService.listNhanVien()));
		model.put("quyennvList", prepareListofBeanQuyenNV(nhanvienService.listQuyenNhanVien()));
		return new ModelAndView("home/Staff", model);
	}

	// Thêm nhân viên mới
	@RequestMapping(value = "admin/createstaff", method = RequestMethod.GET)
	public ModelAndView addNhanVien(@ModelAttribute("command") NhanVienBean nhanvienBean, BindingResult result) {
		Map<String, Object> model = new HashMap<String, Object>();
		model.put("nhanvienList", prepareListofBean(nhanvienService.listNhanVien()));
		return new ModelAndView("home/CreateStaff", model);
	}

	// Xóa nhân viên
	@RequestMapping(value = "admin/deletenhanvien", method = RequestMethod.GET)
	public String editNhanVien(@ModelAttribute("command") NhanVienBean nhanvienBean, BindingResult result,
			ModelMap mdm) {
		Map<String, Object> model = new HashMap<String, Object>();
		String trangthaiString = null;
		try {
			nhanvienService.deleteNhanVien(prepareModel1(nhanvienBean));
			trangthaiString = "Xóa nhân viên thành công";
		} catch (Exception e) {
			trangthaiString = "Nhân viên này không thể xóa";
		}
		mdm.addAttribute("msg", trangthaiString);
		model.put("nhanvien", null);
		model.put("nhanvienList", prepareListofBean(nhanvienService.listNhanVien()));
		return ("redirect:/admin/nhansu.do");
	}

	// Chọn nhân viên để edit
	@RequestMapping(value = "admin/editnhanvien", method = RequestMethod.GET)
	public ModelAndView deleteNhanVien(@ModelAttribute("command") NhanVienBean nhanvienBean, QuyenNVBean quyennvBean,
			BindingResult result) {
		Map<String, Object> model = new HashMap<String, Object>();
		model.put("nhanvien", prepareNhanVienBean(nhanvienService.getNhanVien(nhanvienBean.getMaNhanVien())));
		model.put("nhanvienList", prepareListofBean(nhanvienService.listNhanVien()));
		return new ModelAndView("home/CreateStaff", model);
	}

	// Chọn nhân viên để phân quyền
	@RequestMapping(value = "admin/editquyennv", method = RequestMethod.GET)
	public ModelAndView editquyenNhanVien(@ModelAttribute("command") NhanVienBean nhanvienBean, QuyenNVBean quyennvBean,
			BindingResult result) {
		Map<String, Object> model = new HashMap<String, Object>();
		model.put("nhanvien", prepareNhanVienBean(nhanvienService.getNhanVien(nhanvienBean.getMaNhanVien())));
		model.put("listuyennv", prepareListofBeanQuyenNV(nhanvienService.listQuyenNhanVien()));
		return new ModelAndView("home/SetRole", model);
	}

	// Xóa quyên nhân viên
	@RequestMapping(value = "admin/deleterole", method = RequestMethod.GET)
	public String deleteRole(@ModelAttribute("command") NhanVienBean nhanvienBean, QuyenNVBean quyennvBean,
			BindingResult result, Principal principal, ModelMap map) {
		Map<String, Object> model = new HashMap<String, Object>();
		NhanVien nhanVien = prepareModel1(nhanvienBean);
		String manv = principal.getName();
		if (nhanVien.getMaNhanVien().equals(manv) == false) {
			nhanvienService.deleteRole(nhanVien.getMaNhanVien());
			model.put("msg", "Xóa thành công");
			return ("redirect:/admin/nhansu.do");
		} else {
			map.addAttribute("msg", "Xóa không thành công, không thể tự hủy!");
			return ("redirect:/admin/nhansu.do");
		}
		//return ("redirect:/admin/nhansu.do");
	}

	// Cấp quyền cho nhân viên
	@RequestMapping(value = "admin/luuquyennv", method = RequestMethod.POST)
	public ModelAndView savequyenNhanVien(@ModelAttribute("command") NhanVienBean nhanvienBean, QuyenNVBean quyennvBean,
			BindingResult result) {
		Map<String, Object> model = new HashMap<String, Object>();
		model.put("nhanvien", prepareNhanVienBean(nhanvienService.getNhanVien(nhanvienBean.getMaNhanVien())));
		model.put("listuyennv", prepareListofBeanQuyenNV(nhanvienService.listQuyenNhanVien()));
		QuyenNV quyenNV = prepareModelquyennv(nhanvienBean);
		try {
			nhanvienService.taoquyenchonhanvien(quyenNV);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return new ModelAndView("redirect:/admin/nhansu.do", model);
	}

	// Cấp lại mật khẩu
	@RequestMapping(value = "admin/setpassword", method = RequestMethod.GET)
	public ModelAndView setPassword(@ModelAttribute("command") NhanVienBean nhanvienBean, QuyenNVBean quyennvBean,
			BindingResult result) {
		Map<String, Object> model = new HashMap<String, Object>();
		model.put("nhanvien", prepareNhanVienBean(nhanvienService.getNhanVien(quyennvBean.getMaNhanVien())));
		model.put("quyennv", prepareQuyenNhanVienBean(nhanvienService.getNhanVien(quyennvBean.getMaNhanVien())));
		return new ModelAndView("home/SetPassword");
	}

	// Cấp lại mật khẩu
	@RequestMapping(value = "admin/savepassword", method = RequestMethod.POST)
	public String savetPassword(ModelMap modelMap, @ModelAttribute("command") NhanVienBean nhanvienBean,
			QuyenNVBean quyennvBean, BindingResult result) {
		Map<String, Object> model = new HashMap<String, Object>();
		NhanVien nhanvien = nhanvienService.getNhanVien(quyennvBean.getMaNhanVien());
		if (nhanvien.getMatKhau().equals(nhanvienBean.getMatKhauNhap()) == false) {
			modelMap.addAttribute("msg", "Mật khẩu nhập lại không đúng !");
			return ("home/SetPassword");
		} else {
			nhanvienService.setpasworld(nhanvien, nhanvienBean.getMatKhau());
			modelMap.addAttribute("msg", "Đổi mật khẩu thành công!");
			return ("redirect:/admin/nhansu.do");
		}

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
		List<QuyenNV> listquyennv = nhanvienService.listquyennvtheoma(nhanvienBean.getMaNhanVien());
		QuyenNV quyenNV = new QuyenNV();
		if (listquyennv.isEmpty() == true) {
			quyenNV.setNhanVien(nhanvienService.getNhanVien(nhanvienBean.getMaNhanVien()));
			quyenNV.setQuyenNV(nhanvienBean.getQuyenNV());
			nhanvienBean.setMaNhanVien(null);
		} else {
			QuyenNV quyennv = listquyennv.get(listquyennv.size() - 1);
			quyenNV.setId(quyennv.getId());
			quyenNV.setNhanVien(quyennv.getNhanVien());
			quyenNV.setQuyenNV(nhanvienBean.getQuyenNV());
			nhanvienBean.setMaNhanVien(null);
		}
		return quyenNV;
	}

//
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
		bean.setGioiTinhString(nhanvien.isGioiTinh());
		return bean;
	}

	private QuyenNVBean prepareQuyenNhanVienBean(NhanVien nhanvien) {
		QuyenNVBean bean = new QuyenNVBean();
		bean.setMaNhanVien(nhanvien.getMaNhanVien());
		bean.setHoTenNV(nhanvien.getHoTenNV());
		return bean;
	}
}
