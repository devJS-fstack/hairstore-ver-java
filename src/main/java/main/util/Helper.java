package main.util;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.Locale;
import java.util.Random;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;

import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.web.multipart.MultipartFile;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

import io.jsonwebtoken.Claims;
import io.jsonwebtoken.Jwts;
import main.controller.TransferSync;

public class Helper {
	public static String[] _serviceIds = new String[] {};
	
	public static Date convertStringToDate(String date, String format) {
		SimpleDateFormat dateFormat = new SimpleDateFormat(format);
		try {
		    Date dateParse = dateFormat.parse(date);
		    return dateParse;
		} catch (ParseException e) {
		    System.out.println("Exception while parsing date: " + e);
		    return null;
		}
	}
	
	public static String getDayOfWeek(String date) {
		Calendar calendar = Calendar.getInstance();
		Date dateParse = convertStringToDate(date, Constants.FORMAT_DATE);
		calendar.setTime(dateParse);
		String dayOfWeek = calendar.getDisplayName(Calendar.DAY_OF_WEEK, Calendar.LONG, new Locale("vi", "VN"));
		return dayOfWeek;
	}
	
	public static int getDayNumberOfWeek(String date) {
		Calendar calendar = Calendar.getInstance();
		Date dateParse = convertStringToDate(date, Constants.FORMAT_DATE);
		calendar.setTime(dateParse);
		int dayOfWeek = calendar.get(Calendar.DAY_OF_WEEK);
		return dayOfWeek;
	}
	
	public static String getMonthOfYear(String date) {
		Calendar calendar = Calendar.getInstance();
		Date dateParse = convertStringToDate(date, Constants.FORMAT_DATE);
		calendar.setTime(dateParse);
		int month = calendar.get(Calendar.MONTH);
		String monthString = String.format("%02d", month + 1);
		return monthString;
	}
	
	public static String getDayOfMonth(String date) {
		Calendar calendar = Calendar.getInstance();
		Date dateParse = convertStringToDate(date, Constants.FORMAT_DATE);
		calendar.setTime(dateParse);
		int day = calendar.get(Calendar.DATE);
		return String.valueOf(day);
	}
	
	public static String generateRandomSixNumber() {
        String alphabet = "0123456789";
        alphabet = alphabet.toLowerCase(Locale.ROOT);
        StringBuilder sb = new StringBuilder();
        Random random = new Random();
        int length = 6;
        for(int i = 0; i < length; i++) {
            int index = random.nextInt(alphabet.length());
            char randomChar = alphabet.charAt(index);
            sb.append(randomChar);
        }
        return sb.toString();
    }
	
	public static void sendMail(JavaMailSender mailer, String emailTo, String subject, String body) {
		MimeMessage mail = mailer.createMimeMessage();
		MimeMessageHelper helper = new MimeMessageHelper(mail);
		try {
			helper.setFrom(Constants.EMIAL_FROM);
			helper.setTo(emailTo);
			helper.setSubject(subject);
			helper.setText(body, true);
			
			mailer.send(mail);
			
		} catch (Exception e) {
			System.out.println("Error while sending email...");
		}
	}
	
	public static Claims parseClaim(String token) {
		Claims claims = null;
		try {
			claims = Jwts.parser().setSigningKey(Constants.SECRET_KEY_ACCESS_TOKEN.getBytes()).parseClaimsJws(token).getBody();	
			return claims;
		} catch(IllegalArgumentException exception) {
			System.out.println("Excetion token: " + exception);
		}
		
		return null;
	}
	
	public static String parseRawDataToJson(Object object) {
		try {
			ObjectMapper mapper = new ObjectMapper();
			String objectJson = mapper.writeValueAsString(object);
			return objectJson;
		} catch (JsonProcessingException e) {
			System.out.println("excep: "  + e);
		}
		
		return null;
	}
	
	public static Boolean uploadImage(MultipartFile photo, String namePhoto) {
		if(photo.isEmpty()) {
			System.out.print("Photo is empty");
			return false;
		}
		try {
			String photoPath = Constants.ORIGIN_PATH_IMAGES + namePhoto;
			TransferSync transfer = new TransferSync(photoPath, photo);
			transfer.start();
			transfer.join();
		} catch(Exception e) {
			System.out.print("Upload photo failed" + e);
		}
		return false;
	}
	
	public static String getRootDomain(HttpServletRequest request) {
	    StringBuffer requestURL = request.getRequestURL();
	    String requestURI = request.getRequestURI();
	    int rootDomainEndIndex = requestURL.indexOf(requestURI);
	    return requestURL.substring(0, rootDomainEndIndex);
	}
	
	public static String getRoleByTypeStaff(int typeStaff) {
		switch(typeStaff) {
		case 1:
			return "2";
		case 2:
			return "2";
		case 3: return "3";
		case 4: return "4";
		default: return null;
		}
	}
}
