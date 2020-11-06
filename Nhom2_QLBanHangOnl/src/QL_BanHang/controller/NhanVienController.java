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
import QL_BanHang.model.NhanVien;
import QL_BanHang.service.NhanVienService;

@Controller
public class NhanVienController {
	@Autowired
	private NhanVienService nhanvienService;
	
	
	@RequestMapping(value = "home/savenhanvien", method = RequestMethod.POST)
	public ModelAndView saveNhanVien(@ModelAttribute("command") NhanVienBean nhanvienBean, 
			BindingResult result) {
		NhanVien nhanvien = prepareModel(nhanvienBean);
		nhanvienService.addNhanVien(nhanvien);
		return new ModelAndView("redirect:/home/nhansu.do");
	}

	@RequestMapping(value="home/nhansu", method = RequestMethod.GET)
	public ModelAndView listNhanVien() {
		Map<String, Object> model = new HashMap<String, Object>();
		model.put("nhanvienList",  prepareListofBean(nhanvienService.listNhanVien()));
		
		return new ModelAndView("home/Staff", model);
	}

	@RequestMapping(value = "home/createstaff", method = RequestMethod.GET)
	public ModelAndView addNhanVien(@ModelAttribute("command")  NhanVienBean nhanvienBean,
			BindingResult result) {
		Map<String, Object> model = new HashMap<String, Object>();
		model.put("nhanvienList",  prepareListofBean(nhanvienService.listNhanVien()));
		return new ModelAndView("home/CreateStaff", model);
	}
	
	@RequestMapping(value = "home/deletenhanvien", method = RequestMethod.GET)
	public ModelAndView editNhanVien(@ModelAttribute("command")  NhanVienBean nhanvienBean,
			BindingResult result) {
		nhanvienService.deleteNhanVien(prepareModel(nhanvienBean));
		Map<String, Object> model = new HashMap<String, Object>();
		model.put("nhanvien", null);
		model.put("nhanvienList",  prepareListofBean(nhanvienService.listNhanVien()));
		return new ModelAndView("redirect:/home/nhansu.do");
	}
	
	@RequestMapping(value = "home/editnhanvien", method = RequestMethod.GET)
	public ModelAndView deleteNhanVien(@ModelAttribute("command")  NhanVienBean nhanvienBean,
			BindingResult result) {
		Map<String, Object> model = new HashMap<String, Object>();
		model.put("nhanvien", prepareNhanVienBean(nhanvienService.getNhanVien(nhanvienBean.getMaNhanVien())));
		model.put("nhanvienList",  prepareListofBean(nhanvienService.listNhanVien()));
		return new ModelAndView("home/CreateStaff", model);
	}
	
	private NhanVien prepareModel(NhanVienBean nhanvienBean){
		NhanVien nhanvien = new NhanVien();
		nhanvien.setMaNhanVien(nhanvienBean.getMaNhanVien());
		nhanvien.setHoTenNV(nhanvienBean.getHoTenNV());
		nhanvien.setMatKhau(nhanvienBean.getMatKhau());
		nhanvien.setEmail(nhanvienBean.getEmail());
		nhanvien.setDiaChi(nhanvienBean.getDiaChi());
		nhanvien.setCMND(nhanvienBean.getCMND());
		nhanvien.setGioiTinh(nhanvienBean.isGioiTinh());
		nhanvien.setHinh(nhanvienBean.getHinh());
		nhanvien.setSDT(nhanvienBean.getSDT());
		nhanvien.setChucVu(nhanvienBean.getChucVu());
		nhanvienBean.setMaNhanVien(null);
		return nhanvien;
	}
	
	private List<NhanVienBean> prepareListofBean(List<NhanVien> nhanvienList){
		List<NhanVienBean> beans = null;
		if(nhanvienList != null && !nhanvienList.isEmpty()){
			beans = new ArrayList<NhanVienBean>();
			NhanVienBean bean = null;
			for(NhanVien nhanvien : nhanvienList){
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
				bean.setChucVu(nhanvien.getChucVu());
				beans.add(bean);
			}
		}
		return beans;
	}
	
	private NhanVienBean prepareNhanVienBean(NhanVien nhanvien){
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
		bean.setChucVu(nhanvien.getChucVu());
		return bean;
	}
}
