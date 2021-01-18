package QL_BanHang.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import QL_BanHang.bean.NhomSanPhamBean;
import QL_BanHang.model.NhaCungCap;
import QL_BanHang.model.NhomSanPham;
import QL_BanHang.service.NhaCungCapService;
import QL_BanHang.service.NhomSanPhamService;

@Controller
public class NhomSanPhamController {
	@Autowired
	private NhomSanPhamService nhomsanphamService;
	@Autowired
	private NhaCungCapService nhacungcapService;

	@RequestMapping(value = "home.html", method = RequestMethod.GET)
	public String viewHome(ModelMap mm) {
		mm.put("listNhomSanPham", nhomsanphamService.listNhomSanPham());
		return "pages/index";
	}

	@RequestMapping(value = "home/saveproducttype", method = RequestMethod.POST)
	public ModelAndView saveNhomSanPham(@ModelAttribute("command") NhomSanPhamBean nhomsanphamBean,
			BindingResult result, Model model) {
		Map<String, Object> models = new HashMap<String, Object>();
		NhomSanPham nhomsanpham = prepareModel(nhomsanphamBean);
		List<Integer> maNSPs = nhomsanphamService.getMaNSP();
		for(int maNSP : maNSPs) {
			if(nhomsanphamBean.getId() == maNSP){					
				model.addAttribute("messenge", "Loại sản phẩm đã có sản phẩm. Bạn không thể thay đổi thông tin!");
				models.put("nhomsanpham", prepareNhomSanPhamBean(nhomsanphamService.getNhomSanPham(nhomsanphamBean.getId())));
				models.put("nhomsanphamList", prepareListofBean(nhomsanphamService.listNhomSanPham()));
				models.put("nhacungcapList", nhacungcapService.listNhaCungCap());
				System.out.println(nhomsanphamBean.getId() );
				return new ModelAndView("home/CreateProductType", models);
			}
		}
		nhomsanphamService.addNhomSanPham(nhomsanpham);
		return new ModelAndView("redirect:/home/producttype.do");
	}

	@RequestMapping(value = "home/producttype", method = RequestMethod.GET)
	public ModelAndView listNhomSanPham() {
		Map<String, Object> models = new HashMap<String, Object>();
		models.put("nhomsanphamList", prepareListofBean(nhomsanphamService.listNhomSanPham()));
		
		return new ModelAndView("home/ProductType", models);
	}

	@RequestMapping(value = "home/createproducttype", method = RequestMethod.GET)
	public ModelAndView addNhomSanPham(@ModelAttribute("command") NhomSanPhamBean nhomsanphamBean,
			BindingResult result, Model model) {
		Map<String, Object> models = new HashMap<String, Object>();		
		models.put("nhomsanphamList", prepareListofBean(nhomsanphamService.listNhomSanPham()));
		models.put("nhacungcapList", nhacungcapService.listNhaCungCap());
		model.addAttribute("messenge", "Thông tin loại sản phẩm");
		return new ModelAndView("home/CreateProductType", models);
	}

	@RequestMapping(value = "home/deleteproducttype", method = RequestMethod.GET)
	public ModelAndView deleteNhomSanPham(@ModelAttribute("command") NhomSanPhamBean nhomsanphamBean,
			BindingResult result, Model model) {
		List<Integer> maNSPs = nhomsanphamService.getMaNSP();	
		boolean stt= false;
		for(int maNSP : maNSPs) {
			if(nhomsanphamBean.getId() == maNSP){					
				stt=true;
				break;
			}
		}
		System.out.println(stt);
		if(stt) {
			model.addAttribute("messenge", "Loại sản phẩm đã có sản phẩm. Bạn không thể xóa!");
		}else {
			nhomsanphamService.deleteNhomSanPham1(nhomsanphamBean.getId());		
		}		
		Map<String, Object> models = new HashMap<String, Object>();
		models.put("nhomsanpham", null);
		models.put("nhomsanphamList", prepareListofBean(nhomsanphamService.listNhomSanPham()));
		return new ModelAndView("home/ProductType",models);
	}

	@RequestMapping(value = "home/editproducttype", method = RequestMethod.GET)
	public ModelAndView editNhomSanPham(@ModelAttribute("command") NhomSanPhamBean nhomsanphamBean,
			BindingResult result, Model model) {
		Map<String, Object> models = new HashMap<String, Object>();		
		List<Integer> maNSPs = nhomsanphamService.getMaNSP();
		System.out.println(maNSPs);
		models.put("nhomsanpham", prepareNhomSanPhamBean(nhomsanphamService.getNhomSanPham(nhomsanphamBean.getId())));
		models.put("nhomsanphamList", prepareListofBean(nhomsanphamService.listNhomSanPham()));
		models.put("nhacungcapList", nhacungcapService.listNhaCungCap());
		model.addAttribute("messenge", "Thông tin loại sản phẩm");
		return new ModelAndView("home/CreateProductType", models);
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
