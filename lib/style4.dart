import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:untitled1/style1.dart';

class Style4 extends StatefulWidget {
  const Style4({Key? key}) : super(key: key);

  @override
  State<Style4> createState() => _Style4State();
}

class _Style4State extends State<Style4> {
  int index = 0;
  final CarouselController controller = CarouselController();
  final slideList = [
    Slide(color: Colors.yellow, heading: 'title1', text: 'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout.'),
    Slide(color: Colors.teal, heading: 'title2', text: 'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout.'),
    Slide(color: Colors.lightBlueAccent, heading: 'title3', text: 'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout.'),
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
              items: slideList.map((i) => Stack(
                children: [
                  Container(
                    color: Colors.lightGreen[100],
                  ),
                  Positioned(
                    right: 0,
                    left: 0,
                    bottom: 0,
                    child: Card(
                      margin: EdgeInsets.all(0.0),
                      semanticContainer: false,
                      color: Colors.white,
                      elevation: 0,
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                                i.heading!,
                                style: Theme.of(context).textTheme.headlineLarge
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              i.text!,
                              textAlign: TextAlign.justify,
                              style: Theme.of(context).textTheme.caption,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Row(
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [0,1,2].map((e) => Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: AnimatedContainer(
                                      height: 10,
                                      width: e==index? 30 : 10,
                                      duration: const Duration(milliseconds: 300),
                                      decoration: BoxDecoration(
                                          color: e==index ? Colors.teal : Colors.grey[400],
                                          borderRadius: BorderRadius.circular(8.0)
                                      ),
                                    ),
                                  )).toList(),
                                ),
                                Spacer(),
                                index != slideList.length-1 ? Container(
                                  height: 45,
                                  child: MaterialButton(
                                    color: Colors.yellow,
                                      shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(25.0)
                                      ),
                                      onPressed: (){
                                        controller.nextPage(duration: Duration(milliseconds: 500));
                                      },
                                      child: const Text('Next',
                                      style: TextStyle(
                                        color: Colors.teal,
                                        fontWeight: FontWeight.bold
                                      ),
                                      )
                                  ),
                                ) : Container(
                                  height: 45,
                                  child: MaterialButton(
                                      color: Colors.yellow,
                                      shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(25.0)
                                      ),

                                      onPressed: (){
                                      },
                                      child: const Text('Sign up',
                                        style: TextStyle(
                                            color: Colors.teal,
                                            fontWeight: FontWeight.bold
                                        ),
                                      )
                                  ),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              )).toList(),
            ),
          ),
        ],
      ),
    );
  }
}
