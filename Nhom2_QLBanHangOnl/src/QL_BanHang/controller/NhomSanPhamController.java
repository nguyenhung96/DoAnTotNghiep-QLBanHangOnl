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

import QL_BanHang.bean.NhomSanPhamBean;
import QL_BanHang.model.NhomSanPham;
import QL_BanHang.service.NhaCungCapService;
import QL_BanHang.service.NhomSanPhamService;

@Controller
public class NhomSanPhamController {
	@Autowired
	private NhomSanPhamService nhomsanphamService;
	@Autowired
	private NhaCungCapService nhacungcapService;

	@RequestMapping(value = "home/saveproducttype", method = RequestMethod.POST)
	public ModelAndView saveNhomSanPham(@ModelAttribute("command") NhomSanPhamBean nhomsanphamBean,
			BindingResult result) {
		NhomSanPham nhomsanpham = prepareModel(nhomsanphamBean);
		nhomsanphamService.addNhomSanPham(nhomsanpham);
		return new ModelAndView("redirect:/home/producttype.do");
	}

	@RequestMapping(value = "home/producttype", method = RequestMethod.GET)
	public ModelAndView listNhomSanPham() {
		Map<String, Object> model = new HashMap<String, Object>();
		model.put("nhomsanphamList", prepareListofBean(nhomsanphamService.listNhomSanPham()));

		return new ModelAndView("home/ProductType", model);
	}

	@RequestMapping(value = "home/createproducttype", method = RequestMethod.GET)
	public ModelAndView addNhomSanPham(@ModelAttribute("command") NhomSanPhamBean nhomsanphamBean,
			BindingResult result) {
		Map<String, Object> model = new HashMap<String, Object>();
		model.put("nhomsanphamList", prepareListofBean(nhomsanphamService.listNhomSanPham()));
		model.put("nhacungcapList", nhacungcapService.listNhaCungCap());
		return new ModelAndView("home/CreateProductType", model);
	}

	@RequestMapping(value = "home/deleteproducttype", method = RequestMethod.GET)
	public ModelAndView deleteNhomSanPham(@ModelAttribute("command") NhomSanPhamBean nhomsanphamBean,
			BindingResult result) {
		nhomsanphamService.deleteNhomSanPham1(nhomsanphamBean.getId());
		Map<String, Object> model = new HashMap<String, Object>();
		model.put("nhomsanpham", null);
		model.put("nhomsanphamList", prepareListofBean(nhomsanphamService.listNhomSanPham()));
		return new ModelAndView("redirect:/home/producttype.do");
	}

	@RequestMapping(value = "home/editproducttype", method = RequestMethod.GET)
	public ModelAndView editNhomSanPham(@ModelAttribute("command") NhomSanPhamBean nhomsanphamBean,
			BindingResult result) {
		Map<String, Object> model = new HashMap<String, Object>();
		model.put("nhomsanpham", prepareNhomSanPhamBean(nhomsanphamService.getNhomSanPham(nhomsanphamBean.getId())));
		model.put("nhomsanphamList", prepareListofBean(nhomsanphamService.listNhomSanPham()));
		model.put("nhacungcapList", nhacungcapService.listNhaCungCap());
		return new ModelAndView("home/CreateProductType", model);
	}

	private NhomSanPham prepareModel(NhomSanPhamBean nhomsanphamBean) {
		NhomSanPham nhomsanpham = new NhomSanPham();
		if (nhomsanphamBean.getId() == 0) {

		} else {
			nhomsanpham.setId(nhomsanphamBean.getId());
		}
		nhomsanpham.setTenNhomSP(nhomsanphamBean.getTenNhomSP());
		nhomsanpham.setNhacungcap(nhacungcapService.getNhaCungCap(nhomsanphamBean.getMaNhaCungCap()));
		return nhomsanpham;
	}

	private List<NhomSanPhamBean> prepareListofBean(List<NhomSanPham> nhomsanphamList) {
		List<NhomSanPhamBean> beans = null;
		if (nhomsanphamList != null && !nhomsanphamList.isEmpty()) {
			beans = new ArrayList<NhomSanPhamBean>();
			NhomSanPhamBean bean = null;
			for (NhomSanPham nhomsanpham : nhomsanphamList) {
				bean = new NhomSanPhamBean();
				bean.setId(nhomsanpham.getId());
				bean.setTenNhomSP(nhomsanpham.getTenNhomSP());
				bean.setMaNhaCungCap(nhomsanpham.getNhacungcap().getMaNhaCungCap());
				beans.add(bean);
			}
		}
		return beans;
	}

	private NhomSanPhamBean prepareNhomSanPhamBean(NhomSanPham nhomsanpham) {
		NhomSanPhamBean bean = new NhomSanPhamBean();
		bean.setId(nhomsanpham.getId());
		bean.setTenNhomSP(nhomsanpham.getTenNhomSP());
		bean.setMaNhaCungCap(nhomsanpham.getNhacungcap().getMaNhaCungCap());
		return bean;
	}
}
