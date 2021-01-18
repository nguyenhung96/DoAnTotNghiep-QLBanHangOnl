package QL_BanHang.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import QL_BanHang.bean.NhaCungCapBean;
import QL_BanHang.model.NhaCungCap;
import QL_BanHang.service.NhaCungCapService;

@Controller
public class NhaCungCapController {
	@Autowired
	private NhaCungCapService nhacungcapService;
	
	@RequestMapping(value = "home/savesupplier", method = RequestMethod.POST)
	public ModelAndView saveNhaCungCap(@ModelAttribute("command") NhaCungCapBean nhacungcapBean, BindingResult result, Model model) {
		NhaCungCap nhaCungCap = prepareModel(nhacungcapBean);		
		List<String> maNCCs = nhacungcapService.getMaNCC();
		List<String> maNCCFromNhomSPs = nhacungcapService.getMaNCCFromNhomSP();
		List<String> maNCCFormNCCs = nhacungcapService.getMaNCCFromNCC();
			for(String maNCC : maNCCFormNCCs) {
				if(nhaCungCap.getMaNhaCungCap().equals(maNCC)){
					model.addAttribute("messenge", "Mã nhà cung cấp đã tồn tại");
					return new ModelAndView("home/CreateSupplier");				
				}
			}	
		nhacungcapService.addNhaCungCap(nhaCungCap);
		return new ModelAndView("redirect:/home/supplier.do");
	}
	@RequestMapping(value = "home/editsupplier", method = RequestMethod.POST)
	public ModelAndView editNhaCungCap(@ModelAttribute("command") NhaCungCapBean nhacungcapBean, BindingResult result, Model model) {
		NhaCungCap nhaCungCap = prepareModel(nhacungcapBean);
		System.out.println(nhaCungCap.getMaNhaCungCap());
		List<String> maNCCs = nhacungcapService.getMaNCC();	
		List<String> MaNCCFromNCCs = nhacungcapService.getMaNCCFromNCC();
		System.out.println(MaNCCFromNCCs);
		boolean stt=false;
		maNCCs.addAll(nhacungcapService.getMaNCCFromNhomSP());
		for(String maNCC : MaNCCFromNCCs) {
			System.out.println(nhaCungCap.getMaNhaCungCap());
			System.out.println(maNCC);
			
			if(nhaCungCap.getMaNhaCungCap().equals(maNCC)){
				stt=true;							
			}
			
		}	
		if(!stt) {
			model.addAttribute("messenge", "Bạn không thể thay đổi mã nhà cung cấp!");				
			return new ModelAndView("home/EditSupplier");	
		}
			for(String maNCC : maNCCs) {
				if(nhaCungCap.getMaNhaCungCap().equals(maNCC)){
					model.addAttribute("messenge", "Mã nhà cung cấp đã sử dụng. Bạn không thể thay đổi thông tin!");
					return new ModelAndView("home/EditSupplier");				
				}
			}	
		nhacungcapService.addNhaCungCap(nhaCungCap);
		return new ModelAndView("redirect:/home/supplier.do");
	}

	@RequestMapping(value = "home/supplier", method = RequestMethod.GET)
	public ModelAndView listNhaCungCap() {
		Map<String, Object> model = new HashMap<String, Object>();
		model.put("nhacungcapList", prepareListofBean(nhacungcapService.listNhaCungCap()));			
		return new ModelAndView("home/Supplier", model);
	}	
	@RequestMapping(value = "home/createsupplier", method = RequestMethod.GET)
	public ModelAndView addNhaCungCap(@ModelAttribute("command") NhaCungCapBean nhacungcapBean, BindingResult result, Model model) {
		Map<String, Object> models = new HashMap<String, Object>();	
		models.put("nhacungcapList", prepareListofBean(nhacungcapService.listNhaCungCap()));
		model.addAttribute("messenge", "Thông Tin Nhà Cung Cấp");
		return new ModelAndView("home/CreateSupplier", models);
	}

