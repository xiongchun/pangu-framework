package org.g4studio.demo.common.vo;

import java.math.BigDecimal;
import java.sql.Timestamp;

import org.g4studio.core.metatype.BaseVo;

/**
 * 
 * 药品目录简单值对象
 * 
 * @author OSWorks-XC
 * @since 2011-03-15
 */
public class CatalogVO extends BaseVo {
	
	private String xmid;
	private String xmmc;
	private String xmrj;
	private String gg;
	private String dw;
	private BigDecimal zfbl;
	private String jx;
	private String cd;
	private String qybz;
	private String yybm;
	private String sfdlbm;
	private Timestamp ggsj;

	public String getXmid() {
		return xmid;
	}

	public void setXmid(String xmid) {
		this.xmid = xmid;
	}

	public String getXmmc() {
		return xmmc;
	}

	public void setXmmc(String xmmc) {
		this.xmmc = xmmc;
	}

	public String getXmrj() {
		return xmrj;
	}

	public void setXmrj(String xmrj) {
		this.xmrj = xmrj;
	}

	public String getGg() {
		return gg;
	}

	public void setGg(String gg) {
		this.gg = gg;
	}

	public String getDw() {
		return dw;
	}

	public void setDw(String dw) {
		this.dw = dw;
	}

	public BigDecimal getZfbl() {
		return zfbl;
	}

	public void setZfbl(BigDecimal zfbl) {
		this.zfbl = zfbl;
	}

	public String getJx() {
		return jx;
	}

	public void setJx(String jx) {
		this.jx = jx;
	}

	public String getCd() {
		return cd;
	}

	public void setCd(String cd) {
		this.cd = cd;
	}

	public String getQybz() {
		return qybz;
	}

	public void setQybz(String qybz) {
		this.qybz = qybz;
	}

	public String getYybm() {
		return yybm;
	}

	public void setYybm(String yybm) {
		this.yybm = yybm;
	}

	public String getSfdlbm() {
		return sfdlbm;
	}

	public void setSfdlbm(String sfdlbm) {
		this.sfdlbm = sfdlbm;
	}

	public Timestamp getGgsj() {
		return ggsj;
	}

	public void setGgsj(Timestamp ggsj) {
		this.ggsj = ggsj;
	}
}
