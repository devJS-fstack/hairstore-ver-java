package main.util;

public class Constants {
	public static String BOOKED = "Đã đặt lịch";
	public static String FORMAT_DATE = "yyyy-MM-dd";
	public static String EMIAL_FROM = "vantinhnguyen728@gmail.com";
	public static String SUBJECT_FORGOT_PASSWORD = "Xác thực đặt lại tài khoản quản lý TheBaberShop";
	public static String TEXT_FORGOT_PASSWORD = "<p>Chào anh, đây là link để xác thực đặt lại mật khẩu cho tài khoản sử dụng email này để truy cập vào website private dành riêng cho nhân viên và quản lý."
			+ " Anh vui lòng không để lộ</p>"
			+ "<h1 style=\"display:flex\">${baseUrl}/user/confirm-update?accessToken=${token}</h1>";
	public static String SUBJECT_NEW_ACCOUNT = "Mật khẩu tài khoản nhân viên TheBaberShop";
	public static String SUBJECT_NEW_ACCOUNT_CUSTOMER = "Mật khẩu tài khoản khách hàng của TheBaberShop";
	public static String TEXT_NEW_ACCOUNT = "<p>Chào bạn, đây là tài khoản và mật khẩu của bạn tại website TheBaberShop. Bạn vui lòng không để lộ, có vấn đề liên hệ trực tiếp Admin </p>"
			+ "<h1 style=\"display:flex\">Tài khoản: ${account}</h1>"
			+ "<h1 style=\"display:flex\">Mật khẩu: ${password}</h1>";
	
	public static String SECRET_KEY_ACCESS_TOKEN = "devnguyenisreal";
	
	public static String STATUS_ACTIVE_ACCOUNT = "Active";
	public static String STATUS_STAFF_ACTIVE = "Hoạt Động";
	public static String STATUS_SERVICE_ACTIVE = "Hoạt Động";
	public static String STATUS_SERVICE_INACTIVE = "Không Hoạt Động";
	public static String ORIGIN_PATH_IMAGES = "D:\\Java Web\\ProjectSpring\\Admin_CK\\src\\main\\webapp\\client\\images\\";
	public static String BASE_URL_IMAGES = "${baseUrl}/client/images/";
	public static String STATUS_REGIS_SHIFT = "Đã đăng ký";
	public static String STATUS_DONE_SHIFT = "Đã hoàn thành";
	public static String STATUS_CANCEL_BOOK = "Đã hủy lịch";
	public static String STATUS_DONE_BOOK = "Đã hoàn tất";
	public static String STATUS_DONE_BILL = "Đã thanh toán";
	public static Double MAX_PAGE = 10.0;
}
