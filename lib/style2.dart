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
    Slide(
        color: const Color(0xff493e8a),
        subtitle: 'Quick & Easy Payments',
        caption: 'Grow Your Business By Accepting Card Payments With The New Card Reader.',
        imagePath: 'assets/images/style_2_1.png'
    ),

    Slide(
        color: const Color(0xff493e8a),
        subtitle: 'Smart Point Of Sale',
        caption: 'Complete Point Of Sale System Tailored To Your Business Needs.',
        imagePath: 'assets/images/style_2_2.png'
    ),
    Slide(
        color: const Color(0xff493e8a),
        subtitle: 'Instant Notifications',
        caption: 'Instant Notifications Let You Quickly See New Purchases and Messages',
        imagePath: 'assets/images/style_2_3.png'
    ),
    ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
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
                      width: MediaQuery.of(context).size.width,
                      child: Center(
                        child: Image.asset(i.imagePath!),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Text(
                        i.subtitle!,
                        style: Theme.of(context).textTheme.headline6?.copyWith(
                          fontFamily: 'serif',
                          fontWeight: FontWeight.bold,
                          color: const Color(0xff493e8a)
                        )
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                    child: Text(
                      i.caption!,
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.caption?.copyWith(
                        fontFamily: 'serif'
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 200,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [0,1,2].map((e) => AnimatedContainer(
                        duration: const Duration(milliseconds: 300),
                        margin: const EdgeInsets.all(4.0),
                        height: 6.0,
                        width: e==index? 20.0 : 6.0,
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8.0),
                            color: e==index ? slideList[index].color : const Color(0xff999999),
                          ),
                        ),
                      )).toList(),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 20.0),
                    child: Center(
                      child: SizedBox(
                        width: 100.0,
                        height: 100.0,
                        child: Stack(
                          fit: StackFit.expand,
                          children: [
                            CircularProgressIndicator(
                              value: setIndicator(index),
                              backgroundColor: Colors.grey[400],
                              strokeWidth: 2.0,
                              color: const Color(0xfff4338f),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: FloatingActionButton(
                                elevation: 0.0,
                                backgroundColor: const Color(0xfff4338f),
                                onPressed: (){
                                  controller.nextPage(duration: const Duration(milliseconds: 500));
                                },
                                child: const Icon(
                                  Icons.arrow_forward,
                                  size: 30,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              )).toList(),
            ),
          ),
        ],
      ),
    );
  }
  
  setIndicator(index){
    if(index==0) {
      return 0.20;
    } else if(index==1) {
      return 0.75;
    }
    return 1.0;
  }
}
