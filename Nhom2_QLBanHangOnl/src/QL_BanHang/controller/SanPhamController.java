package QL_BanHang.controller;

import java.io.File;
import java.io.InputStream;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.sql.Date;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.jasper.tagplugins.jstl.core.If;
import org.apache.taglibs.standard.lang.jstl.test.beans.PublicBean1;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import QL_BanHang.bean.KhachHangBean;
import QL_BanHang.bean.SanPhamBean;
import QL_BanHang.model.Cart;
import QL_BanHang.model.DonHang;
import QL_BanHang.model.DonHangChiTiet;
import QL_BanHang.model.KhachHang;
import QL_BanHang.model.SanPham;
import QL_BanHang.service.DonHangService;
import QL_BanHang.service.KhachHangService;
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
	@Autowired
	private KhachHangService khachhangService;
	@Autowired
	private DonHangService donhangService;

	// Nga
	@RequestMapping(value = "Trangchu/Sanpham", method = RequestMethod.GET)
	public ModelAndView ShowSanPham() {
		Map<String, Object> model = new HashMap<String, Object>();
		model.put("sanphamList", prepareListofBean(sanphamService.listSanPham()));
		System.out.print("nga111");
		return new ModelAndView("pages/product", model);
	}

	@RequestMapping(value = "Trangchu/index", method = RequestMethod.GET)
	public ModelAndView ShowTrangChu() {
		Map<String, Object> model = new HashMap<String, Object>();
		model.put("sanphamList", prepareListofBean(sanphamService.listSanPham()));

		return new ModelAndView("pages/index", model);
	}

	@RequestMapping(value = "pages/opencheckout", method = RequestMethod.GET)
	public ModelAndView opencheckout(ModelMap mm, HttpSession session,
			@ModelAttribute("khachhangcheckout") KhachHang khachhang) {
		HashMap<Long, Cart> cartItems = (HashMap<Long, Cart>) session.getAttribute("myCartItems");
		return new ModelAndView("pages/checkout");
	}

	@RequestMapping(value = "pages/checkout", method = RequestMethod.POST)
	public ModelAndView checkout(ModelMap mm, HttpSession session,
			@ModelAttribute("khachhangcheckout") KhachHangBean khachhangBean, DonHang donhang) {
		HashMap<String, Cart> cartItems = (HashMap<String, Cart>) session.getAttribute("myCartItems");
		// tạo khách hàng vào hóa đơn mới

		String makhString = (String) session.getAttribute("makhachhang");

		KhachHang khachHang = new KhachHang();
		if (makhString.isEmpty()) {
			khachHang = prepareModelKhachHang(khachhangBean);
			khachhangService.addKhachHang(khachHang);
		} else {
			khachHang = khachhangService.getKhachHang(makhString);
		}

		if (cartItems == null) {
			cartItems = new HashMap<>();
		}
		long millis = System.currentTimeMillis();
		Date date = new Date(millis);
		donhang.setMaDonHang(donhangService.autoGenrate()); // Làm 1 hàm tự động tạo mã đơn hàng
		donhang.setKhachhang(khachHang);

		donhang.setNgayDat(date);
		donhang.setTrangThai(1);
		donhang.setTongTien(totalPrice(cartItems)); // Lấy dữ liệu tổng tiền trên session
		donhangService.addDonHang(donhang);
		for (Map.Entry<String, Cart> entry : cartItems.entrySet()) {
			DonHangChiTiet donhangchitiet = new DonHangChiTiet();

			donhangchitiet.setDonhang(donhang);
			donhangchitiet.setSanpham(entry.getValue().getSanpham());
			donhangchitiet.setSoLuong(entry.getValue().getSoluong());
			donhangService.createdonhangchitiet(donhangchitiet); // Tạo don hang chi tiet
		}
		cartItems = new HashMap<>();
		session.setAttribute("myCartItems", cartItems);
		session.setAttribute("myCartTotal", 0);
		session.setAttribute("myCartNum", 0);

		return new ModelAndView("pages/success");
	}

	@RequestMapping(value = "pages/cart", method = RequestMethod.GET)
	public ModelAndView showGioHang(ModelMap mm, HttpSession session, String maSP) {
		HashMap<String, Cart> cartItems = (HashMap<String, Cart>) session.getAttribute("myCartItems");
		Map<String, Object> model = new HashMap<String, Object>();
		model.put("sanphamList", prepareListofBean(sanphamService.listSanPham()));

		return new ModelAndView("pages/cart", model);
	}

	// nga test 1
	@RequestMapping(value = "cart/{maSP}", method = RequestMethod.GET)
	public String test(ModelMap mm, HttpSession session, @PathVariable("maSP") String maSP) {
		HashMap<String, Cart> cartItems = (HashMap<String, Cart>) session.getAttribute("myCartItems");
		if (cartItems == null) {
			cartItems = new HashMap<>();
		}
		SanPham sanpham = sanphamService.getSanPham(maSP);

		if (cartItems.containsKey(maSP)) {
			Cart item = cartItems.get(maSP);
			item.setSanpham(sanpham);
			item.setSoluong(item.getSoluong() + 1);
			cartItems.put(maSP, item);
		} else {
			Cart item = new Cart();
			item.setSanpham(sanpham);
			item.setSoluong(1);
			cartItems.put(maSP, item);
		}

		session.setAttribute("myCartItems", cartItems);
		session.setAttribute("myCartTotal", totalPrice(cartItems));
		session.setAttribute("myCartNum", cartItems.size());
		System.out.print("dut");
		return "redirect:/pages/cart.do";
	}

	// chi tiết sản phẩm
	@RequestMapping(value = "product-details/{maSP}", method = RequestMethod.GET)
	public String chitietSanPham(ModelMap mm, @PathVariable("maSP") String MaSP) {
		mm.put("sanpham", sanphamService.getSanPham(MaSP));
		System.out.println("tesst1");
		return "pages/product-details";
	}

	private float totalPrice(HashMap<String, Cart> cartItems) {
		int count = 0;
		for (Map.Entry<String, Cart> list : cartItems.entrySet()) {
			count += list.getValue().getSanpham().getGiaSP() * list.getValue().getSoluong();
		}
		return count;
	}
	// Nga

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

	// Nga
	private KhachHang prepareModelKhachHang(KhachHangBean khachhangBean) {
		KhachHang khachhang = new KhachHang();
		String makh = null;
		if (khachhangBean.getMaKH().isEmpty()) {
			makh = khachhangService.genratemaKH();
		} else {
			makh = khachhangBean.getMaKH();
		}
		khachhang.setMaKH(makh);
		khachhang.setHoTenKH(khachhangBean.getHoTenKH());
		khachhang.setMatKhau("123");
		;
		khachhang.setSDT(khachhangBean.getSDT());
		khachhang.setEmail(khachhangBean.getEmail());
		khachhang.setDiaChi(khachhangBean.getDiaChi());
		khachhangBean.setMaKH(null);
		return khachhang;
	}
	// Nga
}
