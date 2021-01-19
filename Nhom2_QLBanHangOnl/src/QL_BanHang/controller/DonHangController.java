package QL_BanHang.controller;

import java.security.Principal;
import java.sql.Date;
import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import QL_BanHang.bean.ChiTietDonHangBean;
import QL_BanHang.bean.DonHangBean;
import QL_BanHang.bean.KhachHangBean;
import QL_BanHang.bean.NhanVienBean;
import QL_BanHang.bean.SanPhamBean;
import QL_BanHang.model.Cart;
import QL_BanHang.model.DonHang;
import QL_BanHang.model.DonHangChiTiet;
import QL_BanHang.model.KhachHang;
import QL_BanHang.model.NhanVien;
import QL_BanHang.model.SanPham;
import QL_BanHang.service.DonHangService;
import QL_BanHang.service.KhachHangService;
import QL_BanHang.service.NhanVienService;
import QL_BanHang.service.SanPhamService;

@Controller
public class DonHangController {
	@Autowired
	private DonHangService donhangService;
	@Autowired
	private NhanVienService nhanvienService;
	@Autowired
	private KhachHangService khachhangService;
	@Autowired
	private SanPhamService sanphamService;

	@RequestMapping(value = "home/duyetdonhang", method = RequestMethod.POST)
	public ModelAndView saveDonHang(@ModelAttribute("command") DonHangBean donhangBean, BindingResult result) {
		DonHang donhang = prepareModel(donhangBean);
		donhangService.DuyetDonHang(donhang);
		return new ModelAndView("redirect:/home/order.do");
	}

	@RequestMapping(value = "home/huydonhang", method = RequestMethod.GET)
	public ModelAndView huyDonHang(@ModelAttribute("command") DonHangBean donhangBean, BindingResult result) {
		DonHang donhang = donhangService.getDonHang(donhangBean.getMaDonHang());
		donhangService.HuyDonHang(donhang.getMaDonHang());
		return new ModelAndView("redirect:/home/order.do");
	}

	@RequestMapping(value = "home/completedonhang", method = RequestMethod.GET)
	public ModelAndView completeDonHang(@ModelAttribute("command") DonHangBean donhangBean, BindingResult result) {
		DonHang donhang = donhangService.getDonHang(donhangBean.getMaDonHang());
		donhangService.completeDonHang(donhang.getMaDonHang());
		return new ModelAndView("redirect:/home/order.do");
	}

	@RequestMapping(value = "home/order", method = RequestMethod.GET)
	public ModelAndView listDonHang() {
		Map<String, Object> model = new HashMap<String, Object>();
		model.put("donhangList", prepareListofBean(donhangService.listDonHang()));
		return new ModelAndView("home/OrderList", model);
	}

	@RequestMapping(value = "home/detailorder", method = RequestMethod.GET)
	public ModelAndView editDonHang(@ModelAttribute("command") DonHangBean donhangBean, BindingResult result) {
		Map<String, Object> model = new HashMap<String, Object>();
		model.put("donhang", prepareDonHangBean(donhangService.getDonHang(donhangBean.getMaDonHang())));
		model.put("donhangList", prepareListofBean1(donhangService.listDonHangChiTiet(donhangBean.getMaDonHang())));
		model.put("nhanvienList", nhanvienService.listNhanVien());
		return new ModelAndView("home/DetailOrder", model);
	}

	// Chức năng in hóa đơn
	@RequestMapping(value = "home/print", method = RequestMethod.GET)
	public ModelAndView print(@ModelAttribute("command") DonHangBean donhangBean, BindingResult result) {
		Map<String, Object> model = new HashMap<String, Object>();
		DonHang donhang = donhangService.getDonHang(donhangBean.getMaDonHang());
		model.put("DonHang", donhang);
		model.put("listDonhangchitiet", donhangService.listDonHangChiTiet(donhangBean.getMaDonHang()));
		return new ModelAndView("pdfView", model);
	}

	// Chức năng in hóa đơn
	// Nhân viên tạo hóa đơn bán hàng
	@RequestMapping(value = "home/createorder", method = RequestMethod.GET)
	public ModelAndView taoDonHang(@ModelAttribute("command") KhachHangBean khachHangBean, BindingResult result) {
		Map<String, Object> model = new HashMap<String, Object>();
		model.put("sanphamList", prepareListofBeanSP(sanphamService.listSanPham()));
		return new ModelAndView("home/CreateOrder", model);
	}

