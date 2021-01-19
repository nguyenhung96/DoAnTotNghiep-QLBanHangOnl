package QL_BanHang.controller;

import java.security.Principal;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import QL_BanHang.bean.DangNhapBean;
import QL_BanHang.bean.NhanVienBean;
import QL_BanHang.model.NhanVien;
import QL_BanHang.model.SanPham;
import QL_BanHang.service.DonHangService;
import QL_BanHang.service.KhachHangService;
import QL_BanHang.service.NhanVienService;
import QL_BanHang.service.SanPhamService;

@Controller
public class LoginController {
	@Autowired
	KhachHangService khachhangservice;

	@Autowired
	SanPhamService sanphamservice;
	@Autowired
	NhanVienService nhanvienService;
	@Autowired
	DonHangService donHangService;
	@Autowired
	private JavaMailSender mailSender;

	@RequestMapping(value = "/home/index", method = RequestMethod.GET)
	public String executeSecurity(ModelMap model, Principal principal, HttpSession session) {
		String name = principal.getName();
		model.addAttribute("author", name);
		model.addAttribute("sokhachhang", khachhangservice.demKhachHang());
		model.addAttribute("sosanpham", sanphamservice.demSanPham());
		model.addAttribute("donhangdanggiao", donHangService.demdonhangdanggiao());
		model.addAttribute("donhangchuaduyet", donHangService.demdonhangchuaduyet());
		NhanVien nhanVien = nhanvienService.getNhanVien(name);
		session.setAttribute("nhanviendangnhap", nhanVien);
		return "home/index";

	}

	// Chức năng quên mật khẩu
	@RequestMapping(value = "login/quenmatkhau", method = RequestMethod.GET)
	public ModelAndView addNhanVien(@ModelAttribute("command") NhanVienBean nhanvienBean, BindingResult result) {
		Map<String, Object> model = new HashMap<String, Object>();
		return new ModelAndView("login/ForgotPassword", model);
	}

	@RequestMapping(value = "login/checkcode", method = RequestMethod.POST)
	public String checkcode(ModelMap model, @ModelAttribute("command") NhanVienBean nhanvienBean,
			BindingResult result) {
		if (nhanvienBean.getCodeNhap() == nhanvienBean.getCode()) {
			return ("login/ResetPass");
		} else {
			model.addAttribute("msg", "Mã xác nhận không đúng");
			return ("login/CheckCode");
		}
	}

	@RequestMapping(value = "login/resetpass", method = RequestMethod.POST)
	public String resetpass(ModelMap model, @ModelAttribute("command") NhanVienBean nhanvienBean,
			BindingResult result) {
		if (nhanvienBean.getMatKhau().equals(nhanvienBean.getMatKhauNhap())) {
			NhanVien nhanvien = nhanvienService.getNhanVien(nhanvienBean.getMaNhanVien());
			String matkhau = nhanvienBean.getMatKhau();
			nhanvienService.setpasworld(nhanvien, matkhau);
			return ("redirect:/login/login.do");
		} else {
			model.addAttribute("msg", "Mật khẩu nhập lại không đúng");
			return ("login/ResetPass");
		}
	}

	// Lưu và update nhân viên
	@RequestMapping(value = "login/quenmatkhaumail", method = RequestMethod.POST)
	public ModelAndView saveNhanVien(@ModelAttribute("command") NhanVienBean nhanvienBean, BindingResult result,
			HttpSession session) {
		Map<String, Object> model = new HashMap<String, Object>();
		try {
			NhanVien nhanvien = nhanvienService.getNhanVien(nhanvienBean.getMaNhanVien());
			int code = (int) Math.floor(((Math.random() * 899999) + 100000));
			System.out.println(code);
			// sendmail
			SimpleMailMessage email = new SimpleMailMessage();
			email.setTo(nhanvien.getEmail());
			email.setSubject("Đặt lại mật khẩu");
			email.setText("Mã xác nhận: " + code);
			mailSender.send(email);
			// Day code va nv len session
			session.setAttribute("code", code);
			session.setAttribute("nvsetmk", nhanvien.getMaNhanVien());

		} catch (Exception e) {
			e.printStackTrace();
		}
		return new ModelAndView("login/CheckCode");
	}
	// Chức năng quên mật khẩu

	// Login
	@RequestMapping(value = "/login/login", method = RequestMethod.GET)
	public String login(ModelMap model, Principal principal) {

		return "login/Login";

	}

	@RequestMapping(value = "/login/fail2login", method = RequestMethod.GET)
	public String loginerror(ModelMap model) {

		model.addAttribute("error", "true");
		return "login/Login";

	}

	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String logout(ModelMap model) {

		return "login/Login";

	}

	// Profile
	// Chức năng quên mật khẩu
	@RequestMapping(value = "home/profile", method = RequestMethod.GET)
	public ModelAndView profile(@ModelAttribute("command") NhanVienBean nhanvienBean, BindingResult result,
			Principal principal) {
		Map<String, Object> model = new HashMap<String, Object>();
		String name = principal.getName();
		NhanVienBean nhanvien = prepareNhanVienBean(nhanvienService.getNhanVien(name));
		model.put("nhanvien", nhanvien);
		return new ModelAndView("home/Profile", model);
	}

	@RequestMapping(value = "home/changepass", method = RequestMethod.GET)
	public ModelAndView changepass(@ModelAttribute("command") NhanVienBean nhanvienBean, BindingResult result,
			Principal principal) {
		Map<String, Object> model = new HashMap<String, Object>();
		String name = principal.getName();
		NhanVienBean nhanvien = prepareNhanVienBean(nhanvienService.getNhanVien(name));
		model.put("nhanvien", nhanvien);
		return new ModelAndView("home/ChangePass", model);
	}

	@RequestMapping(value = "home/savepass", method = RequestMethod.POST)
	public String savepass(ModelMap model, @ModelAttribute("command") NhanVienBean nhanvienBean, BindingResult result,
			Principal principal) {
		String name = principal.getName();
		NhanVien nhanvien = nhanvienService.getNhanVien(name);

		if (nhanvienBean.getMatKhau().equals(nhanvien.getMatKhau())) {
			if (nhanvienBean.getMatKhauNhap().isEmpty() == false) {
				if (nhanvienBean.getMatKhauNhap().equals(nhanvienBean.getMatKhauNhap2())) {
					nhanvienService.setpasworld(nhanvien, nhanvienBean.getMatKhauNhap());
					return ("redirect:/home/index.do");
				} else {
					model.addAttribute("msg1", "Mật khẩu nhập lại không đúng!");
					return ("home/ChangePass");
				}
			} else {
				model.addAttribute("msg2", "Mật khẩu không được trống !");
				return ("home/ChangePass");
			}

		} else {
			model.addAttribute("msg", "Mật khẩu nhập không đúng!");
			return ("home/ChangePass");
		}
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

}
