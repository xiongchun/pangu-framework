package org.g4studio.core.util;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.util.zip.ZipEntry;
import java.util.zip.ZipInputStream;
import java.util.zip.ZipOutputStream;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

/**
 * Zip压缩解压工具类
 * 
 * @author XiongChun
 * @since 2009-07-15
 */
public class ZipUtil {
	
	private static Log log = LogFactory.getLog(ZipUtil.class);
 
	/**
	 * 解压缩
	 * @param zipFileName 压缩文件
	 * @param outputDirectory  解压缩输出目录
	 * @throws Exception
	 */
	public void unzip(String zipFileName, String outputDirectory) throws Exception {
		ZipInputStream in = new ZipInputStream(new FileInputStream(zipFileName));
		ZipEntry z;
		while ((z = in.getNextEntry()) != null) {
			log.info("正在解压缩 " + z.getName());
			if (z.isDirectory()) {
				String name = z.getName();
				name = name.substring(0, name.length() - 1);
				File f = new File(outputDirectory + File.separator + name);
				f.mkdir();
				log.info("正在创建目录 " + outputDirectory + File.separator + name);
			} else {
				File f = new File(outputDirectory + File.separator + z.getName());
				f.createNewFile();
				FileOutputStream out = new FileOutputStream(f);
				int b;
				while ((b = in.read()) != -1)
					out.write(b);
				out.close();
			}
		}
		in.close();
	    log.info("解压缩完成");
	}

	/**
	 * 压缩
	 * @param zipFileName 压缩输出文件路径
	 * @param inputDirectory 待压缩的输入文件路径
	 * @throws Exception
	 */
	public void zip(String zipFileName, String inputDirectory) throws Exception {
		zip(zipFileName, new File(inputDirectory));
	}

	public void zip(String zipFileName, File inputFile) throws Exception {
		ZipOutputStream out = new ZipOutputStream(new FileOutputStream(zipFileName));
		zip(out, inputFile, "");
        log.info("压缩完成");
		out.close();
	}

	public void zip(ZipOutputStream out, File f, String base) throws Exception {
		log.info("正在压缩  " + f.getName());
		if (f.isDirectory()) {
			File[] fl = f.listFiles();
			out.putNextEntry(new ZipEntry(base + "/"));
			base = base.length() == 0 ? "" : base + "/";
			for (int i = 0; i < fl.length; i++) {
				zip(out, fl[i], base + fl[i].getName());
			}
		} else {
			out.putNextEntry(new ZipEntry(base));
			FileInputStream in = new FileInputStream(f);
			int b;
			while ((b = in.read()) != -1)
				out.write(b);
			in.close();
		}
	}

	public static void main(String[] args) {
		try {
			ZipUtil t = new ZipUtil();
			//t.zip("c:\\01.zip", "c:\\01");
			t.unzip("c:\\01.zip", "c:\\01");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
