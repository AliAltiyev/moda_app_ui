import 'package:flutter/material.dart';

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
      child: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration:  BoxDecoration(
          image: DecorationImage(image: AssetImage(widget.imgPath),fit: BoxFit.cover)
        ),
      ),
    );
  }
}
