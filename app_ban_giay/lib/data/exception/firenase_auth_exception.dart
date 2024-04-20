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
        return 'The email address provided is invalid. Please enter a valid email';
      case 'operation-not-allowed':
        return 'The email address provided is invalid. Please enter a valid email';
      case 'expired-action-code':
        return 'The email address provided is invalid. Please enter a valid email';
      case 'missing-action-code':
        return 'The email address provided is invalid. Please enter a valid email';
      case 'user-token-expired':
        return 'The email address provided is invalid. Please enter a valid email';
      case 'user-not-found':
        return 'The email address provided is invalid. Please enter a valid email';
      case 'invalid-credential':
        return 'The email address provided is invalid. Please enter a valid email';
      case 'wrong-password':
        return 'The password invalid. Please check your password and try again';
      case 'user-token-revoked':
        return 'The email address provided is invalid. Please enter a valid email';
      case 'invalid-message-payload':
        return 'The email address provided is invalid. Please enter a valid email';
      case 'invalid-sender':
        return 'The email address provided is invalid. Please enter a valid email';
      case 'invalid-recipient-email':
        return 'The email address provided is invalid. Please enter a valid email';
      default:
        return 'Lỗi';
    }
  }
}
