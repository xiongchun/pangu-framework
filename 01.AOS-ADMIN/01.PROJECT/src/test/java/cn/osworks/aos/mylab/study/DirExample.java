package cn.osworks.aos.mylab.study;

import java.io.File;
import java.util.LinkedList;

/**
 * <b>和文件目录操作相关的一些例子</b>
 * 
 * @author OSWorks-XC
 * @date 2013-08-18
 */
public class DirExample {

	public static void main(String[] args) {
		//listFolder1("E:\\北极星\\01.应用开发平台\\01.程序\\src");
		listFolder2("E:\\北极星\\01.应用开发平台\\01.程序\\src");
	}

	/**
	 * 不使用递归的方法列出目录下的文件夹和文件
	 * 
	 * @param path
	 */
	public static void listFolder1(String path) {
		int fileNum = 0, folderNum = 0;
		File file = new File(path);
		if (file.exists()) {
			LinkedList<File> list = new LinkedList<File>();
			File[] files = file.listFiles();
			for (File file2 : files) {
				if (file2.isDirectory()) {
					System.out.println("文件夹:" + file2.getAbsolutePath());
					list.add(file2);
					fileNum++;
				} else {
					System.out.println("文件:" + file2.getAbsolutePath());
					folderNum++;
				}
			}
			File temp_file;
			while (!list.isEmpty()) {
				temp_file = list.removeFirst();
				files = temp_file.listFiles();
				for (File file2 : files) {
					if (file2.isDirectory()) {
						System.out.println("文件夹:" + file2.getAbsolutePath());
						list.add(file2);
						folderNum++;
					} else {
						System.out.println("文件:" + file2.getAbsolutePath());
						fileNum++;
					}
				}
			}
		} else {
			System.out.println("文件不存在!");
		}
		System.out.println("文件夹共有:" + folderNum + ",文件共有:" + fileNum);

	}

	/**
	 * 使用递归的方法列出目录下的文件夹和文件
	 * 
	 * @param path
	 */
	public static void listFolder2(String path) {
		File file = new File(path);
		if (file.exists()) {
			File[] files = file.listFiles();
			if (files.length == 0) {
				System.out.println("文件夹是空的!");
				return;
			} else {
				for (File file2 : files) {
					if (file2.isDirectory()) {
						System.out.println("文件夹:" + file2.getAbsolutePath());
						listFolder2(file2.getAbsolutePath());
					} else {
						System.out.println("文件:" + file2.getAbsolutePath());
					}
				}
			}
		} else {
			System.out.println("文件不存在!");
		}
	}

}
