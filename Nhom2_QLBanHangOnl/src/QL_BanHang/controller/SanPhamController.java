package QL_BanHang.controller;

import java.io.File;
import java.io.InputStream;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.jasper.tagplugins.jstl.core.If;
import org.apache.taglibs.standard.lang.jstl.test.beans.PublicBean1;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import QL_BanHang.bean.SanPhamBean;
import QL_BanHang.model.SanPham;
import QL_BanHang.service.NhaCungCapService;
import QL_BanHang.service.NhomSanPhamService;
import QL_BanHang.service.SanPhamService;

@Controller
public class SanPhamController {

	@Autowired
	private SanPhamService sanphamService;
	@Autowired
	private NhaCungCapService nhacungcapService;
	@Autowired
	private NhomSanPhamService nhomsanphamService;

	@RequestMapping(value = "home/savesanpham", method = RequestMethod.POST)
	public ModelAndView saveSanPham(@ModelAttribute("command") SanPhamBean sanphamBean, BindingResult result) {
		SanPham sanpham = prepareModel(sanphamBean);
		sanphamService.addSanPham(sanpham);
		return new ModelAndView("redirect:/home/sanpham.do");
	}

	@RequestMapping(value = "home/updateimage", method = RequestMethod.POST)
	public ModelAndView UpdateImage(@ModelAttribute("command") SanPhamBean sanphamBean, BindingResult result,
			HttpServletRequest request) {
		SanPham sanpham = prepareModel1(sanphamBean);
		try {
			String location = request.getServletContext().getRealPath("productImg");
			System.out.println(location);
			MultipartFile multipartFile = sanphamBean.getMultipartFile();
			String fileName = multipartFile.getOriginalFilename();
			File file = new File(location, fileName);
			multipartFile.transferTo(file);
			sanphamService.updateImage(sanpham, fileName);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return new ModelAndView("redirect:/home/sanpham.do");
	}

	@RequestMapping(value = "home/sanpham", method = RequestMethod.GET)
	public ModelAndView listSanPham() {
		Map<String, Object> model = new HashMap<String, Object>();
		model.put("sanphamList", prepareListofBean(sanphamService.listSanPham()));

		return new ModelAndView("home/Product", model);
	}

	@RequestMapping(value = "home/createproduct", method = RequestMethod.GET)
	public ModelAndView addSanPham(@ModelAttribute("command") SanPhamBean sanphamBean, BindingResult result) {
		Map<String, Object> model = new HashMap<String, Object>();
		model.put("sanphamList", prepareListofBean(sanphamService.listSanPham()));
		model.put("nhacungcapList", nhacungcapService.listNhaCungCap());
		model.put("nhomsanphamList", nhomsanphamService.listNhomSanPham());
		return new ModelAndView("home/CreateProduct", model);
	}

	@RequestMapping(value = "home/deletesanpham", method = RequestMethod.GET)
	public ModelAndView deleteSanPham(@ModelAttribute("command") SanPhamBean sanphamBean, BindingResult result) {
		sanphamService.deleteSanPham1(sanphamBean.getMaSP());
		Map<String, Object> model = new HashMap<String, Object>();
		model.put("sanpham", null);
		model.put("sanphamList", prepareListofBean(sanphamService.listSanPham()));
		return new ModelAndView("redirect:/home/sanpham.do");
	}

	@RequestMapping(value = "home/editsanpham", method = RequestMethod.GET)
	public ModelAndView editSanPham(@ModelAttribute("command") SanPhamBean sanphamBean, BindingResult result,
			HttpServletRequest request) {
		Map<String, Object> model = new HashMap<String, Object>();
		model.put("sanpham", prepareSanPhamBean(sanphamService.getSanPham(sanphamBean.getMaSP())));
		String location = request.getServletContext().getRealPath("/WEB-INF/productImg/");
		model.put("locationfolder", location);
		model.put("nhacungcapList", nhacungcapService.listNhaCungCap());
		model.put("nhomsanphamList", nhomsanphamService.listNhomSanPham());
		return new ModelAndView("home/CreateProduct", model);
	}

	@RequestMapping(value = "home/imageproduct", method = RequestMethod.GET)
	public ModelAndView themanh(@ModelAttribute("command") SanPhamBean sanphamBean, BindingResult result) {
		Map<String, Object> model = new HashMap<String, Object>();
		model.put("sanpham", prepareSanPhamBean(sanphamService.getSanPham(sanphamBean.getMaSP())));
		model.put("sanphamList", prepareListofBean(sanphamService.listSanPham()));
		return new ModelAndView("home/AddImageProduct", model);
	}

	private SanPham prepareModel(SanPhamBean sanphamBean) {
		SanPham sanpham = new SanPham();
		String masp = null;
		if (sanphamBean.getMaSP().isEmpty()) {
			masp = sanphamService.autoGenrate();
		} else {
			masp = sanphamBean.getMaSP();
		}
		sanpham.setMaSP(masp);
		sanpham.setTenSP(sanphamBean.getTenSP());
		sanpham.setThongTinSP(sanphamBean.getThongTinSP());
		sanpham.setHinh(sanpham.getHinh()); 
		sanpham.setGiaSP(sanphamBean.getGiaSP());
		sanpham.setNhomsanpham(nhomsanphamService.getNhomSanPham(sanphamBean.getId_NhomSP()));
		sanpham.setNhacungcap(nhacungcapService.getNhaCungCap(sanphamBean.getMaNhaCungCap()));
		sanpham.setEnable(sanphamBean.getEnable());
		sanphamBean.setMaSP(null);
		return sanpham;
	}
	
	private SanPham prepareModel2(SanPhamBean sanphamBean) {
		SanPham sanpham = new SanPham();
		sanpham.setMaSP(sanphamBean.getMaSP());
		sanphamBean.setMaSP(null);
		return sanpham;
	}

	private List<SanPhamBean> prepareListofBean(List<SanPham> sanphamList) {
		List<SanPhamBean> beans = null;
		if (sanphamList != null && !sanphamList.isEmpty()) {
			beans = new ArrayList<SanPhamBean>();
			SanPhamBean bean = null;
			for (SanPham sanpham : sanphamList) {
				bean = new SanPhamBean();
				bean.setMaSP(sanpham.getMaSP());
				bean.setTenSP(sanpham.getTenSP());
				bean.setThongTinSP(sanpham.getThongTinSP());
				bean.setHinh(sanpham.getHinh());
				bean.setGiaSP(sanpham.getGiaSP());
				bean.setTenNhomSP(sanpham.getNhomsanpham().getTenNhomSP());
				bean.setMaNhaCungCap(sanpham.getNhacungcap().getMaNhaCungCap());
				bean.setId_NhomSP(sanpham.getNhomsanpham().getId());
				bean.setEnableString(sanpham.getEnable());
				beans.add(bean);
			}
		}
		return beans;
	}

	private SanPhamBean prepareSanPhamBean(SanPham sanpham) {
		SanPhamBean bean = new SanPhamBean();
		bean = new SanPhamBean();
		bean.setMaSP(sanpham.getMaSP());
		bean.setTenSP(sanpham.getTenSP());
		bean.setThongTinSP(sanpham.getThongTinSP());
		bean.setHinh(sanpham.getHinh());
		bean.setGiaSP(sanpham.getGiaSP());
		bean.setTenNhomSP(sanpham.getNhomsanpham().getTenNhomSP());
		bean.setMaNhaCungCap(sanpham.getNhacungcap().getMaNhaCungCap());
		bean.setId_NhomSP(sanpham.getNhomsanpham().getId());
		bean.setEnable(sanpham.getEnable());
		bean.setEnableString(sanpham.getEnable());
		return bean;
	}

	private SanPham prepareModel1(SanPhamBean sanphamBean) {
		SanPham sanpham = new SanPham();
		sanpham.setMaSP(sanphamBean.getMaSP());
		sanpham.setHinh(sanphamBean.getHinh());
		return sanpham;
	}
}
