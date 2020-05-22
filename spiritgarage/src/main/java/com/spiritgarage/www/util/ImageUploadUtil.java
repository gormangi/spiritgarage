package com.spiritgarage.www.util;

import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

import javax.imageio.ImageIO;

import org.springframework.web.multipart.MultipartFile;

public class ImageUploadUtil {

	public static Map<String, Object> imageUpload(MultipartFile upload , String folderName , String imageUploadPath, String baseUrl) {
		Map<String, Object> result = new HashMap<String, Object>();
		
		String imageFileName = upload.getOriginalFilename();
		String imageFileExt  = imageFileName.substring(imageFileName.lastIndexOf(".") + 1);
		String uploadImageFileName = UUID.randomUUID().toString() + "." + imageFileExt;
		
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		Date today = new Date();
		
		String uploadPath = imageUploadPath + format.format(today) + File.separator + uploadImageFileName;
		
		File imageFile = new File(uploadPath);
		if(!imageFile.exists()) {
			imageFile.mkdirs();
		}
		
		BufferedImage image;
		try {
			image = ImageIO.read(upload.getInputStream());
			ImageIO.write(image, "jpg", imageFile);
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		result.put("fileName", uploadPath);
		result.put("uploaded", 1);
		result.put("url", baseUrl + "/"+ folderName +"/"+format.format(today)+"/"+uploadImageFileName);
		return result;
	}

}
