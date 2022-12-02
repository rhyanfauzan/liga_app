import 'package:flutter/material.dart';
import 'package:flutter_bounce/flutter_bounce.dart';
import 'package:get/get.dart';
import 'package:liga_app/model/league_model.dart';

import '../config/theme.dart';
import '../controller/thesportdb_controller.dart';
import '../widgets/item_league.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late TheSportDbController theSportDbController =
      Get.put(TheSportDbController());
  Duration durasiBounce = const Duration(milliseconds: 110);
  late Future<LeagueModel?> futureLeague;
  List<League> dataleagues = [];

  Future getData() async {
    await theSportDbController.fetchData();
    setState(() {
      dataleagues = theSportDbController.leagueModel.leagues;
    });
  }

  @override
  void initState() {
    getData();
    super.initState();
  }

  Future refresh() async {
    await theSportDbController.fetchData();
    setState(() {
      dataleagues = theSportDbController.leagueModel.leagues;
    });
  }

  @override
  Widget build(BuildContext context) {
    print('jumlah : ${dataleagues.length}');
    return Scaffold(
      body: SafeArea(
        child: RefreshIndicator(
          onRefresh: refresh,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 14,
                ),
                Text(
                  'All Leagues',
                  style: blackTextStyle.copyWith(
                    fontWeight: bold,
                    fontSize: 24,
                  ),
                ),
                const SizedBox(
                  height: 14,
                ),
                Expanded(
                  child: Container(
                      child: FutureBuilder<LeagueModel?>(
                          future: theSportDbController.fetchData(),
                          builder: (context, snapshot) {
                            if (snapshot.hasData) {
                              return ListView.separated(
                                itemCount: dataleagues.length,
                                itemBuilder: (context, index) {
                                  return Bounce(
                                    duration: durasiBounce,
                                    onPressed: () {
                                      Get.toNamed('/clubs', arguments: [
                                        dataleagues[index].strLeague
                                      ]);
                                    },
                                    child: ListTile(
                                      leading: Image.asset(
                                        'assets/images/ic_cup.png',
                                        height: 30,
                                      ),
                                      title: Text(
                                        dataleagues[index].strLeague,
                                        style: blackTextStyle.copyWith(
                                          fontWeight: medium,
                                          fontSize: 13,
                                        ),
                                      ),
                                    ),
                                  );
                                },
                                separatorBuilder: (context, index) {
                                  return const Divider();
                                },
                              );
                            } else {
                              print('hasError');
                            }
                            return const Center(
                                child: CircularProgressIndicator());
                          })),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
