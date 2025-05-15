String formatPublishedDate(String isoDate) {
  try {
    final date = DateTime.parse(isoDate);
    return "${getMonthName(date.month)} ${date.day}";
  } catch (e) {
    return '';
  }
}

String getMonthName(int month) {
  const months = [
    '',
    'Jan',
    'Feb',
    'Mar',
    'Apr',
    'May',
    'Jun',
    'Jul',
    'Aug',
    'Sep',
    'Oct',
    'Nov',
    'Dec',
  ];
  return months[month];
}
