import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../widgets/item_club.dart';

class ClubsScreen extends StatelessWidget {
  ClubsScreen({super.key});
  var data = Get.arguments;

  @override
  Widget build(BuildContext context) {
    String nameLeague = data[0];

    return Scaffold(
      appBar: AppBar(
        title: Text(
          nameLeague,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            itemClub(
              nameClub: 'Arsenal',
              imageClub: 'assets/images/logoclub.png',
              locClub: 'England',
              yearClub: '1892',
            ),
            itemClub(
              nameClub: 'Tarkam Fc',
            )
          ],
        ),
      ),
    );
  }
}
