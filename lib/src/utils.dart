// custom wrapper to equals checker
bool isNull(dynamic data) {
  return data == null;
}

String replaceQMark(String v) {
  if (v != '') {
    return v.replaceFirst('&', '?');
  }

  return v;
}
