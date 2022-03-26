package com.theday.common;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;

@Component
public class FileManagerService {

	public static String fileUploadPath;
	
	@Value("${file.upload-path}")
	public void setFileUploadPath(String fileUploadPath) {
		FileManagerService.fileUploadPath = fileUploadPath;
	}
	
	// 파일 업로드
	public String saveFile(String userLoginId, MultipartFile file) {
		String directoryName = userLoginId + "_" + System.currentTimeMillis() + "/";
		String filePath = fileUploadPath + directoryName;
		
		File directory = new File(filePath);
		if (directory.mkdir() == false) {
			return null;
		}
		
		
		try {
			byte[] bytes;
			bytes = file.getBytes();
			Path path = Paths.get(filePath + file.getOriginalFilename());
			Files.write(path, bytes);
			
			return "/images/" + directoryName + file.getOriginalFilename();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return null;
	}
	
	// 파일 삭제
	public void deleteFile(String profileImagePath) throws IOException {
		Path path = Paths.get(fileUploadPath + profileImagePath.replace("/images", ""));
		
		if (Files.exists(path)) {
			Files.delete(path);
		}
		
		path = path.getParent();
		
		if (Files.exists(path)) {
			Files.delete(path);
		}
		
	}
}
