import 'package:flutter/material.dart';
import 'package:flutter_bounce/flutter_bounce.dart';
import 'package:get/get.dart';
import 'package:liga_app/controller/thesportdb_controller.dart';
import 'package:liga_app/view/clubdetail_screen.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import '../config/app_color.dart';
import '../model/club_model.dart';
import '../widgets/item_club.dart';

class ClubsScreen extends StatefulWidget {
  const ClubsScreen({super.key});

  @override
  State<ClubsScreen> createState() => _ClubsScreenState();
}

class _ClubsScreenState extends State<ClubsScreen> {
  late TheSportDbController theSportDbController =
      Get.put(TheSportDbController());
  var data = Get.arguments;
  Duration durasiBounce = const Duration(milliseconds: 110);
  late Future<ClubModel?> futureClub;
  List<Team> dataclubs = [];
  List<Team> filterclubs = [];

  Future getDataClub() async {
    await theSportDbController.fetchData();
    setState(() {
      dataclubs = theSportDbController.clubModel.teams;
      filterclubs = dataclubs;
    });
  }

  @override
  void initState() {
    getDataClub();
    super.initState();
  }

  Future refresh() async {
    await theSportDbController.fetchDataClubs(data[0]);
    setState(() {
      dataclubs = theSportDbController.clubModel.teams;
      filterclubs = dataclubs;
    });
  }

  @override
  Widget build(BuildContext context) {
    String nameLeague = data[0];
    print('jumlah di clubs : ${dataclubs.length}');

    return Scaffold(
      appBar: AppBar(
        title: Text(
          nameLeague,
        ),
      ),
      body: RefreshIndicator(
        onRefresh: refresh,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              TextField(
                onChanged: (value) {
                  value.toLowerCase();

                  setState(() {
                    filterclubs = dataclubs.where((name) {
                      var text = name.strTeam!.toLowerCase();
                      return text.contains(value);
                    }).toList();
                  });
                },
                decoration: const InputDecoration(
                    labelText: 'Search Team', suffixIcon: Icon(Icons.search)),
              ),
              const SizedBox(
                height: 14,
              ),
              Expanded(
                child: FutureBuilder<ClubModel?>(
                    future: theSportDbController.fetchDataClubs(nameLeague),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        return ListView.builder(
                          itemCount: filterclubs.length,
                          itemBuilder: (context, index) {
                            return Bounce(
                              duration: durasiBounce,
                              onPressed: () {
                                print('kirim indeks $index');
                                Get.toNamed('/clubdetail', arguments: [
                                  filterclubs[index].strTeamBanner,
                                  filterclubs[index].strTeam,
                                  filterclubs[index].strCountry,
                                  filterclubs[index].intFormedYear,
                                  filterclubs[index].strLeague,
                                  filterclubs[index].strTeamBadge,
                                  filterclubs[index].strStadiumThumb,
                                  filterclubs[index].strStadium,
                                  filterclubs[index].strTeamJersey,
                                  filterclubs[index].strTeamFanart1,
                                  filterclubs[index].strDescriptionEN,
                                  ]);
                                
                              },
                              child: itemClub(
                                nameClub: '${filterclubs[index].strTeam}',
                                imageClub: filterclubs[index].strTeamBadge,
                                locClub: filterclubs[index].strStadium,
                                yearClub: filterclubs[index].intFormedYear,
                              ),
                            );
                          },
                          // separatorBuilder: (context, index) {
                          //   return const Divider();
                          // },
                        );
                      } else {
                        print('hasError');
                      }
                      return Center(
                          child: LoadingAnimationWidget.fourRotatingDots(
                        color: AppColor.secondary,
                        size: 50,
                      ));
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
