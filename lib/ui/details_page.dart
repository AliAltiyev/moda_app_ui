import 'dart:math';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DetailsPage extends StatefulWidget {
  var imgPath;

  DetailsPage({required this.imgPath, Key? key}) : super(key: key);

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  @override
  Widget build(BuildContext context) {
    return  Hero(
      transitionOnUserGestures: true,
      tag: widget.imgPath,
      child: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(widget.imgPath), fit: BoxFit.cover)),
          ),
          Positioned.fill(
            child: Padding(
              padding: const EdgeInsets.only(bottom: 20, right: 16, left: 16),
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Material(
                  elevation: 10,
                  borderRadius: const BorderRadius.all(Radius.circular(16)),
                  child: Container(
                    height: 200,
                    width: double.infinity,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                height: 130,
                                width: 100,
                                decoration: BoxDecoration(
                                    border: Border.all(
                                      color: Colors.black.withOpacity(0.3),
                                    ),
                                    borderRadius:
                                        const BorderRadius.all(Radius.circular(16)),
                                    image: const DecorationImage(
                                        image: AssetImage("assets/dress.jpg"))),
                              ),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                    width:
                                        MediaQuery.of(context).size.width - 170,
                                    child: Text(
                                      "CHAIN BELT SILK MINI DRESS",
                                      style: GoogleFonts.actor(
                                        textStyle: const TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w600),
                                      ),
                                    )),
                                const SizedBox(
                                  height: 20,
                                ),
                                Text(
                                  "Luis Vitton",
                                  style: GoogleFonts.antic(
                                      textStyle: TextStyle(
                                          color:
                                              Colors.black.withOpacity(0.5))),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Container(
                                  height: 30,
                                  width:
                                      MediaQuery.of(context).size.width - 170,
                                  child: const Text(
                                      "This chic mini dress is clean and casual in a "
                                      "relaxed-fit A-line silhouette crafted from airy silk crepe de chine."
                                      " The neckline and daring scoop back are studded with edgy eyelet details and finished with "
                                      "a golden chain belt for a rebellious finishing touch. An LV Initials tab signs the front."),
                                ),
                              ],
                            )
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 20, top: 8),
                          child: Text(
                            "${Random().nextInt(3000)} \$",
                            style: GoogleFonts.aBeeZee(
                                textStyle: const TextStyle(
                                    fontSize: 24, fontWeight: FontWeight.w700)),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
