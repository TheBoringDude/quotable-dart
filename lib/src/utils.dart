// custom wrapper to equals checker (kind of neater than using ==)
bool isNull(dynamic data) {
  return data == null;
}

// simple function for replacing the string (usefull in params handling)
String replaceQMark(String v) {
  if (v != '') {
    return v.replaceFirst('&', '?');
  }

  return v;
}
