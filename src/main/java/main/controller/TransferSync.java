package main.controller;

import java.io.File;

import org.springframework.web.multipart.MultipartFile;

public class TransferSync extends Thread{

	private String path;
	private MultipartFile file;
	public TransferSync(String path, MultipartFile file) {
		this.path = path;
		this.file = file;
	}
	@Override
	public void run() {
		try {
			if(!file.isEmpty()) {
				file.transferTo(new File(path));
			}
		} catch (Exception e) {
			System.out.print("Exception while transfer file: " +  e);
		}
	}
	
}
