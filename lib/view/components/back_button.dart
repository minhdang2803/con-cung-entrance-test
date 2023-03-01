import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

class BackButtonCustom extends StatefulWidget {
  const BackButtonCustom({super.key, this.borderColor = Colors.transparent});
  final Color? borderColor;

  @override
  State<BackButtonCustom> createState() => _BackButtonCustomState();
}

class _BackButtonCustomState extends State<BackButtonCustom> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: widget.borderColor!),
        borderRadius: BorderRadius.circular(10.r),
        boxShadow: const [
          BoxShadow(
            color: Colors.grey,
            offset: Offset(0.0, 0.5), //(x,y)
            blurRadius: 1.0,
          ),
        ],
      ),
      width: 38.r,
      height: 38.r,
      child: IconButton(
        padding: EdgeInsets.zero,
        icon: Icon(
          Icons.arrow_back_ios,
          size: 18.r,
          weight: 2,
        ),
        onPressed: () {},
      ),
    );
  }
}
