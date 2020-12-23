package QL_BanHang.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import QL_BanHang.bean.SanPhamBean;
import QL_BanHang.model.Cart;
import QL_BanHang.model.SanPham;
import QL_BanHang.service.DonHangService;
import QL_BanHang.service.NhaCungCapService;
import QL_BanHang.service.NhomSanPhamService;
import QL_BanHang.service.SanPhamService;

@Controller
@RequestMapping(value = "cart")
public class CartController {
	@Autowired
	private SanPhamService sanphamService;
	@Autowired
	private DonHangService donhangService;
	@Autowired
	private NhomSanPhamService nhomsanphamService;
//nga test
	@RequestMapping(value = "cart/{maSP}",method = RequestMethod.GET)
	public String chitietSanPham(ModelMap mm, @PathVariable("maSP")String MaSP) {
		mm.put("sanpham", sanphamService.getSanPham(MaSP));
		System.out.println("tesst1");
		return "pages/cart";
	}
	/*@RequestMapping( value = "cart/addsp")
	public String addCart(ModelMap mm, HttpSession session, @PathVariable("maSP")String maSP) {
		HashMap<String, Cart> cartItems = (HashMap<String, Cart>) session.getAttribute("myCartItems");
		if (cartItems == null) {
            cartItems = new HashMap<>();
        }
		SanPham sanpham = sanphamService.getSanPham(maSP);
		
			if(cartItems.containsKey(maSP)) {
				Cart sanpham1 = cartItems.get(maSP);
				sanpham1.setSanpham(sanpham);
				sanpham1.setSoluong(sanpham1.getSoluong() + 1);
				cartItems.put("hjn", sanpham1);
			}
		
		session.setAttribute("myCartItems",cartItems);
		session.setAttribute("myCartTotal", totalPrice(cartItems));
		session.setAttribute("myCartNum", cartItems.size());
	System.out.print("dut");
        return "pages/cart";
	}
	private Object totalPrice(HashMap<String, Cart> cartItems) {
		int count = 0;
        for (Map.Entry<String, Cart> list : cartItems.entrySet()) {
            count += list.getValue().getSanpham().getGiaSP()* list.getValue().getSoluong();
        }
        return count;
	}*/
	
	

	


}
