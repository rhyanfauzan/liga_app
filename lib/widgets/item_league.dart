import 'package:flutter/material.dart';
import 'package:flutter_bounce/flutter_bounce.dart';
import 'package:get/get.dart';

import '../config/app_color.dart';
import '../config/theme.dart';

class itemLeague extends StatelessWidget {
  itemLeague({
    Key? key,
    required this.nameLeague,
  }) : super(key: key);

  String nameLeague;
  Duration durasiBounce = Duration(milliseconds: 110);

  @override
  Widget build(BuildContext context) {
    double mWidth = (MediaQuery.of(context).size.width / 2) - 30;

    return Container(
      width: mWidth,
      height: 180,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15), color: AppColor.white),
      child: Bounce(
        duration: durasiBounce,
        onPressed: () {
          Get.toNamed('/clubs', arguments: [nameLeague]);
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/soccerlogo.jpg',
                width: 100,
              ),
              Text(
                nameLeague,
                textAlign: TextAlign.center,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: greyTextStyle.copyWith(
                  fontWeight: medium,
                  fontSize: 14,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
