import 'package:flutter/material.dart';
import 'package:flutter_bounce/flutter_bounce.dart';
import 'package:get/get.dart';
import 'package:liga_app/controller/thesportdb_controller.dart';
import '../config/theme.dart';
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

  Future getDataClub() async {
    await theSportDbController.fetchData();
    setState(() {
      dataclubs = theSportDbController.clubModel.teams;
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
          child: Expanded(
            child: Container(
                child: FutureBuilder<ClubModel?>(
                    future: theSportDbController.fetchDataClubs(nameLeague),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        return ListView.builder(
                          itemCount: dataclubs.length,
                          itemBuilder: (context, index) {
                            return Bounce(
                              duration: durasiBounce,
                              onPressed: () {
                                Get.toNamed('/clubdetail',
                                    arguments: [dataclubs[index].strLeague]);
                              },
                              child: itemClub(
                                nameClub: '${dataclubs[index].strTeam}',
                                imageClub: dataclubs[index].strTeamBadge,
                                locClub: dataclubs[index].strStadium,
                                yearClub: dataclubs[index].intFormedYear,
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
                      return const Center(child: CircularProgressIndicator());
                    })),
          ),
        ),
      ),
    );
  }
}
