import 'package:concung_entrance_test/utils/widget_utils.dart';
import 'package:concung_entrance_test/view/style/app_color.dart';
import 'package:concung_entrance_test/view/style/app_font.dart';
import 'package:concung_entrance_test/view/components/back_button.dart';
import 'package:concung_entrance_test/view_model/product_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_state_notifier/flutter_state_notifier.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

import '../components/product_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    context.read<ProductProvider>().getProduct();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: [
              _buildAppBar(context),
              _buildProductList(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildAppBar(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 20.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              const BackButtonCustom(borderColor: AppColor.primary),
              _buildAppbarTitle(context),
            ],
          ),
          20.horizontalSpace,
          Expanded(
            child: Image.asset(
              "assets/appbar.png",
              fit: BoxFit.contain,
            ),
          )
        ],
      ),
    );
  }

  Widget _buildAppbarTitle(BuildContext context) {
    return Text.rich(
      TextSpan(
        text: "iPad\n",
        children: [
          TextSpan(
              text: "Mini\n",
              style: AppFont.headline.copyWith(
                color: AppColor.primary,
                fontWeight: FontWeight.w700,
                fontSize: 40.r,
              ),
              children: [
                TextSpan(
                  text: "New mini 2022",
                  style: AppFont.title.copyWith(
                    color: AppColor.greyColor,
                    fontWeight: FontWeight.w700,
                  ),
                )
              ])
        ],
        style: AppFont.headline.copyWith(
          fontWeight: FontWeight.w700,
          fontSize: 40.r,
        ),
      ),
    );
  }

  Widget _buildProductList(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          _buildOptionBar(context),
          10.verticalSpace,
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.r),
              child: StateNotifierBuilder(
                stateNotifier: context.read<ProductProvider>(),
                builder: (context, value, child) {
                  if (value.status == ProductStatus.loading) {
                    return const Center(
                      child: CircularProgressIndicator(color: AppColor.primary),
                    );
                  }
                  if (value.status == ProductStatus.fail) {
                    WidgetUtil.showToast(value.errorMessage!);
                  }
                  if (value.status == ProductStatus.done) {
                    return ListView.separated(
                      shrinkWrap: true,
                      padding: EdgeInsets.zero,
                      itemBuilder: (context, index) {
                        if (index <= value.listProducts!.length - 1) {
                          final item = value.listProducts![index];
                          return ProductCard(
                            width: 346.w,
                            deviceName: item.deviceName,
                            rate: item.rate,
                            price: item.price,
                            imgUrl: item.imgUrl,
                          );
                        } else {
                          return 5.verticalSpace;
                        }
                      },
                      separatorBuilder: (context, index) => 5.verticalSpace,
                      itemCount: value.listProducts!.length + 1,
                    );
                  }
                  return Center(
                    child: Text(
                      "No product data!",
                      style: AppFont.title,
                    ),
                  );
                },
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildOptionBar(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text(
            "Sort by",
            style: AppFont.title,
          ),
          20.horizontalSpace,
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Popular",
                  style: AppFont.title.copyWith(
                    color: AppColor.primary,
                  )),
              5.horizontalSpace,
              FaIcon(
                FontAwesomeIcons.chevronDown,
                size: 10.r,
              )
            ],
          ),
          const Expanded(child: SizedBox()),
          SvgPicture.asset("assets/slider.svg")
        ],
      ),
    );
  }
}
