import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import 'app_color.dart';

class AppFont {
  static TextStyle superHeadline = GoogleFonts.ibmPlexSans(
    fontSize: 30.r,
    color: AppColor.textPrimary,
  );
  static TextStyle headline = GoogleFonts.ibmPlexSans(
    fontSize: 26.r,
    color: AppColor.textPrimary,
  );
  static TextStyle subHeadline = GoogleFonts.ibmPlexSans(
    fontSize: 22.r,
    color: AppColor.textPrimary,
  );
  static TextStyle title = GoogleFonts.ibmPlexSans(
    fontSize: 16.r,
    color: AppColor.textPrimary,
  );
  static TextStyle body = GoogleFonts.ibmPlexSans(
    fontSize: 14.r,
    color: AppColor.textPrimary,
  );
  static TextStyle bodySmall = GoogleFonts.ibmPlexSans(
    fontSize: 12.r,
    color: AppColor.textPrimary,
  );
}
