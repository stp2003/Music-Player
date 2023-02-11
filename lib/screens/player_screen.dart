import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:melody_mate/constants/colors.dart';
import 'package:on_audio_query/on_audio_query.dart';

import '../controller/player_controller.dart';

class Player extends StatelessWidget {
  final SongModel data;

  const Player({
    Key? key,
    required this.data,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //***
    var controller = Get.find<PlayerController>();

    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(8.0, 8.0, 8.0, 0),
        child: Column(
          children: [
            //***
            Expanded(
              child: Container(
                clipBehavior: Clip.antiAliasWithSaveLayer,
                height: 300.0,
                width: 300.0,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.grey,
                ),
                alignment: Alignment.center,
                child: QueryArtworkWidget(
                  id: data.id,
                  type: ArtworkType.AUDIO,
                  artworkHeight: double.infinity,
                  artworkWidth: double.infinity,
                  nullArtworkWidget: const Icon(
                    Icons.music_note,
                    size: 48.0,
                    color: whiteColor,
                  ),
                ),
              ),
            ),

            const SizedBox(
              height: 10.0,
            ),

            //***
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(8.0),
                alignment: Alignment.center,
                decoration: const BoxDecoration(
                  color: Colors.white70,
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(
                      20.0,
                    ),
                  ),
                ),

                //*** name of music ->
                child: Column(
                  children: [
                    Text(
                      data.displayNameWOExt,
                      style: const TextStyle(
                        color: bgDarkColor,
                        fontFamily: 'poppins_bold',
                        fontSize: 22.0,
                      ),
                    ),
                    const SizedBox(
                      height: 12.0,
                    ),
                    Text(
                      data.artist.toString(),
                      style: const TextStyle(
                        color: bgDarkColor,
                        fontFamily: 'poppins',
                        fontSize: 17.0,
                      ),
                    ),
                    const SizedBox(
                      height: 12.0,
                    ),
                    Row(
                      children: [
                        const Text(
                          '00:00',
                          style: TextStyle(
                            fontSize: 14.0,
                            fontFamily: 'poppins',
                            color: bgDarkColor,
                          ),
                        ),
                        Expanded(
                          child: Slider(
                            inactiveColor: Colors.blueGrey,
                            activeColor: sliderColor,
                            thumbColor: sliderColor,
                            value: 0.0,
                            onChanged: (newValue) {},
                          ),
                        ),
                        const Text(
                          '04:00',
                          style: TextStyle(
                            fontSize: 14.0,
                            fontFamily: 'poppins',
                            color: bgDarkColor,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 12.0,
                    ),

                    //*** play pause button ->
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.skip_previous_rounded,
                            size: 40.0,
                            color: bgDarkColor,
                          ),
                          splashColor: Colors.cyanAccent,
                        ),
                        Obx(
                          () => CircleAvatar(
                            backgroundColor: bgDarkColor,
                            radius: 35.0,
                            child: Transform.scale(
                              scale: 2.5,
                              child: IconButton(
                                onPressed: () {
                                  if (controller.isPlaying.value) {
                                    controller.audioPlayer.pause();
                                    controller.isPlaying(false);
                                  } else {
                                    controller.audioPlayer.play();
                                    controller.isPlaying(true);
                                  }
                                },
                                icon: controller.isPlaying.value
                                    ? const Icon(
                                        Icons.pause,
                                        color: whiteColor,
                                      )
                                    : const Icon(
                                        Icons.play_arrow_rounded,
                                        color: whiteColor,
                                      ),
                                splashColor: Colors.greenAccent,
                              ),
                            ),
                          ),
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.skip_next_rounded,
                            size: 40.0,
                            color: bgDarkColor,
                          ),
                          splashColor: Colors.blue,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
