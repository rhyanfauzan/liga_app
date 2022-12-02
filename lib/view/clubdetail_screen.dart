import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../config/theme.dart';
import '../controller/thesportdb_controller.dart';
import '../widgets/item_detailclub.dart';

class ClubDetailScreen extends GetView<TheSportDbController> {
  //  ClubDetailScreen({Key? key, required this.indeks}) : super(key: key);
  var data = Get.arguments;
  ClubDetailScreen({super.key});
  late TheSportDbController theSportDbController =
      Get.put(TheSportDbController());

  @override
  Widget build(BuildContext context) {
    var dataclubs = theSportDbController.clubModel.teams;
    double mWidth = (MediaQuery.of(context).size.width / 2) - 80;
    String? strTeamBanner = data[0];
    String? strTeam = data[1];
    String? strCountry = data[2];
    String? intFormedYear = data[3];
    String? strLeague = data[4];
    String? strTeamBadge = data[5];
    String? strStadiumThumb = data[6];
    String? strStadium = data[7];
    String? strTeamJersey = data[8];
    String? strTeamFanart1 = data[9];
    String? strDescriptionEN = data[10];

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Detail Club $strTeam',
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            strTeamBanner != null
                ? Image.network(
                    strTeamBanner,
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
                              '$strTeam',
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
                                      text: '$strCountry',
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
                                      text: '$intFormedYear',
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
                                      text: '$strLeague',
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
                      strTeamBadge != null
                          ? Image.network(
                              strTeamBadge,
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
                          strStadiumThumb != null
                              ? itemDetailClub(
                                  image: strStadiumThumb,
                                  title: 'Stadium',
                                  name: '$strStadium',
                                )
                              : const SizedBox(),
                          strTeamJersey != null
                              ? itemDetailClub(
                                  image: strTeamJersey,
                                  title: 'Jersey',
                                  name: '',
                                )
                              : const SizedBox(),
                          strTeamFanart1 != null
                              ? itemDetailClub(
                                  image: strTeamFanart1,
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
                    '$strDescriptionEN',
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
