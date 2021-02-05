package QL_BanHang.controller;

import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import QL_BanHang.bean.DonHangBean;
import QL_BanHang.bean.KhachHangBean;
import QL_BanHang.model.DonHang;
import QL_BanHang.model.KhachHang;
import QL_BanHang.service.DonHangService;
import QL_BanHang.service.KhachHangService;

@Controller
public class KhachHangController {
	@Autowired
	private KhachHangService khachhangService;
	@Autowired
	private DonHangService donhangService;

	@RequestMapping(value = "/khachhang/login", method = RequestMethod.GET)
	public String loginKH(@ModelAttribute("command") KhachHangBean khachhangBean, BindingResult result) {
		return "pages/dangnhap";

	}

	/// nhấn nút tạo tài khoản
	@RequestMapping(value = "/khachhang/dangky", method = RequestMethod.GET)
	public ModelAndView dangkyKH(@ModelAttribute("command") KhachHangBean khachhangBean, BindingResult result) {
		Map<String, Object> model = new HashMap<String, Object>();
		boolean status = false;
		model.put("khachhangList", status);
		System.out.println(model);
		return new ModelAndView("pages/dangky", model);

	}

	/// nhấn nút đăng kí và thêm dữ liệu vào dtb
	@RequestMapping(value = "pages/dangky", method = RequestMethod.POST)
	public ModelAndView addKhachHang(@ModelAttribute("command") KhachHangBean khachhangBean, BindingResult result,
			Model model) {
		Map<String, Object> models = new HashMap<String, Object>();
		KhachHang khachhang = prepareModel(khachhangBean);
		List<String> mails = khachhangService.getMailKH();
		boolean status = false;
		for (String mailKh : mails) {
			if (khachhang.getEmail().equals(mailKh)) {
				model.addAttribute("message", "Email đã tồn tại!");
				return new ModelAndView("pages/dangky", models);
			}
		}
		khachhangService.addKhachHang(khachhang);
		models.put("khachhangList", prepareListofBean(khachhangService.listKhachHang()));
		System.out.println(models);
		return new ModelAndView("pages/dangnhap", models);
	}

	@RequestMapping(value = "pages/dangnhap", method = RequestMethod.POST)
	public ModelAndView dangnhapKhachHang(@ModelAttribute("command") KhachHangBean khachhangBean,
			BindingResult result) {
		KhachHang khachhang = prepareModel(khachhangBean);
		khachhangService.addKhachHang(khachhang);
		return new ModelAndView("redirect:/pages/dangnhap.do");
	}

	@RequestMapping(value = "home/khachhang", method = RequestMethod.GET)
	public ModelAndView listKhachHang() {
		Map<String, Object> model = new HashMap<String, Object>();
		model.put("khachhangList", prepareListofBean(khachhangService.listKhachHang()));
		return new ModelAndView("home/Customer", model);
	}

//	@RequestMapping(value = "home/createkhachhang", method = RequestMethod.GET)
//	public ModelAndView addKhachHang(@ModelAttribute("command") KhachHangBean khachhangBean, BindingResult result) {
//		Map<String, Object> model = new HashMap<String, Object>();
//		model.put("khachhangList", prepareListofBean(khachhangService.listKhachHang()));
//		return new ModelAndView("home/CreateCustomer", model);
//	}

	@RequestMapping(value = "home/savekhachhang", method = RequestMethod.POST)
	public ModelAndView saveKhachHang(@ModelAttribute("command") KhachHangBean khachhangBean, BindingResult result) {
		KhachHang khachhang = prepareModel(khachhangBean);
		khachhangService.addKhachHang(khachhang);
		return new ModelAndView("redirect:/home/khachhang.do");
	}

	@RequestMapping(value = "home/deletekhachhang", method = RequestMethod.GET)
	public ModelAndView editKhachHang(@ModelAttribute("command") KhachHangBean khachhangBean, BindingResult result,
			ModelMap modelMap) {

		Map<String, Object> model = new HashMap<String, Object>();
		try {
			khachhangService.deleteKhachHang(prepareModel1(khachhangBean));
			modelMap.addAttribute("msg", "không thể xóa khách hàng");
		} catch (Exception e) {
			modelMap.addAttribute("msg", "không thể xóa khách hàng");
		}
		model.put("khachhang", null);
		model.put("khachhangList", prepareListofBean(khachhangService.listKhachHang()));
		return new ModelAndView("redirect:/home/khachhang.do");
	}

	@RequestMapping(value = "home/editkhachhang", method = RequestMethod.GET)
	public ModelAndView deleteKhachHang(@ModelAttribute("command") KhachHangBean khachhangBean, BindingResult result) {
		Map<String, Object> model = new HashMap<String, Object>();
		model.put("khachhang", prepareKhachHangBean(khachhangService.getKhachHang(khachhangBean.getMaKH())));
		model.put("khachhangList", prepareListofBean(khachhangService.listKhachHang()));
		return new ModelAndView("home/CreateCustomer", model);
	}

