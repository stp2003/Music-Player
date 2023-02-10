import 'package:flutter/material.dart';
import 'package:melody_mate/constants/colors.dart';

class Player extends StatelessWidget {
  const Player({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            //***
            Expanded(
              child: Container(
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.red,
                ),
                alignment: Alignment.center,
                child: const Icon(
                  Icons.music_note,
                ),
              ),
            ),

            const SizedBox(
              height: 15.0,
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
                    const Text(
                      'Music Name',
                      style: TextStyle(
                        color: bgDarkColor,
                        fontFamily: 'poppins_bold',
                        fontSize: 24.0,
                      ),
                    ),
                    const SizedBox(
                      height: 12.0,
                    ),
                    const Text(
                      'Artist Name',
                      style: TextStyle(
                        color: bgDarkColor,
                        fontFamily: 'poppins',
                        fontSize: 19.0,
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
                        CircleAvatar(
                          backgroundColor: bgDarkColor,
                          radius: 35.0,
                          child: Transform.scale(
                            scale: 2.5,
                            child: IconButton(
                              onPressed: () {},
                              icon: const Icon(
                                Icons.play_arrow_rounded,
                                color: whiteColor,
                              ),
                              splashColor: Colors.greenAccent,
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
