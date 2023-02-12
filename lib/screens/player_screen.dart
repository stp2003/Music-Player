import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:melody_mate/constants/colors.dart';
import 'package:on_audio_query/on_audio_query.dart';

import '../controller/player_controller.dart';

class Player extends StatelessWidget {
  final List<SongModel> data;

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
            Obx(
              () => Expanded(
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
                    id: data[controller.playIndex.value].id,
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
                child: Obx(
                  () => Column(
                    children: [
                      Text(
                        data[controller.playIndex.value].displayNameWOExt,
                        textAlign: TextAlign.center,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
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
                        data[controller.playIndex.value].artist.toString(),
                        textAlign: TextAlign.center,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                        style: const TextStyle(
                          color: bgDarkColor,
                          fontFamily: 'poppins',
                          fontSize: 17.0,
                        ),
                      ),
                      const SizedBox(
                        height: 12.0,
                      ),
                      Obx(
                        () => Row(
                          children: [
                            Text(
                              controller.position.value,
                              style: const TextStyle(
                                fontSize: 12.0,
                                fontFamily: 'poppins',
                                color: bgDarkColor,
                              ),
                            ),
                            Expanded(
                              child: Slider(
                                inactiveColor: Colors.blueGrey,
                                activeColor: sliderColor,
                                thumbColor: sliderColor,
                                min: const Duration(seconds: 0)
                                    .inSeconds
                                    .toDouble(),
                                max: controller.max.value,
                                value: controller.value.value,
                                onChanged: (newValue) {
                                  controller.changeDurationToSeconds(
                                      newValue.toInt());
                                  newValue = newValue;
                                },
                              ),
                            ),
                            Text(
                              controller.duration.value,
                              style: const TextStyle(
                                fontSize: 12.0,
                                fontFamily: 'poppins',
                                color: bgDarkColor,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 12.0,
                      ),

                      //*** play pause button ->
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          IconButton(
                            onPressed: () {
                              controller.playSongs(
                                data[controller.playIndex.value - 1].uri,
                                controller.playIndex.value - 1,
                              );
                            },
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
                            onPressed: () {
                              controller.playSongs(
                                data[controller.playIndex.value + 1].uri,
                                controller.playIndex.value + 1,
                              );
                            },
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
            ),
          ],
        ),
      ),
    );
  }
}
