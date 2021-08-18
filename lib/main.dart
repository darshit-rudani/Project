import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'data.dart';

void main() {
  runApp(
    MyApp(),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      darkTheme: ThemeData.light(),
      debugShowCheckedModeBanner: false,
      home: CarouselWithIndicatorDemo(),
    );
  }
}

final List<Widget> imageSliders = Dummydata.map(
  (item) => Container(

    child: Stack(
      children: <Widget>[
        Image.asset(
          item.imageUrl,
          fit: BoxFit.fill,
          height: 500,
        ),
        new Positioned(
          right: 170.0,
          bottom: -20.0,
          child: FloatingActionButton(
            backgroundColor: Colors.white,
            child: Icon(
              Icons.favorite_border,
              color: Colors.orange,
              size: 24.0,
            ),
          ),
        ),
      ],
    ),
  ),
).toList();

final List<Widget> textSlide = Dummydata.map(
  (item) => Container(
    child: Container(
      margin: EdgeInsets.only(left: 50, right: 50),
      child: Stack(
        children: <Widget>[
          Text(
            item.title,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 35,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    ),
  ),
).toList();

final List<Widget> textSlide2 = Dummydata.map(
  (item) => Container(
    child: Container(
      child: Stack(
        children: <Widget>[
          Center(
            child: Text(
              item.title1,
            ),
          ),
        ],
      ),
    ),
  ),
).toList();

class CarouselWithIndicatorDemo extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _CarouselWithIndicatorState();
  }
}

class _CarouselWithIndicatorState extends State<CarouselWithIndicatorDemo> {
  int _current = 0;
  final CarouselController _controller = CarouselController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        Container(
          child: CarouselSlider(
            items: imageSliders,
            carouselController: _controller,
            options: CarouselOptions(
              height: 420,
              viewportFraction: 1.0,
              enlargeCenterPage: false,
              autoPlay: false,
              onPageChanged: (index, reason) {
                setState(
                  () {
                    _current = index;
                  },
                );
              },
            ),
          ),
        ),
        SizedBox(
          height: 30,
        ),
        Expanded(
          child: CarouselSlider(
            items: textSlide,
            carouselController: _controller,
            options: CarouselOptions(
              height: 450,
              scrollDirection: Axis.vertical,
              viewportFraction: 1.0,
              enlargeCenterPage: false,
              autoPlay: false,
              onPageChanged: (index, reason) {
                setState(
                  () {
                    _current = index;
                  },
                );
              },
            ),
          ),
        ),
        Expanded(
          child: CarouselSlider(
            items: textSlide2,
            carouselController: _controller,
            options: CarouselOptions(
              height: 420,
              scrollDirection: Axis.vertical,
              viewportFraction: 1.0,
              enlargeCenterPage: false,
              autoPlay: false,
              onPageChanged: (index, reason) {
                setState(
                  () {
                    _current = index;
                  },
                );
              },
            ),
          ),
        ),
        Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: Dummydata.asMap().entries.map((entry) {
              return GestureDetector(
                onTap: () => _controller.animateToPage(entry.key),
                child: Container(
                  width: 12.0,
                  height: 12.0,
                  margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: (Theme.of(context).brightness == Brightness.dark
                            ? Colors.white
                            : Colors.black)
                        .withOpacity(_current == entry.key ? 0.9 : 0.4),
                  ),
                ),
              );
            }).toList(),
          ),
        ),
      ]),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
