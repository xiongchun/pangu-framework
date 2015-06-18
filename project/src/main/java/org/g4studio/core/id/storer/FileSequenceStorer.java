package org.g4studio.core.id.storer;

import java.io.FileNotFoundException;
import java.io.IOException;
import java.net.URL;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.g4studio.core.id.SequenceStorer;
import org.g4studio.core.id.StoreSequenceException;
import org.g4studio.core.id.test.Hello;

/**
 * FileSequenceStorer 此代码源于开源项目E3,原作者：黄云辉
 * 
 * @author XiongChun
 * @since 2010-03-17
 * @see SequenceStorer
 */
public class FileSequenceStorer implements SequenceStorer {

	private static final Log logger = LogFactory.getLog(FileSequenceStorer.class);

	public static final String DEFAULT_FILE_PATH = "g4-id-sequence-store.properties";
	/**
	 * 文件路径，包含文件名，
	 */
	private String filePath = DEFAULT_FILE_PATH;

	protected String getRealFilePath() throws StoreSequenceException {
		java.io.File tmp = new java.io.File(filePath);
		if (tmp.exists()) {
			return this.filePath;
		}
		URL url = Hello.class.getClassLoader().getResource(this.filePath);
		if (url == null) {
			final String msg = "存储sequence失败!没有发现文件：" + filePath;
			logger.error(msg);
			throw new StoreSequenceException(msg);
		}
		return url.getFile();
	}

	public long load(String sequenceID) throws StoreSequenceException {

		java.util.Properties props = new java.util.Properties();
		final String realFilePath = getRealFilePath();
		if (logger.isDebugEnabled()) {
			logger.debug("序号ID:[" + sequenceID + "]");
			logger.debug("资源路径:[" + this.filePath + "]");
			logger.debug("实际文件路径:[" + realFilePath + "]");
		}
		java.io.FileInputStream is = null;
		try {
			is = new java.io.FileInputStream(realFilePath);
			props.load(is);
			String result = props.getProperty(sequenceID);
			if (result == null) {
				return -1;
			} else {
				return Long.parseLong(result);
			}
		} catch (FileNotFoundException e) {
			final String msg = "存储sequence失败!没有发现文件：" + realFilePath;
			logger.error(msg, e);
			throw new StoreSequenceException(msg, e);
		} catch (IOException e) {
			final String msg = "存储sequence失败!" + e.getMessage();
			logger.error(msg, e);
			throw new StoreSequenceException(msg, e);
		} finally {
			if (is != null) {
				try {
					is.close();
				} catch (IOException e) {
					final String msg = "关闭文件:" + realFilePath + "失败!" + e.getMessage();
					logger.debug(msg, e);
				}
			}
		}
	}

	public void updateMaxValueByFieldName(long sequence, String sequenceID) throws StoreSequenceException {
		java.util.Properties props = new java.util.Properties();
		final String realFilePath = getRealFilePath();
		if (logger.isDebugEnabled()) {
			logger.debug("序号ID:[" + sequenceID + "]");
			logger.debug("资源路径:[" + this.filePath + "]");
			logger.debug("实际文件路径:[" + realFilePath + "]");
		}
		java.io.FileInputStream is = null;
		try {
			is = new java.io.FileInputStream(realFilePath);
			props.load(is);
			props.setProperty(sequenceID, sequence + "");
		} catch (FileNotFoundException e) {
			final String msg = "存储sequence失败!没有发现文件：" + realFilePath;
			logger.error(msg, e);
			throw new StoreSequenceException(msg, e);
		} catch (IOException e) {
			final String msg = "存储sequence失败!" + e.getMessage();
			logger.error(msg, e);
			throw new StoreSequenceException(msg, e);
		} finally {
			if (is != null) {
				try {
					is.close();
				} catch (IOException e) {
					final String msg = "关闭文件:" + realFilePath + "失败!" + e.getMessage();
					logger.debug(msg, e);
				}
			}
		}

		java.io.FileOutputStream out = null;
		try {
			out = new java.io.FileOutputStream(realFilePath);
			props.store(out, "e3 id sequence storer, don't edit");
		} catch (FileNotFoundException e) {
			final String msg = "存储sequence失败!没有发现文件：" + realFilePath;
			logger.error(msg, e);
			throw new StoreSequenceException(msg, e);
		} catch (IOException e) {
			final String msg = "存储sequence失败!" + e.getMessage();
			logger.error(msg, e);
			throw new StoreSequenceException(msg, e);
		} finally {
			if (out != null) {
				try {
					out.close();
				} catch (IOException e) {
					final String msg = "关闭文件:" + realFilePath + "失败!" + e.getMessage();
					logger.debug(msg, e);
				}
			}
		}
	}

	public String getFilePath() {
		return filePath;
	}

	public void setFilePath(String filePath) {
		this.filePath = filePath;
	}

}
