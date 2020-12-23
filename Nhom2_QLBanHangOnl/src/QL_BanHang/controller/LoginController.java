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
import QL_BanHang.bean.LoginBean;
import QL_BanHang.bean.NhanVienBean;
import QL_BanHang.model.NhanVien;
import QL_BanHang.model.SanPham;
import QL_BanHang.service.KhachHangService;
import QL_BanHang.service.NhanVienService;

@Controller
public class LoginController {
	@Autowired KhachHangService khachhangservice;

	@RequestMapping(value="/home/index", method = RequestMethod.GET)
	public String executeSecurity(ModelMap model, Principal principal ) {
		String name = principal.getName();
		model.addAttribute("author", name);
		model.addAttribute("sokhachhang", khachhangservice.demKhachHang());
		return "home/index";
 
	}
 
	@RequestMapping(value="/login/login", method = RequestMethod.GET)
	public String login(ModelMap model) {
 
		return "login/Login";
 
	}
 
	@RequestMapping(value="/login/fail2login", method = RequestMethod.GET)
	public String loginerror(ModelMap model) {
 
		model.addAttribute("error", "true");
		return "login/Login";
 
	}
 
	@RequestMapping(value="/logout", method = RequestMethod.GET)
	public String logout(ModelMap model) {
 
		return "login/Login";
 
	}
}
