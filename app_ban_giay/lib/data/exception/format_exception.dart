class TFormatException implements Exception {
  final String message;

  const TFormatException(
      [this.message =
          'An unexpected format error ocurred. Please check your input.']);

  factory TFormatException.fromMessage(String message) {
    return TFormatException(message);
  }

  String get formattedMessage => message;

  factory TFormatException.fromCode(String code) {
    switch (code) {
      case 'invalid-email-format':
        return const TFormatException('Skfjdaklsjaklsdj');
      case 'invalid-email-format':
        return const TFormatException('Skfjdaklsjaklsdj');
      case 'invalid-email-format':
        return const TFormatException('Skfjdaklsjaklsdj');
      case 'invalid-email-format':
        return const TFormatException('Skfjdaklsjaklsdj');
      case 'invalid-email-format':
        return const TFormatException('Skfjdaklsjaklsdj');
      case 'invalid-email-format':
        return const TFormatException('Skfjdaklsjaklsdj');
      case 'invalid-email-format':
        return const TFormatException('Skfjdaklsjaklsdj');
      default:
        return const TFormatException('Skfjdaklsjaklsdj');
    }
  }
}
