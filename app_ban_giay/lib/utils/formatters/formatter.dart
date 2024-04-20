import 'package:intl/intl.dart';


class TFormatter{

  static String formatDate(DateTime? date){
    date ??= DateTime.now();
    return DateFormat('dd-MM-yyyy').format(date);
  }

  static String formatCurrency(double amount){
    return NumberFormat.currency(locale: 'vi_VN', symbol: 'đ',decimalDigits: 2).format(amount);
  }

  static String formatPhoneNumber(String phoneNumber){
    if(phoneNumber.length == 10){
      return '(${phoneNumber.substring(0, 3)}) ${phoneNumber.substring(3, 6)} ${phoneNumber.substring(6)}';
    }
    else if(phoneNumber.length == 11){
      return '(${phoneNumber.substring(0, 4)}) ${phoneNumber.substring(4, 7)} ${phoneNumber.substring(7)}';
    }
    return phoneNumber;
  }


  static String internationalFormatPhoneNumber(String phoneNumber){
    //Xóa mọi ký tự không phải số
    var digitsOnly = phoneNumber.replaceAll(RegExp(r'\D'), '');

    //Trích xuất mã quốc gia từ ký tự số
    String countryCode = '+${digitsOnly.substring(0, 2)}';
    digitsOnly = digitsOnly.substring(2);

    //Thêm các số còn lại cho phù hợp
    final formatterNumber = StringBuffer();
    formatterNumber.write('($countryCode) ');

    int i = 0;
    while (i < digitsOnly.length){
      int groupLength = 2;
      if(i == 0 && countryCode == '+1'){
        groupLength = 3;
      }

      int end = i + groupLength;
      formatterNumber.write(digitsOnly.substring(i, end));

      if (end < digitsOnly.length){
        formatterNumber.write(' ');
      }
      i = end;
    }
    return phoneNumber;
  }
}