	@RequestMapping(value = "home/addtoorder/{maSP}", method = RequestMethod.GET)
	public String AddProductToOrder(ModelMap mm, HttpSession session, @PathVariable("maSP") String maSP) {
		HashMap<String, Cart> orderItems = (HashMap<String, Cart>) session.getAttribute("orderItems");
		DecimalFormat formatter = new DecimalFormat("###,###,###");
		if (orderItems == null) {
			orderItems = new HashMap<>();
		}
		SanPham sanpham = sanphamService.getSanPham(maSP);

		if (orderItems.containsKey(maSP)) {
			Cart item = orderItems.get(maSP);
			item.setSanpham(sanpham);
			item.setGiaSPFormat(sanpham.getGiaSP());
			item.setSoluong(item.getSoluong() + 1);
			item.setThanhTienFormat(sanpham.getGiaSP(), item.getSoluong());
			orderItems.put(maSP, item);
		} else {
			Cart item = new Cart();
			item.setSanpham(sanpham);
			item.setGiaSPFormat(sanpham.getGiaSP());
			item.setThanhTienFormat(sanpham.getGiaSP(), 1);
			item.setSoluong(1);
			orderItems.put(maSP, item);
		}
		session.setAttribute("orderItems", orderItems);
		session.setAttribute("orderTotal", totalPrice(orderItems));
		session.setAttribute("orderTotalFormat", formatter.format(totalPrice(orderItems)));
		session.setAttribute("orderNum", orderItems.size());
		return "redirect:/home/createorder.do";
	}

	// remove
	@RequestMapping(value = "home/remove/{maSP}", method = RequestMethod.GET)
	public String removeProductInOrder(ModelMap mm, HttpSession session, @PathVariable("maSP") String maSP) {
		HashMap<String, Cart> orderItems = (HashMap<String, Cart>) session.getAttribute("orderItems");
		DecimalFormat formatter = new DecimalFormat("###,###,###");
		if (orderItems == null) {
			orderItems = new HashMap<>();
		}
		if (orderItems.containsKey(maSP)) {
			orderItems.remove(maSP);
		}
		session.setAttribute("orderItems", orderItems);
		session.setAttribute("orderTotal", totalPrice(orderItems));
		session.setAttribute("orderTotalFormat", formatter.format(totalPrice(orderItems)));
		session.setAttribute("orderNum", orderItems.size());
		return "redirect:/home/createorder.do";
	}

	// Sub
	@RequestMapping(value = "home/sub/{maSP}", method = RequestMethod.GET)
	public String subProductInOrder(ModelMap mm, HttpSession session, @PathVariable("maSP") String maSP) {
		HashMap<String, Cart> orderItems = (HashMap<String, Cart>) session.getAttribute("orderItems");
		DecimalFormat formatter = new DecimalFormat("###,###,###");
		if (orderItems == null) {
			orderItems = new HashMap<>();
		}
		if (orderItems.containsKey(maSP)) {
			SanPham sanpham = sanphamService.getSanPham(maSP);
			Cart item = orderItems.get(maSP);

			if (item.getSoluong() > 1) {
				item.setSoluong(item.getSoluong() - 1);
				item.setSanpham(sanpham);
				item.setGiaSPFormat(sanpham.getGiaSP());
				item.setThanhTienFormat(sanpham.getGiaSP(), item.getSoluong());
				orderItems.put(maSP, item);
			} else {
				orderItems.remove(maSP);
			}

		}
		session.setAttribute("orderItems", orderItems);
		session.setAttribute("orderTotal", totalPrice(orderItems));
		session.setAttribute("orderTotalFormat", formatter.format(totalPrice(orderItems)));
		session.setAttribute("orderNum", orderItems.size());
		return "redirect:/home/createorder.do";
	}

