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
import QL_BanHang.model.NhaCungCap;
import QL_BanHang.service.NhaCungCapService;

@Controller
public class NhaCungCapController {
	@Autowired
	private NhaCungCapService nhacungcapService;

	@RequestMapping(value = "home/savesupplier", method = RequestMethod.POST)
	public ModelAndView saveNhaCungCap(@ModelAttribute("command") NhaCungCapBean nhacungcapBean, BindingResult result) {
		NhaCungCap nhacungcap = prepareModel(nhacungcapBean);
		nhacungcapService.addNhaCungCap(nhacungcap);
		return new ModelAndView("redirect:/home/supplier.do");
	}

	@RequestMapping(value = "home/supplier", method = RequestMethod.GET)
	public ModelAndView listNhaCungCap() {
		Map<String, Object> model = new HashMap<String, Object>();
		model.put("nhacungcapList", prepareListofBean(nhacungcapService.listNhaCungCap()));

		return new ModelAndView("home/Supplier", model);
	}

	@RequestMapping(value = "home/createsupplier", method = RequestMethod.GET)
	public ModelAndView addNhaCungCap(@ModelAttribute("command") NhaCungCapBean nhacungcapBean, BindingResult result) {
		Map<String, Object> model = new HashMap<String, Object>();
		model.put("nhacungcapList", prepareListofBean(nhacungcapService.listNhaCungCap()));
		return new ModelAndView("home/CreateSupplier", model);
	}

	@RequestMapping(value = "home/deletesupplier", method = RequestMethod.GET)
	public ModelAndView deleteNhaCungCap(@ModelAttribute("command") NhaCungCapBean nhacungcapBean,
			BindingResult result) {
		nhacungcapService.deleteNhaCungCap(prepareModel(nhacungcapBean));
		Map<String, Object> model = new HashMap<String, Object>();
		model.put("nhacungcap", null);
		model.put("nhacungcapList", prepareListofBean(nhacungcapService.listNhaCungCap()));
		return new ModelAndView("redirect:/home/supplier.do");
	}

	@RequestMapping(value = "home/editsupplier", method = RequestMethod.GET)
	public ModelAndView editNhaCungCap(@ModelAttribute("command") NhaCungCapBean nhacungcapBean, BindingResult result) {
		Map<String, Object> model = new HashMap<String, Object>();
		model.put("nhacungcap",
				prepareNhaCungCapBean(nhacungcapService.getNhaCungCap(nhacungcapBean.getMaNhaCungCap())));
		model.put("nhacungcapList", prepareListofBean(nhacungcapService.listNhaCungCap()));
		return new ModelAndView("home/CreateSupplier", model);
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
