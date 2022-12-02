import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../config/theme.dart';
import '../controller/thesportdb_controller.dart';
import '../widgets/item_detailclub.dart';

class ClubDetailScreen extends GetView<TheSportDbController> {
  //  ClubDetailScreen({Key? key, required this.indeks}) : super(key: key);
  var datac = Get.arguments;
  ClubDetailScreen({super.key});
  late TheSportDbController theSportDbController =
      Get.put(TheSportDbController());

  @override
  Widget build(BuildContext context) {
    var dataclubs = theSportDbController.clubModel.teams;
    double mWidth = (MediaQuery.of(context).size.width / 2) - 80;
    int indeks = datac[0];
    // print(Get.arguments['indeks']);
    print('indeks $indeks');

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Detail Club ${dataclubs[indeks].strTeam}',
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            dataclubs[indeks].strTeamBanner != null
                ? Image.network(
                    '${dataclubs[indeks].strTeamBanner}',
                    width: double.infinity,
                  )
                : const SizedBox(),
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
                              '${dataclubs[indeks].strTeam}',
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
                                      text: '${dataclubs[indeks].strCountry}',
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
                                      text:
                                          '${dataclubs[indeks].intFormedYear}',
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
                                      text: '${dataclubs[indeks].strLeague}',
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
                      dataclubs[indeks].strTeamBadge != null
                          ? Image.network(
                              '${dataclubs[indeks].strTeamBadge}',
                              height: mWidth,
                            )
                          : Image.asset(
                              'assets/images/soccerlogo.jpg',
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
                        physics: const BouncingScrollPhysics(),
                        scrollDirection: Axis.horizontal,
                        children: [
                          dataclubs[indeks].strStadiumThumb != null
                              ? itemDetailClub(
                                  image: '${dataclubs[indeks].strStadiumThumb}',
                                  title: 'Stadium',
                                  name: '${dataclubs[indeks].strStadium}',
                                )
                              : const SizedBox(),
                          dataclubs[indeks].strTeamJersey != null
                              ? itemDetailClub(
                                  image: '${dataclubs[indeks].strTeamJersey}',
                                  title: 'Jersey',
                                  name: '',
                                )
                              : const SizedBox(),
                          dataclubs[indeks].strTeamFanart1 != null
                              ? itemDetailClub(
                                  image: '${dataclubs[indeks].strTeamFanart1}',
                                  title: 'Supporter',
                                  name: '',
                                )
                              : const SizedBox(),
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
                    '${dataclubs[indeks].strDescriptionEN}',
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
      ),
    );
  }
}
