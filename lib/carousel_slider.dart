import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_application_1/screen_two.dart';
import 'package:pretty_qr_code/pretty_qr_code.dart';

class CarouselSliderScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: Text(
          "Carousel Slider Screen",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            CarouselSlider(
              options: CarouselOptions(
                height: 400.0,
                autoPlay: true,
              ),
              items: [1, 2, 3, 4, 5].map((i) {
                return Builder(
                  builder: (BuildContext context) {
                    return InkWell(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (_) => ScreenTwo()));
                      },
                      child: Container(
                          width: MediaQuery.of(context).size.width,
                          margin: EdgeInsets.symmetric(horizontal: 5.0),
                          decoration: BoxDecoration(color: Colors.amber),
                          child: Image.network(
                            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTc9APxkj0xClmrU3PpMZglHQkx446nQPG6lA&s",
                            height: 400,
                            fit: BoxFit.cover,
                          )),
                    );
                  },
                );
              }).toList(),
            ),
            SizedBox(
              height: 30,
            ),
            SizedBox(
              height: 300,
              width: 300,
              child: PrettyQrView.data(
                data: 'https://www.youtube.com/watch?v=Jib64cVqo24',
                decoration: const PrettyQrDecoration(
                    // background: Colors.purpleAccent,

                    ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
