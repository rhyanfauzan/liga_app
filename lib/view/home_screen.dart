import 'package:flutter/material.dart';
import 'package:flutter_bounce/flutter_bounce.dart';
import 'package:get/get.dart';
import 'package:liga_app/model/league_model.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import '../config/app_color.dart';
import '../config/theme.dart';
import '../controller/thesportdb_controller.dart';

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
  List<League> filterleague = [];

  Future getData() async {
    await theSportDbController.fetchData();
    setState(() {
      dataleagues = theSportDbController.leagueModel.leagues;
      filterleague = dataleagues;
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
      filterleague = theSportDbController.leagueModel.leagues;
      filterleague = dataleagues;
    });
  }

  @override
  Widget build(BuildContext context) {
    print('jumlah : ${filterleague.length}');
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
                TextField(
                  onChanged: (value) {
                    value.toLowerCase();

                    setState(() {
                      filterleague = dataleagues.where((name) {
                        var text = name.strLeague.toLowerCase();
                        return text.contains(value);
                      }).toList();
                    });
                  },
                  decoration: const InputDecoration(
                      labelText: 'Search League',
                      suffixIcon: Icon(Icons.search)),
                ),
                const SizedBox(
                  height: 14,
                ),
                Expanded(
                  child: FutureBuilder<LeagueModel?>(
                      future: theSportDbController.fetchData(),
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          return ListView.separated(
                            itemCount: filterleague.length,
                            itemBuilder: (context, index) {
                              return Bounce(
                                duration: durasiBounce,
                                onPressed: () {
                                  Get.toNamed('/clubs', arguments: [
                                    filterleague[index].strLeague
                                  ]);
                                },
                                child: ListTile(
                                  leading: Image.asset(
                                    'assets/images/ic_cup.png',
                                    height: 30,
                                  ),
                                  title: Text(
                                    filterleague[index].strLeague,
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
                        return Center(
                          child: LoadingAnimationWidget.staggeredDotsWave(
                            color: AppColor.secondary,
                            size: 50,
                          ),
                        );
                      }),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