	// Increas
	@RequestMapping(value = "home/increas/{maSP}", method = RequestMethod.GET)
	public String increasProductInOrder(ModelMap mm, HttpSession session, @PathVariable("maSP") String maSP) {
		HashMap<String, Cart> orderItems = (HashMap<String, Cart>) session.getAttribute("orderItems");
		DecimalFormat formatter = new DecimalFormat("###,###,###");
		if (orderItems == null) {
			orderItems = new HashMap<>();
		}
		if (orderItems.containsKey(maSP)) {
			SanPham sanpham = sanphamService.getSanPham(maSP);
			Cart item = orderItems.get(maSP);
			item.setSanpham(sanpham);
			item.setGiaSPFormat(sanpham.getGiaSP());
			item.setSoluong(item.getSoluong() + 1);
			item.setThanhTienFormat(sanpham.getGiaSP(), item.getSoluong());
			orderItems.put(maSP, item);
		}
		session.setAttribute("orderItems", orderItems);
		session.setAttribute("orderTotal", totalPrice(orderItems));
		session.setAttribute("orderTotalFormat", formatter.format(totalPrice(orderItems)));
		session.setAttribute("orderNum", orderItems.size());
		return "redirect:/home/createorder.do";
	}

	private float totalPrice(HashMap<String, Cart> orderItems) {
		int count = 0;
		for (Map.Entry<String, Cart> list : orderItems.entrySet()) {
			count += list.getValue().getSanpham().getGiaSP() * list.getValue().getSoluong();
		}
		return count;
	}

	// Nút hoàn tất đơn hàng
	@RequestMapping(value = "home/saveorder", method = RequestMethod.POST)
	public String saveOrder(ModelMap mm, HttpSession session,
			@ModelAttribute("khachhangcheckout") KhachHangBean khachhangBean, DonHang donhang, Principal principal) {
		HashMap<String, Cart> orderItems = (HashMap<String, Cart>) session.getAttribute("orderItems");

		if (khachhangBean.getHoTenKH().isEmpty() == false) {
			if (khachhangBean.getSDT().isEmpty() == false) {
				if (orderItems.isEmpty() == false) {
					KhachHang khachhang = prepareModelKhachHang(khachhangBean);
					NhanVien nhanvien = nhanvienService.getNhanVien(principal.getName());
					khachhangService.addKhachHang(khachhang);
					String madh = donhangService.autoGenrate();
					if (orderItems == null) {
						orderItems = new HashMap<>();
					}
					long millis = System.currentTimeMillis();
					Date date = new Date(millis);
					donhang.setMaDonHang(madh); // Làm 1 hàm tự động tạo mã đơn hàng
					donhang.setKhachhang(khachhang);
					donhang.setNhanvien(nhanvien);
					donhang.setNgayDat(date);
					donhang.setTrangThai(3);
					donhang.setTongTien(totalPrice(orderItems)); // Lấy dữ liệu tổng tiền trên session
					donhangService.addDonHang(donhang);
					for (Map.Entry<String, Cart> entry : orderItems.entrySet()) {
						DonHangChiTiet donhangchitiet = new DonHangChiTiet();
						donhangchitiet.setDonhang(donhang);
						donhangchitiet.setSanpham(entry.getValue().getSanpham());
						donhangchitiet.setSoLuong(entry.getValue().getSoluong());
						donhangService.createdonhangchitiet(donhangchitiet); // Tạo don hang chi tiet
					}
					orderItems = new HashMap<>();
					session.setAttribute("orderItems", orderItems);
					session.setAttribute("orderTotal", 0);
					session.setAttribute("orderNum", 0);

					return ("redirect:/home/detailorder.do?MaDonHang=" + madh);

				} else {
					mm.addAttribute("msg", "Chưa chọn sản phẩm");
					return "redirect:/home/createorder.do";
				}

			} else {
				mm.addAttribute("msg", "Chưa nhập SDT");
				return "redirect:/home/createorder.do";
			}

		} else {
			mm.addAttribute("msg", "Chưa nhập tên KH");
			return "redirect:/home/createorder.do";
		}

	}

	// Nhân viên tạo hóa đơn bán hàng

	private DonHang prepareModel(DonHangBean donhangBean) {
		DonHang donhang = new DonHang();
		donhang.setMaDonHang(donhangBean.getMaDonHang());
		donhang.setNhanvien(nhanvienService.getNhanVien(donhangBean.getMaNhanVienDuyetDon()));
		donhang.setNgayDat(donhangBean.getNgayDat());
		donhang.setTongTien(donhangBean.getTongTien());
		donhang.setTrangThai(donhangBean.getTrangThai());
		donhangBean.setMaDonHang(null);
		return donhang;
	}

