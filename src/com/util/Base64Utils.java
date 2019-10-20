package com.util;
import java.io.ByteArrayInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.Base64;

import freemarker.template.utility.StringUtil;
import sun.misc.BASE64Decoder;
import sun.misc.BASE64Encoder;



public class Base64Utils {
	public static String ImageToBase64(String imgFile) {// 将图片文件转化为字节数组字符串，并对其进行Base64编码处理
		 
		 
		InputStream in = null;
		byte[] data = null;
 
		// 读取图片字节数组
		try {
			in = new FileInputStream(imgFile);
			
			data = new byte[in.available()];
			in.read(data);
			in.close();
		} catch (IOException e) {
			e.printStackTrace();
		}
		// 对字节数组Base64编码
		BASE64Encoder encoder = new BASE64Encoder();
 
		return encoder.encode(data);// 返回Base64编码过的字节数组字符串
	}
	
	public static String Base64ToImage(String imgStr) { // 对字节数组字符串进行Base64解码并生成图片
		 
		
		BASE64Decoder decoder = new BASE64Decoder();
		try {
			// Base64解码
			byte[] b = decoder.decodeBuffer(imgStr);
			
			for (int i = 0; i < b.length; ++i) {
				if (b[i] < 0) {// 调整异常数据
					b[i] += 256;
				}
			}
			String c = new String(b);
			return c;
		} catch (Exception e) {
			return null;
		}
 
	}
	

}

