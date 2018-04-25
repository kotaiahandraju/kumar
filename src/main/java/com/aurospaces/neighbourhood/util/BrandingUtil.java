package com.aurospaces.neighbourhood.util;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;

import javax.servlet.ServletContext;

import org.apache.commons.io.FileUtils;
import org.springframework.web.multipart.MultipartFile;

public class BrandingUtil {
	public String createFile(String sFilePath,ServletContext servletContext, MultipartFile mfile)
			throws IOException {
		String logoPath = null;
		try{
		File folder = new File(sFilePath);

		if (!folder.exists()) {
			folder.mkdir();
		}
		String fileName = mfile.getOriginalFilename();
		if (!("").equals(fileName)) {
			fileName = "package.csv";
			File newFile = new File(sFilePath, fileName);
				FileOutputStream fos = new FileOutputStream(newFile);
				fos.write(mfile.getBytes());
				fos.flush();
				fos.close();
			logoPath = sFilePath + File.separator + fileName;
		} else {
			String nFilePath = servletContext.getRealPath("Branding"+File.separator+"Brand"+File.separator+"logo.png");
			File sourceFile = new File(nFilePath);
			File destFile = new File(sFilePath + File.separator + "logo.png");
			try {
				FileUtils.copyFile(sourceFile, destFile);
			} catch (IOException e) {
				e.printStackTrace();
			}
			logoPath = sFilePath + File.separator + File.separator + "logo.png";
		}
		}catch(Exception e){
			e.printStackTrace();
		}
		return logoPath;
	}

	public String  createCssBranding(String sFilePath,
			ServletContext servletContext, String sTheme)
			throws IOException {
		
		File cssFile = new File(sFilePath);
		if (sTheme.equals("1")) {
			cssFile = new File(servletContext.getRealPath("Branding"+File.separator+"Brand"+File.separator+ "style.css"));
		} else if (sTheme.equals("2")) {
			cssFile = new File(servletContext.getRealPath("Branding"+File.separator+"Brand"+File.separator+ "black.css"));
		} else {
			cssFile = new File(servletContext.getRealPath("Branding"+File.separator+"Brand"+File.separator+ "blue.css"));
		}
		File cssFilePath = new File(sFilePath + File.separator + "Theme.css");
		FileInputStream fis = new FileInputStream(cssFile);
		FileOutputStream fos = new FileOutputStream(cssFilePath);
		String cssPath = sFilePath + File.separator + "Theme.css";
		int iCount;
		while ((iCount = fis.read()) != -1) {
			fos.write(iCount);
		}
		fis.close();
		fos.close();
		return cssPath;
	}
}
