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

	// Lưu và update nhân viên
	@RequestMapping(value = "login/quenmatkhau", method = RequestMethod.GET)
	public ModelAndView addNhanVien(@ModelAttribute("command") NhanVienBean nhanvienBean, BindingResult result) {
		Map<String, Object> model = new HashMap<String, Object>();
		return new ModelAndView("login/ForgotPassword", model);
	}

	// Lưu và update nhân viên
	@RequestMapping(value = "login/checkcode", method = RequestMethod.POST)
	public String checkcode(ModelMap model, @ModelAttribute("command") NhanVienBean nhanvienBean, BindingResult result) {
		if (nhanvienBean.getCodeNhap() == nhanvienBean.getCode()) {
			return ("login/login.do");
		}else {
			model.addAttribute("msg","Mã không đúng");
			 return ("login/CheckCode");
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

	private NhanVien prepareModel(NhanVienBean nhanvienBean) {
		NhanVien nhanvien = new NhanVien();
		nhanvien.setMaNhanVien(nhanvienBean.getMaNhanVien());
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
}
