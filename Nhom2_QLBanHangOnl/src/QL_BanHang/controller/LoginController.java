package QL_BanHang.controller;

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
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import QL_BanHang.bean.DangNhapBean;
import QL_BanHang.bean.NhanVienBean;
import QL_BanHang.model.NhanVien;
import QL_BanHang.service.NhanVienService;

@Controller
public class LoginController {
	@RequestMapping(value = "/login/login", method = RequestMethod.GET)
	public String gotoLogin(@ModelAttribute("command") DangNhapBean dangnhap, BindingResult result) {

		return "login/Login";
	}

	@Autowired
	SessionFactory factory;

	@Transactional
	@RequestMapping(value = "/login/Login", method = RequestMethod.POST)
	public String validate1(ModelMap model, HttpSession session, @ModelAttribute("dangnhap") DangNhapBean dangnhap,
			BindingResult errors) {
		Session session1 = factory.getCurrentSession();
		String hql = "FROM NhanVien";
		Query query = session1.createQuery(hql);
		List<NhanVien> list = query.list();
		model.addAttribute("nhanvien", list);
		for (NhanVien i : list) {
			if ((dangnhap.getMaNhanVien().equals(i.getMaNhanVien()))
					&& (dangnhap.getMatKhau().equals(i.getMatKhau()))) {
				if (i.getEnable() == 1) {
					return "home/index";
				} else if (i.getEnable() == 2) {
					System.out.println("Tai khoan da bi vo hieu hoa");

					return ("redirect:/login/login.do");
				}
			}
		}
		return ("redirect:/login/login.do");

	}

	// pripare model
	private NhanVien prepareModel(DangNhapBean dangnhapBean) {
		NhanVien nhanvien = new NhanVien();
		nhanvien.setMaNhanVien(dangnhapBean.getMaNhanVien());
		nhanvien.setEnable(dangnhapBean.getEnable());
		nhanvien.setMatKhau(dangnhapBean.getMatKhau());
		dangnhapBean.setMaNhanVien(null);
		return nhanvien;
	}

	// pripare list of bean
	private List<DangNhapBean> prepareListofBean(List<NhanVien> nhanvienList) {
		List<DangNhapBean> beans = null;
		if (nhanvienList != null && !nhanvienList.isEmpty()) {
			beans = new ArrayList<DangNhapBean>();
			DangNhapBean bean = null;
			for (NhanVien nhanvien : nhanvienList) {
				bean = new DangNhapBean();
				bean.setMaNhanVien(nhanvien.getMaNhanVien());
				bean.setMatKhau(nhanvien.getMatKhau());
				bean.setEnable(nhanvien.getEnable());
				beans.add(bean);
			}
		}
		return beans;
	}

}