	@RequestMapping(value = "home/deletesupplier", method = RequestMethod.GET)
	public ModelAndView deleteNhaCungCap(@ModelAttribute("command") NhaCungCapBean nhacungcapBean,
			BindingResult result, Model model) {
		NhaCungCap nhaCungCap = prepareModel(nhacungcapBean);		
		List<String> maNCCs = nhacungcapService.getMaNCC();		
		maNCCs.addAll(nhacungcapService.getMaNCCFromNhomSP());
		boolean stt= false;
		for(String maNCC : maNCCs) {
			if(nhaCungCap.getMaNhaCungCap().equals(maNCC)){					
				stt=true;
				break;
			}
		}
		System.out.println(stt);
		if(stt) {
			model.addAttribute("messenge", "Mã nhà cung cấp đã sử dụng. Bạn không thể xóa!");
		}else {
			nhacungcapService.deleteNhaCungCap(nhaCungCap);			
		}
		Map<String, Object> models = new HashMap<String, Object>();
		models.put("nhacungcap", null);
		models.put("nhacungcapList", prepareListofBean(nhacungcapService.listNhaCungCap()));
		return new ModelAndView("home/Supplier",models);
	}

	@RequestMapping(value = "home/editsupplier", method = RequestMethod.GET)
	public ModelAndView edittNhaCungCap(@ModelAttribute("command") NhaCungCapBean nhacungcapBean, BindingResult result, Model model) {		
		Map<String, Object> models = new HashMap<String, Object>();
		models.put("nhacungcap",
				prepareNhaCungCapBean(nhacungcapService.getNhaCungCap(nhacungcapBean.getMaNhaCungCap())));
		models.put("nhacungcapList", prepareListofBean(nhacungcapService.listNhaCungCap()));
		model.addAttribute("messenge", "Thông Tin Nhà Cung Cấp");
		return new ModelAndView("home/EditSupplier", models);
	}

	private NhaCungCap prepareModel(NhaCungCapBean nhacungcapBean) {
		NhaCungCap nhacungcap = new NhaCungCap();
		nhacungcap.setMaNhaCungCap(nhacungcapBean.getMaNhaCungCap());
		nhacungcap.setTenNhaCungCap(nhacungcapBean.getTenNhaCungCap());
		nhacungcap.setEmail(nhacungcapBean.getEmail());
		nhacungcap.setSDT(nhacungcapBean.getSDT());
		nhacungcap.setDiaChi(nhacungcapBean.getDiaChi());
		nhacungcapBean.setMaNhaCungCap(null);
		return nhacungcap;
	}

	private List<NhaCungCapBean> prepareListofBean(List<NhaCungCap> nhacungcapList) {
		List<NhaCungCapBean> beans = null;
		if (nhacungcapList != null && !nhacungcapList.isEmpty()) {
			beans = new ArrayList<NhaCungCapBean>();
			NhaCungCapBean bean = null;
			for (NhaCungCap nhacungcap : nhacungcapList) {
				bean = new NhaCungCapBean();
				bean.setMaNhaCungCap(nhacungcap.getMaNhaCungCap());
				bean.setTenNhaCungCap(nhacungcap.getTenNhaCungCap());
				bean.setEmail(nhacungcap.getEmail());
				bean.setSDT(nhacungcap.getSDT());
				bean.setDiaChi(nhacungcap.getDiaChi());
				beans.add(bean);
			}
		}
		
		return beans;
	}

	private NhaCungCapBean prepareNhaCungCapBean(NhaCungCap nhacungcap) {
		NhaCungCapBean bean = new NhaCungCapBean();
		bean.setMaNhaCungCap(nhacungcap.getMaNhaCungCap());
		bean.setTenNhaCungCap(nhacungcap.getTenNhaCungCap());
		bean.setEmail(nhacungcap.getEmail());
		bean.setSDT(nhacungcap.getSDT());
		bean.setDiaChi(nhacungcap.getDiaChi());
		return bean;
	}
}
