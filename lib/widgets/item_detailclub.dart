import 'package:flutter/material.dart';

import '../config/app_color.dart';
import '../config/theme.dart';

class itemDetailClub extends StatelessWidget {
  itemDetailClub({
    Key? key,
    required this.image,
    required this.title,
    this.name = '',
  }) : super(key: key);

  String image;
  String title;
  String? name;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 10.0),
      child: Container(
        width: 120,
        decoration: BoxDecoration(
          color: AppColor.white,
          borderRadius: BorderRadius.circular(14),
        ),
        child: Padding(
          padding: const EdgeInsets.only(top: 12),
          child: Column(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(14),
                child: Image.asset(
                  image,
                  width: 100,
                  height: 80,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              Text(
                title,
                textAlign: TextAlign.center,
                style: blackTextStyle.copyWith(
                  fontWeight: bold,
                  fontSize: 14,
                ),
              ),
              Text(
                '$name',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.center,
                style: greyTextStyle.copyWith(
                  fontWeight: regular,
                  fontSize: 12,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
