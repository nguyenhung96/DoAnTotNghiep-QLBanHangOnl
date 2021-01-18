package QL_BanHang.controller;

import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import QL_BanHang.bean.SanPhamBean;
import QL_BanHang.model.SanPham;


@Controller
public class userRouteController {
	
	@RequestMapping(value = "/goto", method = RequestMethod.GET)
	public String Route(@RequestParam("query") String pageQuery) {
		System.out.println("call user get");
		System.out.println(123123123);
		String page = "";
		
		if(pageQuery.equalsIgnoreCase("gioithieu")) {
			System.out.println("go to gioi thieu");
			return "pages/blog";
		}
		
		if(pageQuery.equalsIgnoreCase("khuyenmai")) {
			System.out.println("go to khuyen mai");
			return "pages/shop";
		}
		
		if(pageQuery.equalsIgnoreCase("tintuc")) {
			System.out.println("go to tin tuc");
			return "pages/new";
		}
		
		if(pageQuery.equalsIgnoreCase("dangnhap")) {
			System.out.println("go to dang nhap");
			return "pages/dangnhap";
		}
		
		if(pageQuery.equalsIgnoreCase("dangky")) {
			System.out.println("go to dang ky");
			return "pages/dangky";
		}
		
		if(pageQuery.equalsIgnoreCase("donhang")) {
			System.out.println("go to don hang");
			return "pages/checkout";
		}
		

		if(pageQuery.equalsIgnoreCase("lienhe")) {
			System.out.println("go to lien he");

			System.out.println(pageQuery);

			System.out.println("go to lien he");

			
			return "pages/lienhe";
		};
		
		return page;
	}
	
	
	
	@RequestMapping(value = "/xxx", method = RequestMethod.GET)
	public String test11(@RequestParam("query") String pageQuery) {
		System.out.println("call test11 get");
		System.out.println(123123123);
		String page = "";
		
		
		return page;
	}

	
	

}