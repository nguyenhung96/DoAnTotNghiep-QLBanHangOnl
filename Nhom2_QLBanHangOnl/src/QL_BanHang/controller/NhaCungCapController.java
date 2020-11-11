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

import QL_BanHang.bean.NhaCungCapBean;
import QL_BanHang.bean.NhanVienBean;
import QL_BanHang.model.NhaCungCap;
import QL_BanHang.model.NhanVien;
import QL_BanHang.service.NhaCungCapService;
import QL_BanHang.service.NhanVienService;

@Controller
public class NhaCungCapController {
	@Autowired
	private NhaCungCapService nhacungcapService;
	
	
	@RequestMapping(value = "home/savenhacungcap", method = RequestMethod.POST)
	public ModelAndView saveNhaCungCap(@ModelAttribute("command") NhaCungCapBean nhacungcapBean, 
			BindingResult result) {
		NhaCungCap nhacungcap = prepareModel(nhacungcapBean);
		nhacungcapService.addNhaCungCap(nhacungcap);
		return new ModelAndView("redirect:/home/nhansu.do");
	}

	@RequestMapping(value="home/nhansu", method = RequestMethod.GET)
	public ModelAndView listNhaCungCap() {
		Map<String, Object> model = new HashMap<String, Object>();
		model.put("nhacungcapList",  prepareListofBean(nhacungcapService.listNhaCungCap()));
		
		return new ModelAndView("home/Staff", model);
	}

	@RequestMapping(value = "home/createstaff", method = RequestMethod.GET)
	public ModelAndView addNhaCungCap(@ModelAttribute("command")  NhaCungCapBean nhacungcapBean,
			BindingResult result) {
		Map<String, Object> model = new HashMap<String, Object>();
		model.put("nhacungcapList",  prepareListofBean(nhacungcapService.listNhaCungCap()));
		return new ModelAndView("home/CreateStaff", model);
	}
	
	@RequestMapping(value = "home/deletenhacungcap", method = RequestMethod.GET)
	public ModelAndView editNhaCungCap(@ModelAttribute("command")  NhaCungCapBean nhacungcapBean,
			BindingResult result) {
		nhacungcapService.deleteNhaCungCap(prepareModel(nhacungcapBean));
		Map<String, Object> model = new HashMap<String, Object>();
		model.put("nhacungcap", null);
		model.put("nhacungcapList",  prepareListofBean(nhacungcapService.listNhaCungCap()));
		return new ModelAndView("redirect:/home/nhansu.do");
	}
	
	@RequestMapping(value = "home/editnhacungcap", method = RequestMethod.GET)
	public ModelAndView deleteNhaCungCap(@ModelAttribute("command")  NhaCungCapBean nhacungcapBean,
			BindingResult result) {
		Map<String, Object> model = new HashMap<String, Object>();
		model.put("nhacungcap", prepareNhaCungCapBean(nhacungcapService.getNhaCungCap(nhacungcapBean.getMaNhaCungCap())));
		model.put("nhacungcapList",  prepareListofBean(nhacungcapService.listNhaCungCap()));
		return new ModelAndView("home/CreateStaff", model);
	}
	
	private NhaCungCap prepareModel(NhaCungCapBean nhacungcapBean){
		NhaCungCap nhacungcap = new NhaCungCap();
		nhacungcap.setMaNhaCungCap(nhacungcapBean.getMaNhaCungCap());
		nhacungcap.setTenNhaCungCap(nhacungcapBean.getTenNhaCungCap());
		nhacungcap.setEmail(nhacungcapBean.getEmail());
		nhacungcap.setDiaChi(nhacungcapBean.getDiaChi());
		nhacungcap.setSDT(nhacungcapBean.getSDT());
		nhacungcapBean.setMaNhaCungCap(null);
		return nhacungcap;
	}
	
	private List<NhaCungCapBean> prepareListofBean(List<NhaCungCap> nhacungcapList){
		List<NhaCungCapBean> beans = null;
		if(nhacungcapList != null && !nhacungcapList.isEmpty()){
			beans = new ArrayList<NhaCungCapBean>();
			NhaCungCapBean bean = null;
			for(NhaCungCap nhacungcap : nhacungcapList){
				bean = new NhaCungCapBean();
				bean.setMaNhaCungCap(nhacungcap.getMaNhaCungCap());
				bean.setTenNhaCungCap(nhacungcap.getTenNhaCungCap());
				bean.setEmail(nhacungcap.getEmail());
				bean.setDiaChi(nhacungcap.getDiaChi());
				bean.setSDT(nhacungcap.getSDT());
				beans.add(bean);
			}
		}
		return beans;
	}
	
	private NhaCungCapBean prepareNhaCungCapBean(NhaCungCap nhacungcap){
		NhaCungCapBean bean = new NhaCungCapBean();
		bean.setMaNhaCungCap(nhacungcap.getMaNhaCungCap());
		bean.setTenNhaCungCap(nhacungcap.getTenNhaCungCap());
		bean.setEmail(nhacungcap.getEmail());
		bean.setDiaChi(nhacungcap.getDiaChi());
		bean.setSDT(nhacungcap.getSDT());
		return bean;
	}
}
