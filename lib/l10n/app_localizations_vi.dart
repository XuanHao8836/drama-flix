// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Vietnamese (`vi`).
class AppLocalizationsVi extends AppLocalizations {
  AppLocalizationsVi([String locale = 'vi']) : super(locale);

  @override
  String get helloWorld => 'Xin chào thế giới!';

  @override
  String get bottomNavHome => 'Trang chủ';

  @override
  String get bottomNavTheater => 'Rạp phim';

  @override
  String get bottomNavHistory => 'Lịch sử';

  @override
  String get bottomNavProfile => 'Hồ sơ';

  @override
  String get appbarAction => 'Xong';

  @override
  String get appbarTitleProfile => 'Khách mời';

  @override
  String get becomeVip => 'Trở thành VIP';

  @override
  String get enjoyAllThePerks => 'Tận hưởng mọi đặc quyền';

  @override
  String get register => 'Đăng ký';

  @override
  String get settings => 'Cài đặt';

  @override
  String get english => 'Tiếng Anh';

  @override
  String get displayLanguage => 'Ngôn ngữ hiển thị';

  @override
  String get myFavorite => 'Mục yêu thích của tôi';

  @override
  String get watchHistory => 'Lịch sử xem';

  @override
  String get language => 'Ngôn ngữ';

  @override
  String get nodatafound => 'Không tìm thấy dữ liệu';

  @override
  String get thisActionMayContainAds => 'Hành động này có thể chứa quảng cáo';

  @override
  String get anErrorHasOccurred => 'Đã xảy ra lỗi';

  @override
  String loginError(Object message) {
    return 'Lỗi đăng nhập: $message';
  }

  @override
  String get termsOfUse => 'Điều khoản sử dụng';

  @override
  String get privacyPolicy => 'Chính sách bảo mật';

  @override
  String get byRegistrationYouAgreeTo => 'Bằng cách đăng ký, bạn đồng ý với';

  @override
  String get signInWithApple => 'Đăng nhập bằng Apple';

  @override
  String get signInWithGoogle => 'Đăng nhập bằng Google';

  @override
  String get signInWithFacebook => 'Đăng nhập bằng Facebook';

  @override
  String get signIn => 'ĐĂNG NHẬP';

  @override
  String get movieLoversNetwork => 'Mạng xã hội những người yêu phim';

  @override
  String welcomeToAppname(Object appName) {
    return 'CHÀO MỪNG BẠN ĐẾN VỚI $appName';
  }

  @override
  String get and => ' và ';

  @override
  String get retry => 'Thử lại';

  @override
  String get networkErrorTitle => 'Lỗi kết nối mạng!';

  @override
  String get networkErrorContent =>
      'Vui lòng kiểm tra kết nối internet của bạn.';

  @override
  String get otherErrorTitle => 'Đã xảy ra lỗi!';

  @override
  String get otherErrorContent =>
      'Có lỗi không mong muốn xảy ra. Vui lòng thử lại.';

  @override
  String get onboardingWelcomeHeadline =>
      'Chào mừng bạn đến với thế giới điện ảnh đầy màu sắc';

  @override
  String get onboardingWelcomeSubheadline =>
      'Khám phá hàng ngàn bộ phim và series với trải nghiệm hoàn toàn mới';

  @override
  String get watchDramaSeriesOnline => 'XEM PHIM BỘ TRỰC TUYẾN';

  @override
  String get onboarding => 'An unexpected error occurred. Please try again.';

  @override
  String get onboardingWelcomeDescription =>
      'Khám phá thế giới phim ảnh đa sắc màu ngay trên thiết bị của bạn.';

  @override
  String get onboardingExploreTitle => 'Khám phá nội dung phong phú';

  @override
  String get onboardingExploreDescription =>
      'Hàng ngàn bộ phim và series đang chờ bạn khám phá mỗi ngày.';

  @override
  String get onboardingFindTitle => 'Tìm kiếm dễ dàng';

  @override
  String get onboardingFindDescription =>
      'Công cụ tìm kiếm thông minh giúp bạn tìm thấy phim yêu thích chỉ trong tích tắc.';

  @override
  String get onboardingTrendingTitle => 'Phim Hot và Trending';

  @override
  String get onboardingTrendingDescription =>
      'Luôn cập nhật những bộ phim được xem nhiều nhất và hot nhất hiện nay.';

  @override
  String get onboardingSubscribeTitle => 'Đăng ký để xem không giới hạn';

  @override
  String get onboardingSubscribeDescription =>
      'Mở khóa toàn bộ thư viện phim và trải nghiệm không quảng cáo.';

  @override
  String get onboardingSkipButton => 'Bỏ qua';

  @override
  String get onboardingNextButton => 'Tiếp theo';

  @override
  String get onboardingStartButton => 'Bắt đầu';

  @override
  String get location_permission_title => 'Quyền vị trí';

  @override
  String get location_permission_message =>
      'Ứng dụng cần quyền truy cập vị trí để sử dụng đầy đủ các chức năng. Bạn có muốn cấp quyền không?';

  @override
  String get location_permission_cancel => 'Hủy';

  @override
  String get location_permission_ok => 'Đồng ý';

  @override
  String get location_permission_denied_forever_title =>
      'Quyền vị trí bị từ chối vĩnh viễn';

  @override
  String get location_permission_denied_forever_message =>
      'Bạn cần bật quyền vị trí trong Cài đặt để tiếp tục sử dụng.';

  @override
  String get location_permission_denied_forever_close => 'Đóng';

  @override
  String get location_permission_denied_forever_open_settings => 'Mở Cài đặt';

  @override
  String get location_initial => 'Chưa lấy vị trí';

  @override
  String get location_loading => 'Đang lấy vị trí';

  @override
  String location_failure(Object error) {
    return 'Lỗi: $error';
  }

  @override
  String get location_denied => 'Quyền bị từ chối';

  @override
  String get location_denied_forever => 'Quyền bị từ chối vĩnh viễn';

  @override
  String get searchHint => 'Bí mật của tình yêu';

  @override
  String get hotTrendingMovies => 'Phim Hot Trending';

  @override
  String get newReleasedMovies => 'Phim Mới Phát Hành';

  @override
  String get mostSearchedMovies => 'Phim Tìm Kiếm Nhiều';
}
