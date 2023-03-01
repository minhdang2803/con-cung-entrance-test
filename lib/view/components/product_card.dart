import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_pixels/image_pixels.dart';

import '../style/app_color.dart';
import '../style/app_font.dart';
import 'custom_button.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({
    super.key,
    required this.deviceName,
    required this.rate,
    required this.price,
    required this.imgUrl,
    this.width,
    this.height,
  });
  final double? height;
  final double? width;
  final String deviceName;
  final double rate;
  final String price;
  final String imgUrl;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20.r),
            border: Border.all(color: Colors.black, width: 0.25),
          ),
          width: width,
          child: Column(
            children: [_buildPicture(context), _buildInfo(context)],
          ),
        ),
        Positioned(
            bottom: 50.r,
            left: 5.r,
            child: CustomButton(
              fontWeight: FontWeight.bold,
              suffixIcon: Icons.star,
              iconSize: 15.r,
              height: 20.r,
              width: 60.r,
              fontSize: 10.r,
              color: AppColor.ratingColor,
              title: rate.toString(),
            ))
      ],
    );
  }

  Widget _buildInfo(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10.r),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                deviceName,
                style: AppFont.body,
              ),
              5.verticalSpace,
              Text(
                price,
                style: AppFont.bodySmall.copyWith(fontWeight: FontWeight.bold),
              ),
            ],
          ),
          CustomButton(
            title: "Buy",
            width: 60.w,
            height: 23.h,
            onTap: () {},
          )
        ],
      ),
    );
  }

  Widget _buildPicture(BuildContext context) {
    const loadingLink =
        "https://miro.medium.com/v2/resize:fit:1400/format:webp/0*H3jZONKqRuAAeHnG.jpg";
    const link =
        "https://as2.ftcdn.net/v2/jpg/04/70/29/97/1000_F_470299797_UD0eoVMMSUbHCcNJCdv2t8B2g1GVqYgs.jpg";
    return ClipRRect(
      borderRadius: BorderRadius.circular(20.r),
      child: ImagePixels.container(
        imageProvider: NetworkImage(imgUrl),
        colorAlignment: Alignment.center,
        child: SizedBox(
          height: 150.h,
          width: MediaQuery.of(context).size.width,
          // child: Image.network(
          //   imgUrl,
          //   fit: BoxFit.cover,
          child: FadeInImage.assetNetwork(
            placeholder: "assets/loading.webp",
            placeholderFit: BoxFit.fill,
            image: imgUrl,
            imageErrorBuilder: (context, error, stackTrace) => Image.network(
              width: MediaQuery.of(context).size.width,
              height: 150.r,
              link,
              fit: BoxFit.fill,
            ),
          ),
        ),
      ),
    );
  }
}
