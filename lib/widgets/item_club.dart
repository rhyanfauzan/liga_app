import 'package:flutter/material.dart';
import 'package:flutter_bounce/flutter_bounce.dart';
import 'package:get/get.dart';

import '../config/app_color.dart';
import '../config/theme.dart';

class itemClub extends StatelessWidget {
  itemClub({
    Key? key,
    required this.nameClub,
    this.yearClub = '',
    this.locClub = '',
    this.imageClub,
  }) : super(key: key);

  String nameClub;
  String? yearClub;
  String? locClub;
  String? imageClub;

  Duration durasiBounce = Duration(milliseconds: 110);

  @override
  Widget build(BuildContext context) {
    return Bounce(
      duration: durasiBounce,
      onPressed: () {
        Get.toNamed('/clubdetail');
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: AppColor.white,
        ),
        margin: const EdgeInsets.only(bottom: 10.0),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              imageClub != null
                  ? Image.network(
                      imageClub!,
                      width: 40,
                      height: 40,
                    )
                  : Image.asset(
                      'assets/images/soccerlogo.jpg',
                      width: 40,
                      height: 40,
                    ),
              const SizedBox(
                width: 16,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    nameClub,
                    textAlign: TextAlign.center,
                    overflow: TextOverflow.ellipsis,
                    style: blackTextStyle.copyWith(
                      fontWeight: bold,
                      fontSize: 16,
                    ),
                  ),
                  Text(
                    '$yearClub',
                    textAlign: TextAlign.center,
                    style: greyTextStyle.copyWith(
                      fontWeight: regular,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
              Expanded(
                child: Text(
                  '$locClub',
                  textAlign: TextAlign.end,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: greyTextStyle.copyWith(
                    fontWeight: regular,
                    fontSize: 12,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
