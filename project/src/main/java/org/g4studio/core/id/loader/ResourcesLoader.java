package org.g4studio.core.id.loader;

import java.io.FileOutputStream;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.g4studio.core.id.storer.FileSequenceStorer;

/**
 * ResourcesLoader
 * 
 * @author XiongChun
 * @since 2010-03-17
 */
public class ResourcesLoader {
	private final static Log logger = LogFactory.getLog(ResourcesLoader.class);

	private ResourcesLoader() {

	}

	private static String getSequenceFile(final String pWebHome) {
		return pWebHome + "/WEB-INF/classes/"
				+ FileSequenceStorer.DEFAULT_FILE_PATH;
	}

	public static void load(final String pWebHome)
			throws LoadResourcesException {
		if (pWebHome == null) {
			return;
		}
		final String sequenceFile = getSequenceFile(pWebHome);
		java.io.File file = new java.io.File(sequenceFile);
		if (file.exists()) {// 如果存在，则返回
			return;
		}
		java.io.InputStream in = ResourcesLoader.class
				.getResourceAsStream(FileSequenceStorer.DEFAULT_FILE_PATH);
		try {
			FileOutputStream fos = new FileOutputStream(sequenceFile);
			final int cache = 1024;
			byte[] b = new byte[cache];
			int aa = 0;
			while ((aa = in.read(b)) != -1) {
				fos.write(b, 0, aa);
			}
		} catch (Exception ex) {
			final String MSG = "导出Sequence文件:" + sequenceFile + "失败!";
			logger.error(MSG, ex);
			throw new LoadResourcesException(MSG, ex);
		}

	}
}