	private KhachHang prepareModel(KhachHangBean khachhangBean) {
		KhachHang khachhang = new KhachHang();
		String makh = null;
		if (khachhangBean.getMaKH() == "") {
			makh = khachhangService.genratemaKH();
		} else {
			makh = khachhangBean.getMaKH();
		}

		khachhang.setMaKH(makh);
		khachhang.setHoTenKH(khachhangBean.getHoTenKH());
		khachhang.setMatKhau(khachhangBean.getMatKhau());
		khachhang.setSDT(khachhangBean.getSDT());
		khachhang.setEmail(khachhangBean.getEmail());
		khachhang.setDiaChi(khachhangBean.getDiaChi());
		khachhangBean.setMaKH(null);
		return khachhang;
	}

	private KhachHang prepareModel1(KhachHangBean khachhangBean) {
		KhachHang khachhang = new KhachHang();
		khachhang.setMaKH(khachhangBean.getMaKH());
		khachhang.setHoTenKH(khachhangBean.getHoTenKH());
		khachhang.setMatKhau(khachhangBean.getMatKhau());
		khachhang.setSDT(khachhangBean.getSDT());
		khachhang.setEmail(khachhangBean.getEmail());
		khachhang.setDiaChi(khachhangBean.getDiaChi());
		khachhangBean.setMaKH(null);
		return khachhang;
	}

	private List<KhachHangBean> prepareListofBean(List<KhachHang> khachhangList) {
		List<KhachHangBean> beans = null;
		if (khachhangList != null && !khachhangList.isEmpty()) {
			beans = new ArrayList<KhachHangBean>();
			KhachHangBean bean = null;
			for (KhachHang khachhang : khachhangList) {
				bean = new KhachHangBean();
				bean.setMaKH(khachhang.getMaKH());
				bean.setHoTenKH(khachhang.getHoTenKH());
				bean.setMatKhau(khachhang.getMatKhau());
				bean.setSDT(khachhang.getSDT());
				bean.setEmail(khachhang.getEmail());
				bean.setDiaChi(khachhang.getDiaChi());
				beans.add(bean);
			}

		}
		return beans;
	}

	private KhachHangBean prepareKhachHangBean(KhachHang khachhang) {
		KhachHangBean bean = new KhachHangBean();
		bean.setMaKH(khachhang.getMaKH());
		bean.setHoTenKH(khachhang.getHoTenKH());
		bean.setMatKhau(khachhang.getMatKhau());
		bean.setSDT(khachhang.getSDT());
		bean.setEmail(khachhang.getEmail());
		bean.setDiaChi(khachhang.getDiaChi());
		return bean;
	}

	// Login khách hàng
	@RequestMapping(value = "/khachhang/loginkh", method = RequestMethod.POST)
	public String login(@ModelAttribute("command") KhachHangBean khachhangBean, BindingResult result,
			HttpSession session, Model model) {
		System.out.println(khachhangBean.getEmail());
		System.out.println(khachhangBean.getMatKhau());
		List<KhachHang> khahangList = khachhangService.listKhachHang();
		for (KhachHang khachhang : khahangList) {
			if (khachhangBean.getEmail().equals(khachhang.getEmail())) {
				if (khachhangBean.getMatKhau().equals(khachhang.getMatKhau())) {
					session.setAttribute("makhachhang", khachhang.getMaKH());
					session.setAttribute("tenkhachhang", khachhang.getHoTenKH());
					session.setAttribute("sdtkh", khachhang.getSDT());
					session.setAttribute("emailkh", khachhang.getEmail());
					session.setAttribute("diachikh", khachhang.getDiaChi());
					return "pages/index";
				}
				model.addAttribute("message", "Sai thông tin, vui lòng kiểm tra lại!");
				return "pages/dangnhap";
			}
//			System.out.println("kh k ton tai");

		}

		return "pages/index";

	}

	// Đăng xuất khách hàng
//	@RequestMapping(value = "/khachhang/dangxuat", method = RequestMethod.GET)
//	public String dangxuat(BindingResult result,
//			HttpSession session) {
//					return "pages/dangnhap";
//	}

	@RequestMapping(value = "/khachhang/dangxuat", method = RequestMethod.GET)
	public String dangxuat(ModelMap model, HttpSession session) {
		session.removeAttribute("makhachhang");
		session.setAttribute("makhachhang", null);
		session.setAttribute("tenkhachhang", "");
		session.setAttribute("sdtkh", "");
		session.setAttribute("emailkh", "");
		session.setAttribute("diachikh", "");
		return "pages/index";

	}

//	@RequestMapping(value = "home/orderkh", method = RequestMethod.GET)
//	public ModelAndView listDonHang() {
//		Map<String, Object> model = new HashMap<String, Object>();
//		model.put("donhangList", prepareListofBean2(donhangService.listDonHang()));
//		return new ModelAndView("home/OrderListKh", model);
//	}

	private List<DonHangBean> prepareListofBean2(List<DonHang> donhangList) {
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

}
