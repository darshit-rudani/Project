import 'package:flutter/foundation.dart';

class Data {
  final int id;
  final String imageUrl;
  final String title;
  final String title1;

  const Data({
    @required this.id,
    @required this.title,
    @required this.imageUrl,
    @required this.title1,
  });
}

const Dummydata = const [
  Data(
    id:0,
    title: 'The perfect product for skin type.',
    imageUrl: 'image/1.png',
    title1: 'Find products that work for your skin.',
  ),
  Data(
    id: 1,
    title: 'Daily routine and skincare guides.',
    imageUrl: 'image/2.png',
    title1: 'Notifications and reminders just for you.',
  ),
  Data(
    id: 2,
    title: 'Connect with other skincare lovers.',
    imageUrl: 'image/3.png',
    title1: 'Engage with others in the community.',
  ),
];
