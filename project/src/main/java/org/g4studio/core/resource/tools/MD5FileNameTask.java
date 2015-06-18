package org.g4studio.core.resource.tools;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.Iterator;
import java.util.Vector;

import org.apache.tools.ant.BuildException;
import org.apache.tools.ant.DirectoryScanner;
import org.apache.tools.ant.Task;
import org.apache.tools.ant.types.FileSet;
import org.g4studio.core.resource.loader.MD5ClasspathResourceLoader;
import org.g4studio.core.resource.util.MD5;

/**
 * MD5FileNameTask
 * 
 * @author HuangYunHui|XiongChun
 * @since 2010-2-5
 */
public class MD5FileNameTask extends Task {
	
	private String out;
	private Vector filesets = new Vector();
	private MD5 m = new MD5();

	public void addFileset(FileSet fileset) {
		filesets.add(fileset);
	}

	protected void validate() {
		if (filesets.size() < 1)
			throw new BuildException("没有设置文件集!");
	}

	public void execute() {
		validate();
		File dir = new File(out);
		if (dir.exists() == false)
			if (dir.mkdirs() == false) {
				throw new BuildException("创建目录:" + dir + "失败!");
			}
		for (Iterator itFSets = filesets.iterator(); itFSets.hasNext();) { // 2
			FileSet fs = (FileSet) itFSets.next();
			DirectoryScanner ds = fs.getDirectoryScanner(getProject()); // 3
			String[] includedFiles = ds.getIncludedFiles();
			for (int i = 0; i < includedFiles.length; i++) {
				String filename = "/" + includedFiles[i].replace('\\', '/'); // 4
				File base = ds.getBasedir(); // 5
				File found = new File(base, includedFiles[i]);
				String newFileName = MD5ClasspathResourceLoader.FILE_PREFIX + m.getMD5ofStr(filename)
						+ MD5ClasspathResourceLoader.FILE_POSTFIX;
				String outFile = out + "/" + newFileName;
				System.out.println("处理文件:" + filename + "...");
				fileOut(found, outFile);
				System.out.println("处理文件:" + filename + "成功!");
			}
		}
	}

	/**
	 * @todo: 这是个简单的实现
	 * @param pSrcFile
	 * @param pOutputFile
	 * @throws BuildException
	 */
	private void fileOut(File pSrcFile, String pOutputFile) throws BuildException {
		InputStream is = null;
		try {
			is = new FileInputStream(pSrcFile);
		} catch (FileNotFoundException e) {
			throw new BuildException("读文件:" + pSrcFile + "失败!", e);
		}
		OutputStream outputStream = null;
		try {
			outputStream = new FileOutputStream(pOutputFile);
		} catch (FileNotFoundException e) {
			throw new BuildException("创建输出流:" + pOutputFile + "失败!", e);
		}
		byte[] buf = new byte[2 * 1024];
		int len;
		try {
			while ((len = is.read(buf)) > 0) {
				outputStream.write(buf, 0, len);
			}
		} catch (IOException e) {
			throw new BuildException("处理文件:" + pSrcFile + "失败!", e);
		}

	}

	public String getOut() {
		return out;
	}

	public void setOut(String out) {
		this.out = out;
	}

}
