class TFirebaseAuthException implements Exception {
  final String code;

  TFirebaseAuthException(this.code);

  String get message {
    switch (code) {
      case 'email-already-in-use':
        return 'Địa chỉ email đã được đăng ký. Vui lòng sử dụng email khác.';
      case 'invalid-email':
        return 'Địa chỉ email không hợp lệ. Vui lòng sử dụng email hợp lệ.';
      case 'weak-password':
        return 'Mật khẩu quá yếu. Vui lòng sử dụng mật khẩu mạnh hơn.';
      case 'user-disable':
        return 'Tài khoản người dùng bị vô hiệu hóa. Vui lòng liên hệ hỗ trợ.';
      case 'user-not-found':
        return 'Đăng nhập không hợp lệ. Không tìm thấy người dùng.';
      case 'wrong-password':
        return 'Sai mật khẩu. Vui lòng kiểm tra mật khẩu và thử lại.';
      case 'invalid-verification-code':
        return 'Mã xác minh không hợp lệ. Vui lòng nhập mã xác minh.';
      case 'invalid-verification-id':
        return 'ID xác minh không hợp lệ. Vui lòng yêu cầu mã xác minh mới.';
      case 'quota-exceeded':
        return 'Đã vượt quá hạn ngạch. Vui lòng thử lại.';
      case 'email-already-exists':
        return 'Địa chỉ email đã tồn tại. Vui lòng sử dụng email khác';
      case 'provider-already-linked':
        return 'Tài khoản đã được liên kết với nhà cung cấp khác.';
      case 'requires-recent-login':
        return 'Hoạt động này rất nhạy cảm và yêu cầu xác thực gần đây. Vui lòng đăng nhập lại.';
      case 'credential-already-in-use':
        return 'Thông tin xác thực này đã được liên kết với một tài khoản người dùng khác.';
      case 'user-mismatch':
        return 'Thông tin đăng nhập được cung cấp không khớp với người dùng đã đăng nhập trước đó.';
      case 'account-exists-with-different-credential':
        return 'Một tài khoản đã tồn tại với cùng một email nhưng thông tin đăng nhập khác nhau.';
      case 'operation-not-allowed':
        return 'Hành động này không được phép. Vui lòng liên hệ bộ phận hỗ trợ để được trợ giúp.';
      case 'expired-action-code':
        return 'Mã hành động đã hết hạn. Vui lòng yêu cầu mã hành động mới.';
      case 'invalid-action-code':
        return 'Mã hành động không hợp lệ. Vui lòng kiểm tra mã và thử lại.';
      case 'missing-action-code':
        return 'Thiếu mã hành động. Vui lòng cung cấp mã hành động hợp lệ.';
      case 'user-token-expired':
        return 'The user\'s token has expired, and authentication is required. Please sign in again.';
      // ignore: unreachable_switch_case
      case 'user-not-found':
        return 'Không tìm thấy người dùng cho email hoặc UID đã cho.';
      case 'invalid-credential':
        return 'Thông tin đăng nhập được cung cấp không hợp lệ hoặc đã hết hạn.';
      // ignore: unreachable_switch_case
      case 'wrong-password':
        return 'Mật khẩu không hợp lệ. Vui lòng kiểm tra mật khẩu và thử lại.';
      case 'user-token-revoked':
        return 'The user\'s token has been revoked. Please sign in again.';
      case 'invalid-message-payload':
        return 'Nội dung tin nhắn xác minh mẫu email không hợp lệ.';
      case 'invalid-sender':
        return 'Nội dung tin nhắn xác minh mẫu email không hợp lệ.';
      case 'invalid-recipient-email':
        return 'Địa chỉ email người nhận không hợp lệ. Vui lòng cung cấp địa chỉ email người nhận hợp lệ.';
      case 'missing-iframe-start':
        return 'Mẫu email thiếu thẻ bắt đầu iframe.';
      case 'missing-iframe-end':
        return 'Mẫu email thiếu thẻ kết thúc iframe.';
      case 'missing-iframe-src':
        return 'Mẫu email thiếu thuộc tính iframe src.';
      case 'auth-domain-config-required':
        return 'Cấu hình authDomain là bắt buộc cho liên kết xác minh mã hành động.';
      case 'missing-app-credential':
        return 'Thiếu thông tin đăng nhập ứng dụng. Vui lòng cung cấp thông tin đăng nhập ứng dụng hợp lệ.';
      case 'invalid-app-credential':
        return 'Thông tin đăng nhập ứng dụng không hợp lệ. Vui lòng cung cấp thông tin đăng nhập ứng dụng hợp lệ.';
      case 'session-cookie-expired':
        return 'Cookie phiên của Firebase đã hết hạn. Vui lòng đăng nhập lại.';
      case 'uid-already-exists':
        return 'ID người dùng được cung cấp đã được sử dụng bởi người dùng khác.';
      case 'invalid-cordova-configuration':
        return 'Cấu hình Cordova được cung cấp không hợp lệ.';
      case 'app-deleted':
        return 'Phiên bản FirebaseApp này đã bị xóa.';
      case 'user-disabled':
        return 'Tài khoản người dùng đã bị vô hiệu hóa.';
      case 'user-token-mismatch':
        return 'The provided user\'s token has a mismatch with the authenticated user\'s user ID.';
      case 'web-storage-unsupported':
        return 'Lưu trữ web không được hỗ trợ hoặc bị vô hiệu hóa.';
      // ignore: unreachable_switch_case
      case 'invalid-credential':
        return 'Thông tin đăng nhập được cung cấp không hợp lệ. Vui lòng kiểm tra thông tin đăng nhập và thử lại.';
      case 'app-not-authorized':
        return 'Ứng dụng không được phép sử dụng Firebase Authentication với khóa API được cung cấp.';
      default:
        return 'Lỗi';
    }
  }
}
