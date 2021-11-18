// ignore_for_file: unnecessary_const, avoid_unnecessary_containers, unnecessary_string_interpolations

import 'package:actu221/configs/colors_by_dii.dart';
import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class TopDirectVideoWidget extends StatefulWidget {
  const TopDirectVideoWidget({ Key? key }) : super(key: key);

  @override
  _TopDirectVideoWidgetState createState() => _TopDirectVideoWidgetState();
}

class _TopDirectVideoWidgetState extends State<TopDirectVideoWidget> {
  // ignore: prefer_final_fields, unused_field
  YoutubePlayerController controller = YoutubePlayerController(
    initialVideoId: 'uForDuTmK2U',
    flags: const YoutubePlayerFlags(
        autoPlay: false,
        mute: false,

    ),
);
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {  
      // ignore: sized_box_for_whitespace
      return Container(
        height: constraints.maxHeight,
        width: constraints.maxWidth,
        color: blanc,
        child: Stack(
          children: [
           // ignore: sized_box_for_whitespace
            Container(
                height: constraints.maxHeight ,
                width: constraints.maxWidth ,
                child: YoutubePlayer(
                        controller: controller,
                        showVideoProgressIndicator: true,
                       liveUIColor: Colors.amber,
                       
                    ),
                
            ),  

            Positioned(
              bottom: 0,
              child: Container(
              height: constraints.maxHeight * .2,
              width: constraints.maxWidth,
              color: blanc,
              child: Row(
                children: [
                  const SizedBox(width: 16,),
                  Container(
                    height: 10,
                    width: 10,
                    // ignore: prefer_const_constructors
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(10)),
                      color: rouge
                    ),
                  ),
                  const SizedBox(width: 8,),
                  Text( " discour à la nation ".toUpperCase() ,style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: noir
                  ),)
                ],
              ),
            )),

          ],
        ),
      );
    },
    );
  }
}