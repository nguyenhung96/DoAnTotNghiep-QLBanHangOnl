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

import QL_BanHang.bean.KhachHangBean;
import QL_BanHang.model.KhachHang;
import QL_BanHang.service.KhachHangService;

@Controller
public class KhachHangController {
	@Autowired
	private KhachHangService khachhangService;

	@RequestMapping(value = "home/savekhachhang", method = RequestMethod.POST)
	public ModelAndView saveKhachHang(@ModelAttribute("command") KhachHangBean khachhangBean, BindingResult result) {
		KhachHang khachhang = prepareModel(khachhangBean);
		khachhangService.addKhachHang(khachhang);
		return new ModelAndView("redirect:/home/khachhang.do");
	}

	@RequestMapping(value = "home/khachhang", method = RequestMethod.GET)
	public ModelAndView listKhachHang() {
		Map<String, Object> model = new HashMap<String, Object>();
		model.put("khachhangList", prepareListofBean(khachhangService.listKhachHang()));
		return new ModelAndView("home/Customer", model);
	}

	@RequestMapping(value = "home/createkhachhang", method = RequestMethod.GET)
	public ModelAndView addKhachHang(@ModelAttribute("command") KhachHangBean khachhangBean, BindingResult result) {
		Map<String, Object> model = new HashMap<String, Object>();
		model.put("khachhangList", prepareListofBean(khachhangService.listKhachHang()));
		return new ModelAndView("home/CreateCustomer", model);
	}

	@RequestMapping(value = "home/deletekhachhang", method = RequestMethod.GET)
	public ModelAndView editKhachHang(@ModelAttribute("command") KhachHangBean khachhangBean, BindingResult result) {
		khachhangService.deleteKhachHang(prepareModel(khachhangBean));
		Map<String, Object> model = new HashMap<String, Object>();
		model.put("khachhang", null);
		model.put("khachhangList", prepareListofBean(khachhangService.listKhachHang()));
		return new ModelAndView("redirect:/home/khachhang.do");
	}

	@RequestMapping(value = "home/editkhachhang", method = RequestMethod.GET)
	public ModelAndView deleteKhachHang(@ModelAttribute("command")  KhachHangBean khachhangBean,
			BindingResult result) {
		Map<String, Object> model = new HashMap<String, Object>();
		model.put("khachhang", prepareKhachHangBean(khachhangService.getKhachHang(khachhangBean.getMaKH())));
		model.put("khachhangList",  prepareListofBean(khachhangService.listKhachHang()));
		return new ModelAndView("home/CreateCustomer", model);
	}
	
	private KhachHang prepareModel(KhachHangBean khachhangBean){
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
	
	private List<KhachHangBean> prepareListofBean(List<KhachHang> khachhangList){
		List<KhachHangBean> beans = null;
		if(khachhangList != null && !khachhangList.isEmpty()){
			beans = new ArrayList<KhachHangBean>();
			KhachHangBean bean = null;
			for(KhachHang khachhang : khachhangList){
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
	
	private KhachHangBean prepareKhachHangBean(KhachHang khachhang){
		KhachHangBean bean = new KhachHangBean();
		bean.setMaKH(khachhang.getMaKH());
		bean.setHoTenKH(khachhang.getHoTenKH());
		bean.setMatKhau(khachhang.getMatKhau());
		bean.setSDT(khachhang.getSDT());
		bean.setEmail(khachhang.getEmail());
		bean.setDiaChi(khachhang.getDiaChi());
		return bean;
	}

}
