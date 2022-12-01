import 'package:flutter/material.dart';
import 'package:liga_app/config/app_color.dart';

import '../config/theme.dart';
import '../widgets/item_detailclub.dart';

class ClubDetailScreen extends StatelessWidget {
  const ClubDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double mWidth = (MediaQuery.of(context).size.width / 2) - 80;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Detail Club',
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(
            'assets/images/banner.jpg',
            width: double.infinity,
          ),
          const SizedBox(
            height: 30,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Arsenal',
                            style: blackTextStyle.copyWith(
                              fontWeight: bold,
                              fontSize: 34,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          RichText(
                            text: TextSpan(
                                text: 'Country : ',
                                style: blackTextStyle.copyWith(
                                  fontWeight: medium,
                                  fontSize: 14,
                                ),
                                children: <TextSpan>[
                                  TextSpan(
                                    text: 'England',
                                    style: greyTextStyle.copyWith(
                                      fontWeight: regular,
                                      fontSize: 12,
                                    ),
                                  )
                                ]),
                          ),
                          RichText(
                            text: TextSpan(
                                text: 'Since : ',
                                style: blackTextStyle.copyWith(
                                  fontWeight: medium,
                                  fontSize: 14,
                                ),
                                children: <TextSpan>[
                                  TextSpan(
                                    text: '1892',
                                    style: greyTextStyle.copyWith(
                                      fontWeight: regular,
                                      fontSize: 12,
                                    ),
                                  )
                                ]),
                          ),
                          RichText(
                            text: TextSpan(
                                text: 'League : ',
                                style: blackTextStyle.copyWith(
                                  fontWeight: medium,
                                  fontSize: 14,
                                ),
                                children: <TextSpan>[
                                  TextSpan(
                                    text: 'English Premier League',
                                    style: greyTextStyle.copyWith(
                                      fontWeight: regular,
                                      fontSize: 12,
                                    ),
                                  )
                                ]),
                          ),
                        ],
                      ),
                    ),
                    Image.asset(
                      'assets/images/logoclub.png',
                      height: mWidth,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 22,
                ),
                SizedBox(
                  height: 150,
                  child: ListView(
                      physics: BouncingScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      children: [
                        itemDetailClub(
                          image: 'assets/images/jersey.png',
                          title: 'Jersey',
                          name: '',
                        ),
                        itemDetailClub(
                          image: 'assets/images/stadium.jpg',
                          title: 'Stadium',
                          name: 'Emirates Stadium',
                        ),
                        itemDetailClub(
                          image: 'assets/images/supporter.jpg',
                          title: 'Supporter',
                          name: '',
                        ),
                      ]),
                ),
                const SizedBox(
                  height: 32,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () {},
                      child: Image.asset(
                        'assets/images/ic_web.png',
                        width: 25,
                        height: 25,
                        fit: BoxFit.cover,
                      ),
                    ),
                    const SizedBox(
                      width: 12,
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: Image.asset(
                        'assets/images/ic_fb.png',
                        width: 25,
                        height: 25,
                        fit: BoxFit.cover,
                      ),
                    ),
                    const SizedBox(
                      width: 12,
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: Image.asset(
                        'assets/images/ic_ig.png',
                        width: 25,
                        height: 25,
                        fit: BoxFit.cover,
                      ),
                    ),
                    const SizedBox(
                      width: 12,
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: Image.asset(
                        'assets/images/ic_twitter.png',
                        width: 25,
                        height: 25,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 22,
                ),
                Text(
                  'About Club :',
                  style: blackTextStyle.copyWith(
                    fontWeight: bold,
                    fontSize: 14,
                  ),
                ),
                Text(
                  'Deskripsi',
                  style: greyTextStyle.copyWith(
                    fontWeight: regular,
                    fontSize: 12,
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
