import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:untitled1/main.dart';
import 'package:untitled1/style1.dart';

class Style2 extends StatefulWidget {
  Style2({Key? key}) : super(key: key);

  @override
  State<Style2> createState() => _Style2State();
}

class _Style2State extends State<Style2> {
  int index = 0;
  final CarouselController controller = CarouselController();
  final slideList = [
    Slide(color: Colors.white, heading: 'title1', text: 'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout.'),
    Slide(color: Colors.white, heading: 'title2', text: 'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout.'),
    Slide(color: Colors.white, heading: 'title3', text: 'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout.'),
    Slide(color: Colors.white, heading: 'title4', text: 'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout.'),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: CarouselSlider(
              carouselController: controller,
              options: CarouselOptions(
                  aspectRatio: MediaQuery.of(context).size.aspectRatio,
                  enlargeCenterPage: true,
                  enableInfiniteScroll: false,
                  viewportFraction: 1.0,
                  initialPage: index,
                  onPageChanged: (int newIndex, reason) => setState(() => index = newIndex)
              ),
              items: slideList.map((i) => Column(
                children: [
                  Expanded(
                    child: Container(
                      color: i.color!,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                        i.heading!,
                        style: Theme.of(context).textTheme.headline3
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      i.text!,
                      textAlign: TextAlign.justify,
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                  ),
                ],
              )).toList(),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [0,1,2,3].map((e) => Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                height: e==index ? 20 : 10,
                width: e==index? 20 : 10,
                child: Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: e==index ? Colors.pink : Colors.grey,
                  ),
                ),
              ),
            )).toList(),
          ),
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: SizedBox(
            width: 80.0,
            height: 80.0,
            child: Stack(
              fit: StackFit.expand,
              children: [
                CircularProgressIndicator(
                  value: setIndicator(index),
                  backgroundColor: Colors.grey,
                  color: Colors.pink,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: FloatingActionButton(
                    backgroundColor: Colors.pink,
                    onPressed: (){
                        controller.nextPage(duration: Duration(milliseconds: 500));

                    },
                    child: Icon(
                      Icons.arrow_forward,
                    ),
                  ),
                )
              ],
            ),
          ),
        )
        ],
      ),
    );
  }
  
  setIndicator(index){
    if(index==0) {
      return 0.0;
    } else if(index==1) {
      return 0.25;
    } else if(index==2){
      return 0.75;
    }
    return 1.0;
  }
}
