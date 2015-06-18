package org.g4studio.core.web.report.jasper.applet;

import javax.swing.JButton;
import javax.swing.JOptionPane;

import net.sf.jasperreports.engine.JRException;
import net.sf.jasperreports.engine.JasperPrint;
import net.sf.jasperreports.view.JRViewer;

/**
 * JRViewerSimple
 * 
 * @author XiongChun
 * @since 2010-09-27
 */
public class JRViewerSimple extends JRViewer {

	protected JButton btnPlus = new javax.swing.JButton();

	public JRViewerSimple(JasperPrint jrPrint) throws JRException {
		super(jrPrint);

		tlbToolBar.remove(btnSave);
		tlbToolBar.remove(btnReload);

		btnPlus = new javax.swing.JButton();
		btnPlus.setToolTipText("关于");
		btnPlus.setIcon(new javax.swing.ImageIcon(getClass().getResource(
				"/org/g4studio/core/web/report/jasper/applet/image/about.gif")));
		btnPlus.setMargin(new java.awt.Insets(2, 2, 2, 2));
		btnPlus.setMaximumSize(new java.awt.Dimension(23, 23));
		btnPlus.setMinimumSize(new java.awt.Dimension(23, 23));
		btnPlus.setPreferredSize(new java.awt.Dimension(23, 23));
		btnPlus.addActionListener(new java.awt.event.ActionListener() {
			public void actionPerformed(java.awt.event.ActionEvent evt) {
				btnPlusActionPerformed(evt);
			}
		});
		tlbToolBar.add(btnPlus, 0);
	}

	protected void btnPlusActionPerformed(java.awt.event.ActionEvent evt) {
		JOptionPane.showMessageDialog(this, "感谢使用,更多信息请访问:www.g4studio.org");
	}

}
