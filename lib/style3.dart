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
                    decoration: BoxDecoration(
                      image: const DecorationImage(
                        image: AssetImage('assets/images/images.jpeg')
                      ),
                      color: i.color!,
                    ),
                  ),
                  Positioned(
                    right: 0,
                    left: 0,
                    bottom: 0,
                    child: Card(
                      margin: const EdgeInsets.all(0.0),
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
                                child: AnimatedContainer(
                                  duration: const Duration(
                                    milliseconds: 300
                                  ),
                                  height: 10,
                                  width: e==index? 25.0 : 10.0,
                                  child: Container(
                                    decoration: BoxDecoration(
                                        color: e==index ? slideList[e].color : Colors.grey[400],
                                        borderRadius: BorderRadius.circular(8.0)
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
                                style: Theme.of(context).textTheme.headline3?.copyWith(
                                    fontWeight: FontWeight.w600,
                                )
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Text(
                              i.text!,
                              textAlign: TextAlign.justify,
                              style: Theme.of(context).textTheme.caption,
                            ),
                          ),
                          index != 2 ? Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Row(
                              children: [
                                TextButton(
                                    onPressed: (){
                                      controller.animateToPage(2, duration: const Duration(milliseconds: 500));
                                    },
                                    child: Text('Skip Now',
                                    style: Theme.of(context).textTheme.bodyLarge,
                                    )
                                ),
                                const Spacer(),
                                FloatingActionButton(
                                  backgroundColor: i.color,
                                  onPressed: (){
                                    controller.nextPage(duration: const Duration(milliseconds: 500));
                                  },
                                  child: const Icon(
                                    Icons.navigate_next_rounded,
                                    color: Colors.white,
                                    size: 30,
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
