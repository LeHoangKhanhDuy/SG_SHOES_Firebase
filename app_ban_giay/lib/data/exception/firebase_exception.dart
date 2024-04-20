class TFirebaseException implements Exception {
  final String code;

  TFirebaseException(this.code);

  String get message {
    switch (code) {
      case 'unknown':
        return 'Đã xảy ra lỗi không xác định. Vui lòng thử lại.';
      case 'invalid-custom-token':
        return 'Định dạng mã tùy chỉnh không chính xác. Vui lòng kiểm tra mã tùy chỉnh của bạn.';
      case 'custom-token-mismatch':
        return 'Mã tùy chỉnh tương ứng với đối tượng khác.';
      case 'user-disabled':
        return 'Tài khoản người dùng đã bị vô hiệu hóa.';
      case 'user-not-found':
        return 'Không tìm thấy người dùng cho email hoặc UID đã cung cấp.';
      case 'invalid-email':
        return 'Địa chỉ email được cung cấp không hợp lệ. Vui lòng nhập một email hợp lệ.';
      case 'email-already-in-use':
        return 'Địa chỉ email này đã được đăng ký. Vui lòng sử dụng email khác.';
      case 'wrong-password':
        return 'Mật khẩu không chính xác. Vui lòng kiểm tra mật khẩu của bạn và thử lại.';
      case 'weak-password':
        return 'Mật khẩu quá yếu. Vui lòng chọn mật khẩu mạnh hơn.';
      case 'provider-already-linked':
        return 'Tài khoản đã được liên kết với nhà cung cấp khác.';
      case 'operation-not-allowed':
        return 'Hoạt động này không được phép. Vui lòng liên hệ hỗ trợ để được trợ giúp.';
      case 'invalid-credential':
        return 'Thông tin đăng nhập được cung cấp bị lỗi hoặc đã hết hạn.';
      case 'invalid-verification-code':
        return 'Mã xác minh không hợp lệ. Vui lòng nhập mã hợp lệ.';
      case 'invalid-verification-id':
        return 'ID xác minh không hợp lệ. Vui lòng yêu cầu mã xác minh mới.';
      case 'captcha-check-failed':
        return 'Phản hồi reCAPTCHA không hợp lệ. Vui lòng thử lại.';
      case 'app-not-authorized':
        return 'Ứng dụng không được phép sử dụng Firebase Authentication với khóa API được cung cấp.';
      case 'keychain-error':
        return 'Đã xảy ra lỗi keychain. Vui lòng kiểm tra keychain và thử lại.';
      case 'internal-error':
        return 'Đã xảy ra lỗi xác thực nội bộ. Vui lòng thử lại sau.';
      case 'invalid-app-credential':
        return 'Đã xảy ra lỗi xác thực nội bộ. Vui lòng thử lại sau.';
      case 'user-mismatch':
        return 'Thông tin đăng nhập được cung cấp không khớp với người dùng đã đăng nhập trước đó.';
      case 'requires-recent-login':
        return 'Hoạt động này rất nhạy cảm và yêu cầu xác thực gần đây. Vui lòng đăng nhập lại.';
      case 'quota-exceeded':
        return 'Đã vượt quá hạn ngạch. Vui lòng thử lại sau.';
      case 'account-exists-with-different-credential':
        return 'Đã có một tài khoản tồn tại với cùng email nhưng thông tin đăng nhập khác.';
      case 'missing-iframe-start':
        return 'Mẫu email thiếu thẻ bắt đầu iframe.';
      case 'missing-iframe-end':
        return 'Mẫu email thiếu thẻ kết thúc iframe.';
      case 'missing-iframe-src':
        return 'Mẫu email thiếu thuộc tính iframe src.';
      case 'auth-domain-config-required':
        return 'Cấu hình authDomain được yêu cầu cho liên kết xác minh mã hành động.';
      case 'missing-app-credential':
        return 'Thiếu thông tin đăng nhập ứng dụng. Vui lòng cung cấp thông tin đăng nhập ứng dụng hợp lệ.';
      case 'session-cookie-expired':
        return 'Cookie phiên Firebase đã hết hạn. Vui lòng đăng nhập lại.';
      case 'uid-already-exists':
        return 'ID người dùng được cung cấp đã được người dùng khác sử dụng.';
      case 'web-storage-unsupported':
        return 'Bộ nhớ web không được hỗ trợ hoặc bị vô hiệu hóa.';
      case 'app-deleted':
        return 'Phiên bản FirebaseApp này đã bị xóa.';
      case 'user-token-mismatch':
        return 'The provided user\'s token has a mismatch with the authenticated user\'s user ID.';
      case 'invalid-message-payload':
        return 'Tải trọng tin nhắn xác minh mẫu email không hợp lệ.';
      case 'invalid-sender':
        return 'The email template sender is invalid. Please verify the sender\'s email.';
      case 'invalid-recipient-email':
        return 'Địa chỉ email người nhận không hợp lệ. Vui lòng cung cấp email người nhận hợp lệ.';
      case 'missing-action-code':
        return 'Mã hành động bị thiếu. Vui lòng cung cấp mã hành động hợp lệ.';
      case 'user-token-expired':
        return 'The user\'s token has expired, and authentication is required. Please sign in again.';
      case 'INVALID_LOGIN_CREDENTIALS':
        return 'Invalid login credentials.';
      case 'expired-action-code':
        return 'Mã hành động đã hết hạn. Vui lòng yêu cầu mã hành động mới.';
      case 'invalid-action-code':
        return 'Mã hành động không hợp lệ. Vui lòng kiểm tra mã và thử lại.';
      case 'credential-already-in-use':
        return 'Thông tin xác thực này đã được liên kết với một tài khoản người dùng khác.';
      default:
        return 'Đã xảy ra lỗi không mong muốn. Vui lòng thử lại.';
    }
  }
}
