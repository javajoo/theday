package com.theday.common;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;

import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;

@Component
public class FileManagerService {

	public final static String FILE_UPLOAD_PATH =  "C:\\spring_project\\theday\\workspace\\images/";
	
	// 파일 업로드
	public String saveFile(String userLoginId, MultipartFile file) {
		String directoryName = userLoginId + "_" + System.currentTimeMillis() + "/";
		String filePath = FILE_UPLOAD_PATH + directoryName;
		
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
		Path path = Paths.get(FILE_UPLOAD_PATH + profileImagePath.replace("/images", ""));
		
		if (Files.exists(path)) {
			Files.delete(path);
		}
		
		path = path.getParent();
		
		if (Files.exists(path)) {
			Files.delete(path);
		}
		
	}
}
