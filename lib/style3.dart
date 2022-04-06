import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:untitled1/style1.dart';

class Style3 extends StatefulWidget {
  Style3({Key? key}) : super(key: key);

  @override
  State<Style3> createState() => _Style3State();
}

class _Style3State extends State<Style3> {
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
                    color: i.color!,
                  ),
                  Positioned(
                    right: 0,
                    left: 0,
                    bottom: 0,
                    child: Card(
                      margin: EdgeInsets.all(0.0),
                      color: Colors.white,
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(100)
                        )
                      ),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [0,1,2].map((e) => Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: SizedBox(
                                  height: e==index ? 20 : 10,
                                  width: e==index? 20 : 10,
                                  child: Container(
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: e==index ? i.color : Colors.grey,
                                    ),
                                  ),
                                ),
                              )).toList(),
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
                          index != 2 ? Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Row(
                              children: [
                                TextButton(
                                    onPressed: (){
                                      controller.animateToPage(2, duration: Duration(milliseconds: 500));
                                    },
                                    child: Text('Skip Now',
                                    style: Theme.of(context).textTheme.bodyLarge,
                                    )
                                ),
                                Spacer(),
                                FloatingActionButton(
                                  backgroundColor: i.color,
                                  onPressed: (){
                                    controller.nextPage(duration: Duration(milliseconds: 500));
                                  },
                                  child: Icon(
                                    Icons.navigate_next_rounded,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          ) : Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Container(
                              width: MediaQuery.of(context).size.width,
                              child: ElevatedButton(
                                style: ButtonStyle(
                                  backgroundColor: MaterialStateProperty.all(
                                    Colors.lightBlueAccent
                                  ),
                                  shape: MaterialStateProperty.all(
                                    RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(5.0)
                                    )
                                  )
                                ),
                                  onPressed: (){},
                                  child: Text('Get started')),
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
