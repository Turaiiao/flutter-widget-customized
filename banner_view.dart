import 'dart:async';
import 'dart:math';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BannerView extends StatefulWidget {
  BannerView(
      {Key key,
      @required this.imageUrlList,
      this.isRandom,
      @required this.height,
      @required this.duration})
      : super(key: key);

  final double height;
  final Duration duration;
  final List<String> imageUrlList;
  final bool isRandom;

  @override
  State<StatefulWidget> createState() => BannerViewState(imageUrlList[0]);
}

class BannerViewState extends State<BannerView> {
  BannerViewState(this.url);

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  String url;

  startTimer() {
    Timer.periodic(widget.duration, (data) {
      setState(() {
        url = widget.imageUrlList[Random().nextInt(widget.imageUrlList.length)];
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.height,
      width: window.physicalSize.width,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8), color: Colors.deepOrange),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: Image.network(url, fit: BoxFit.fill),
      ),
    );
  }
}
