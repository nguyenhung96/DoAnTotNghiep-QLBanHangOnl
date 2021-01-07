package ITextPdf;

import java.text.DecimalFormat;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.itextpdf.text.BaseColor;
import com.itextpdf.text.Document;
import com.itextpdf.text.Font;
import com.itextpdf.text.FontFactory;
import com.itextpdf.text.Paragraph;
import com.itextpdf.text.Phrase;
import com.itextpdf.text.pdf.PdfPCell;
import com.itextpdf.text.pdf.PdfPTable;
import com.itextpdf.text.pdf.PdfWriter;

import QL_BanHang.bean.ChiTietDonHangBean;
import QL_BanHang.model.DonHang;
import QL_BanHang.model.DonHangChiTiet;

/**
 * This view class generates a PDF document 'on the fly' based on the data
 * contained in the model.
 * 
 * @author www.codejava.net
 *
 */
public class PDFBuilder extends AbstractITextPdfView {

	@Override
	protected void buildPdfDocument(Map<String, Object> model, Document doc, PdfWriter writer,
			HttpServletRequest request, HttpServletResponse response) throws Exception {
		// get data model which is passed by the Spring container
		List<DonHangChiTiet> listDonHangChiTiet = (List<DonHangChiTiet>) model.get("listDonhangchitiet");
		DonHang donhang = (DonHang) model.get("DonHang");
		DecimalFormat formatter = new DecimalFormat("###,###,###");
		doc.add(new Paragraph("NHOM   DO   AN                                HOA DON BAN HANG"));
		doc.add(new Paragraph("Ngay Dat: " + donhang.getNgayDat() + "                           Ma Don: " + donhang.getMaDonHang()));
		doc.add(new Paragraph("Khach hang: "+donhang.getKhachhang().getHoTenKH()));
		doc.add(new Paragraph("Dia chi: "+donhang.getKhachhang().getDiaChi()));
		
		PdfPTable table = new PdfPTable(4);
		table.setWidthPercentage(100.0f);
		table.setWidths(new float[] { 4.0f, 1.0f, 2.0f, 2.0f });
		table.setSpacingBefore(10);

		// define font for table header row
		Font font = FontFactory.getFont(FontFactory.HELVETICA);
		font.setColor(BaseColor.WHITE);
		// define table header cell
		PdfPCell cell = new PdfPCell();
		cell.setBackgroundColor(BaseColor.DARK_GRAY);
		cell.setPadding(5);
		// write table header
		cell.setPhrase(new Phrase("TenSanPham", font));
		table.addCell(cell);

		cell.setPhrase(new Phrase("SL", font ));
		table.addCell(cell);

		cell.setPhrase(new Phrase("DonGia", font));
		table.addCell(cell);

		cell.setPhrase(new Phrase("ThanhTien", font));
		table.addCell(cell);
		// write table row data
		for (DonHangChiTiet donhangchitiet : listDonHangChiTiet) {
			table.addCell(donhangchitiet.getSanpham().getTenSP());
			table.addCell(String.valueOf(donhangchitiet.getSoLuong()));
			table.addCell(formatter.format(donhangchitiet.getSanpham().getGiaSP()));
			table.addCell(formatter.format(donhangchitiet.getSanpham().getGiaSP() * donhangchitiet.getSoLuong()));
		}
		doc.add(table);
		doc.add(new Paragraph("TongTien: " + formatter.format(donhang.getTongTien())+"                              Nhan vien ban hang"));
		doc.add(new Paragraph(" "));
		doc.add(new Paragraph("                                                                   "+donhang.getNhanvien().getHoTenNV()));
	}

}