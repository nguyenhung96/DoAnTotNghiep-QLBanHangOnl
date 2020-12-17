package QL_BanHang.model;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name = "QuyenNV")
public class QuyenNV implements Serializable {
	@Id
	private int Id;

	@Column(name = "QuyenNV")
	private String QuyenNV;

	@ManyToOne
	@JoinColumn(name = "MaNhanVien")
	private NhanVien nhanVien;

	public int getId() {
		return Id;
	}

	public void setId(int id) {
		Id = id;
	}

	public String getQuyenNV() {
		return QuyenNV;
	}

	public void setQuyenNV(String quyenNV) {
		QuyenNV = quyenNV;
	}

	public NhanVien getNhanVien() {
		return nhanVien;
	}

	public void setNhanVien(NhanVien nhanVien) {
		this.nhanVien = nhanVien;
	}

}
