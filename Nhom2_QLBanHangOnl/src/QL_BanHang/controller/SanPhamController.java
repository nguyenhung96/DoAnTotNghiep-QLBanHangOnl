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

import QL_BanHang.bean.SanPhamBean;
import QL_BanHang.model.SanPham;
import QL_BanHang.service.SanPhamService;

@Controller
public class SanPhamController {

	@Autowired
	private SanPhamService sanphamService;
	
	
	@RequestMapping(value = "home/savesanpham", method = RequestMethod.POST)
	public ModelAndView saveSanPham(@ModelAttribute("command") SanPhamBean sanphamBean, 
			BindingResult result) {
		SanPham sanpham = prepareModel(sanphamBean);
		sanphamService.addSanPham(sanpham);
		return new ModelAndView("redirect:/home/sanpham.do");
	}

	@RequestMapping(value="home/sanpham", method = RequestMethod.GET)
	public ModelAndView listSanPham() {
		Map<String, Object> model = new HashMap<String, Object>();
		model.put("sanphamList",  prepareListofBean(sanphamService.listSanPham()));
		
		return new ModelAndView("home/Product", model);
	}

	@RequestMapping(value = "home/createproduct", method = RequestMethod.GET)
	public ModelAndView addSanPham(@ModelAttribute("command")  SanPhamBean sanphamBean,
			BindingResult result) {
		Map<String, Object> model = new HashMap<String, Object>();
		model.put("sanphamList",  prepareListofBean(sanphamService.listSanPham()));
		return new ModelAndView("home/CreateProduct", model);
	}
	
	@RequestMapping(value = "home/deletesanpham", method = RequestMethod.GET)
	public ModelAndView editSanPham(@ModelAttribute("command")  SanPhamBean sanphamBean,
			BindingResult result) {
		sanphamService.deleteSanPham(prepareModel(sanphamBean));
		Map<String, Object> model = new HashMap<String, Object>();
		model.put("sanpham", null);
		model.put("sanphamList",  prepareListofBean(sanphamService.listSanPham()));
		return new ModelAndView("redirect:/home/sanpham.do");
	}
	
	@RequestMapping(value = "home/editsanpham", method = RequestMethod.GET)
	public ModelAndView deleteSanPham(@ModelAttribute("command")  SanPhamBean sanphamBean,
			BindingResult result) {
		Map<String, Object> model = new HashMap<String, Object>();
		model.put("sanpham", prepareSanPhamBean(sanphamService.getSanPham(sanphamBean.getMaSP())));
		model.put("sanphamList",  prepareListofBean(sanphamService.listSanPham()));
		return new ModelAndView("home/CreateProdcut", model);
	}
	
	private SanPham prepareModel(SanPhamBean sanphamBean){
		SanPham sanpham = new SanPham();
		sanpham.setMaSP(sanphamBean.getMaSP());
		sanpham.setTenSP(sanphamBean.getTenSP());
		sanpham.setThongTinSP(sanphamBean.getThongTinSP());
		sanpham.setHinh(sanphamBean.getHinh());
		sanpham.setGiaSP(sanphamBean.getGiaSP());
		sanpham.setTenNhomSP(sanphamBean.getTenNhomSP());
		sanpham.setMaNhaCungCap(sanphamBean.getMaNhaCungCap());
		sanpham.setSoLuongSP(sanphamBean.getSoLuongSP());
		
		sanphamBean.setMaSP(null);
		return sanpham;
	}
	
	private List<SanPhamBean> prepareListofBean(List<SanPham> sanphamList){
		List<SanPhamBean> beans = null;
		if(sanphamList != null && !sanphamList.isEmpty()){
			beans = new ArrayList<SanPhamBean>();
			SanPhamBean bean = null;
			for(SanPham sanpham : sanphamList){
				bean = new SanPhamBean();
				bean.setMaSP(sanpham.getMaSP());
				bean.setTenSP(sanpham.getTenSP());
				bean.setThongTinSP(sanpham.getThongTinSP());
				bean.setHinh(sanpham.getHinh());
				bean.setGiaSP(sanpham.getGiaSP());
				bean.setTenNhomSP(sanpham.getTenNhomSP());
				bean.setMaNhaCungCap(sanpham.getMaNhaCungCap());
				bean.setSoLuongSP(sanpham.getSoLuongSP());
				beans.add(bean);
			}
		}
		return beans;
	}
	
	private SanPhamBean prepareSanPhamBean(SanPham sanpham){
		SanPhamBean bean = new SanPhamBean();
		bean = new SanPhamBean();
		bean.setMaSP(sanpham.getMaSP());
		bean.setTenSP(sanpham.getTenSP());
		bean.setThongTinSP(sanpham.getThongTinSP());
		bean.setHinh(sanpham.getHinh());
		bean.setGiaSP(sanpham.getGiaSP());
		bean.setTenNhomSP(sanpham.getTenNhomSP());
		bean.setMaNhaCungCap(sanpham.getMaNhaCungCap());
		bean.setSoLuongSP(sanpham.getSoLuongSP());
		return bean;
	}
}