	private List<DonHangBean> prepareListofBean(List<DonHang> donhangList) {
		List<DonHangBean> beans = null;
		if (donhangList != null && !donhangList.isEmpty()) {
			beans = new ArrayList<DonHangBean>();
			DonHangBean bean = null;
			for (DonHang donhang : donhangList) {
				bean = new DonHangBean();
				bean.setMaDonHang(donhang.getMaDonHang());
				try {
					bean.setMaNhanVien(donhang.getNhanvien().getMaNhanVien());
				} catch (Exception e) {
					bean.setMaNhanVien("chưa được duyệt");
				}

				bean.setMaKH(donhang.getKhachhang().getMaKH());
				bean.setNgayDat(donhang.getNgayDat());
				DecimalFormat formatter = new DecimalFormat("###,###,###");
				bean.setTongTienString(formatter.format(donhang.getTongTien()));
				bean.setTrangThai(donhang.getTrangThai());
				bean.setDiaChi(donhang.getKhachhang().getDiaChi());
				bean.setTrangThaiString(donhang.getTrangThai());
				beans.add(bean);

			}
		}
		return beans;
	}

	private DonHangBean prepareDonHangBean(DonHang donhang) {
		DonHangBean bean = new DonHangBean();
		bean.setMaDonHang(donhang.getMaDonHang());
		try {
			bean.setMaNhanVien(donhang.getNhanvien().getMaNhanVien());
		} catch (Exception e) {
			bean.setMaNhanVien("");
		}
		bean.setMaKH(donhang.getKhachhang().getMaKH());
		bean.setNgayDat(donhang.getNgayDat());
		bean.setTongTien(donhang.getTongTien());
		bean.setTrangThai(donhang.getTrangThai());
		bean.setTrangThaiString(donhang.getTrangThai());
		bean.setDiaChi(donhang.getKhachhang().getDiaChi());
		DecimalFormat formatter = new DecimalFormat("###,###,###");
		bean.setTongTienString(formatter.format(donhang.getTongTien()));
		return bean;
	}

	private List<ChiTietDonHangBean> prepareListofBean1(List<DonHangChiTiet> list) {
		List<ChiTietDonHangBean> beans = null;
		if (list != null && !list.isEmpty()) {
			beans = new ArrayList<ChiTietDonHangBean>();
			ChiTietDonHangBean bean = null;

			for (DonHangChiTiet donhang : list) {

				bean = new ChiTietDonHangBean();
				bean.setId(donhang.getId());
				bean.setTenSanPham(donhang.getSanpham().getTenSP());
				bean.setSoLuong(donhang.getSoLuong());
				DecimalFormat formatter = new DecimalFormat("###,###,###");
				bean.setDonGia(formatter.format(donhang.getSanpham().getGiaSP()).toString());
				bean.setTongTien(formatter.format(donhang.getSanpham().getGiaSP() * donhang.getSoLuong()));
				beans.add(bean);
			}
		}
		return beans;
	}

	// Danh sach san pham
	private List<SanPhamBean> prepareListofBeanSP(List<SanPham> sanphamList) {
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
				bean.setGiaFormat(sanpham.getGiaSP());
				bean.setTenNhomSP(sanpham.getNhomsanpham().getTenNhomSP());
				bean.setMaNhaCungCap(sanpham.getNhacungcap().getMaNhaCungCap());
				bean.setId_NhomSP(sanpham.getNhomsanpham().getId());
				bean.setEnableString(sanpham.getEnable());
				beans.add(bean);
			}
		}
		return beans;
	}

	// du lieu khach hang luu
	private KhachHang prepareModelKhachHang(KhachHangBean khachhangBean) {
		KhachHang khachhang = new KhachHang();
		String makh = null;
		makh = khachhangService.genratemaKH();
		khachhang.setMaKH(makh);
		khachhang.setHoTenKH(khachhangBean.getHoTenKH());
		khachhang.setMatKhau("123");
		khachhang.setSDT(khachhangBean.getSDT());
		khachhang.setEmail("bantaicuahang");
		khachhang.setDiaChi("bantaicuahang");
		khachhangBean.setMaKH(null);
		return khachhang;
	}

	// TRi
	@RequestMapping(value = "pages/orderkh", method = RequestMethod.GET)
	public ModelAndView listDonHangBy(HttpSession session) {
		Map<String, Object> model = new HashMap<String, Object>();
		String makh = (String) session.getAttribute("makhachhang");
		System.out.println(makh);
		model.put("donhangkhList", prepareListofBean(donhangService.listDonHangByMaKhachHang(makh)));
		return new ModelAndView("pages/OrderListKh", model);
	}

}
