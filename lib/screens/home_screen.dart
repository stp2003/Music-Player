import 'package:flutter/material.dart';
import 'package:melody_mate/constants/colors.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: bgDarkColor,
        appBar: AppBar(
          backgroundColor: bgDarkColor,
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.search,
                color: whiteColor,
              ),
            ),
          ],
          leading: const Icon(
            Icons.sort_rounded,
            color: whiteColor,
          ),
          title: const Text(
            'Melody Mate',
            style: TextStyle(
              fontFamily: 'poppins_bold',
              fontSize: 19.5,
              color: whiteColor,
              letterSpacing: 1.2,
            ),
          ),
          centerTitle: true,
        ),

        //??
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: ListView.builder(
            physics: const BouncingScrollPhysics(),
            itemCount: 100,
            itemBuilder: (BuildContext context, int index) {
              return Container(
                margin: const EdgeInsets.only(bottom: 8.0),
                child: ListTile(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18.0),
                  ),
                  tileColor: bgColor,
                  title: const Text(
                    'Music Name',
                    style: TextStyle(
                      fontFamily: 'poppins_bold',
                      fontSize: 16.5,
                      color: whiteColor,
                      letterSpacing: 1.2,
                    ),
                  ),
                  subtitle: const Text(
                    'Artist Name',
                    style: TextStyle(
                      fontFamily: 'poppins',
                      fontSize: 12.5,
                      color: whiteColor,
                      letterSpacing: 0.8,
                    ),
                  ),
                  leading: const Icon(
                    Icons.music_note,
                    color: whiteColor,
                    size: 32.0,
                  ),
                  trailing: const Icon(
                    Icons.play_arrow_sharp,
                    color: whiteColor,
                    size: 26.0,
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
