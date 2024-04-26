class TValidator {
  static String? validateEmptyText(String? fieldName, String? value) {
    if (value == null || value.isEmpty) {
      return '$fieldName là bắt buộc';
    }
    return null;
  }

  //username
  static String? validateUsername(String? username) {
    if (username == null || username.isEmpty) {
      return 'Username là bắt buộc';
    }
    const pattern = r"^[a-zA-z0-9_-]{3,20}$";
    final regex = RegExp(pattern);
    bool isValid = regex.hasMatch(username);
    if (isValid) {
      isValid = !username.startsWith('_') &&
          !username.startsWith('-') &&
          !username.endsWith('_') &&
          !username.endsWith('-');
    }
    if (!isValid) {
      return 'Username is not valid.';
    }
    return null;
  }

  static String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Vui lòng nhập Email';
    }

    final emailRegExp = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');

    if (!emailRegExp.hasMatch(value)) {
      return 'Email không hợp lệ';
    }

    return null;
  }

  static String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Vui lòng nhập mật khẩu';
    }

    //   if (value != confirmPassword) {
    //   return 'Mật khẩu nhập lại không khớp';
    //  }

    //Mật khẩu ngắn
    if (value.length < 6) {
      return 'Mật khẩu từ 6 ký tự';
    }

    //Viết hoa
    if (!value.contains(RegExp(r'[A-Z]'))) {
      return 'Mật khẩu có ít nhất 1 ký tự viết hoa';
    }

    //Số
    if (!value.contains(RegExp(r'[0-9]'))) {
      return 'Mật khẩu có ít nhất 1 số';
    }

    //Ký tự đặc biệt
    if (!value.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'))) {
      return 'Mật khẩu có ít nhất 1 ký tự đặc biệt';
    }

    return null;
  }

  static String? validatePhoneNumber(String? value) {
    if (value == null || value.isEmpty) {
      return 'Vui lòng nhập số điện thoại';
    }

    //
    final phoneRegExp = RegExp(r'^\d{10}$');

    if (!phoneRegExp.hasMatch(value)) {
      return 'Số điện thoại không hợp lệ';
    }

    return null;
  }
}
