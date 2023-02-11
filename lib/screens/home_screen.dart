import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:melody_mate/constants/colors.dart';
import 'package:melody_mate/controller/player_controller.dart';
import 'package:melody_mate/screens/player_screen.dart';
import 'package:on_audio_query/on_audio_query.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(PlayerController());

    return Scaffold(
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
      body: FutureBuilder<List<SongModel>>(
        future: controller.audioQuery.querySongs(
          ignoreCase: true,
          orderType: OrderType.ASC_OR_SMALLER,
          sortType: null,
          uriType: UriType.EXTERNAL,
        ),
        builder: (BuildContext context, snapshot) {
          if (snapshot.data == null) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.data!.isEmpty) {
            return const Center(
              child: Text(
                'No songs found!',
              ),
            );
          } else {
            return Padding(
              padding: const EdgeInsets.all(10.0),
              child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                itemCount: snapshot.data!.length,
                // itemCount: 100,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    margin: const EdgeInsets.only(bottom: 12.0),
                    child: Obx(
                      () => ListTile(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18.0),
                        ),
                        tileColor: bgColor,
                        title: Text(
                          snapshot.data![index].displayNameWOExt,
                          style: const TextStyle(
                            fontFamily: 'poppins_bold',
                            fontSize: 16.5,
                            color: whiteColor,
                            letterSpacing: 1.2,
                          ),
                        ),
                        subtitle: Text(
                          '${snapshot.data![index].artist}',
                          style: const TextStyle(
                            fontFamily: 'poppins',
                            fontSize: 12.5,
                            color: whiteColor,
                            letterSpacing: 0.8,
                          ),
                        ),

                        //**** leading photo if any ->
                        leading: QueryArtworkWidget(
                          id: snapshot.data![index].id,
                          type: ArtworkType.AUDIO,
                          nullArtworkWidget: const Icon(
                            Icons.music_note,
                            color: whiteColor,
                            size: 32.0,
                          ),
                        ),

                        //** show only when a song is selected ->
                        trailing: controller.playIndex.value == index &&
                                controller.isPlaying.value
                            ? const Icon(
                                Icons.play_arrow_sharp,
                                color: whiteColor,
                                size: 26.0,
                              )
                            : null,

                        //??? for playing music ->
                        onTap: () {
                          Get.to(
                            () => Player(
                              data: snapshot.data![index],
                            ),
                            transition: Transition.downToUp,
                          );
                          controller.playSongs(
                            snapshot.data![index].uri,
                            index,
                          );
                        },
                      ),
                    ),
                  );
                },
              ),
            );
          }
        },
      ),
    );
  }
}
