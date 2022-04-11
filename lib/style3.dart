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
    Slide(
        color: const Color(0xfffee64b),
        subtitle: 'Hmmm, Healthy Food',
        caption: 'A variety of healthy foods made by the best chefs. Ingredients are easy to find, all delicious flavors can only be found at cookbunda',
        imagePath: 'assets/images/style_4_1.png'
    ),
    Slide(
        color: const Color(0xffa7e6f3),
        subtitle: 'Fresh Drinks, Stay Fresh',
        caption: 'Not only food, we provide clear healthy drink options for you. Fresh taste always accompanies you.',
        imagePath: 'assets/images/style_4_2.png'
    ),
    Slide(
        color: const Color(0xff32b67a),
        subtitle: 'Let\'s Cooking',
        caption: 'Are you ready to make a dish for your friends or family? Create an account and cook',
        imagePath: 'assets/images/style_4_3.png'
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
              items: slideList.map((i) => Container(
                color: i.color,
                child: Column(
                  children: [
                    Image.asset(i.imagePath!,
                    ),
                    Expanded(
                      child: Container(
                        margin: const EdgeInsets.all(0.0),
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(100)
                          ),
                          color: Colors.white,
                        ),
                        // shape: const RoundedRectangleBorder(
                        //     borderRadius: BorderRadius.only(
                        //         topLeft: Radius.circular(100)
                        //     )
                        // ),
                        child: Column(
                        //  mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 16.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [0,1,2].map((e) => AnimatedContainer(
                                  duration: const Duration(
                                      milliseconds: 300
                                  ),
                                  margin: const EdgeInsets.all(4.0),
                                  height: 6.0,
                                  width: e==index? 35.0 : 6.0,
                                  child: Container(
                                    decoration: BoxDecoration(
                                        color: e==index ? slideList[e].color : const Color(0xffb4b1cf),
                                        borderRadius: BorderRadius.circular(8.0)
                                    ),
                                  ),
                                )).toList(),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 22.0, horizontal: 50),
                              child: Text(
                                  i.subtitle!,
                                  textAlign: TextAlign.center,
                                  style: Theme.of(context).textTheme.headline6?.copyWith(
                                      fontFamily: 'serif'
                                  )
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 50.0),
                              child: Text(
                                i.caption!,
                                textAlign: TextAlign.center,
                                style: Theme.of(context).textTheme.caption?.copyWith(
                                    fontFamily: 'serif',
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              )).toList()
      ),
          ),
          index != 2 ? Container(
            color: Colors.white,
            child: Padding(
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
                    backgroundColor: slideList[index].color,
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
            ),
          ) : Container(
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Container(
                width: MediaQuery.of(context).size.width,
                child: ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(
                            slideList[index].color
                        ),
                        shape: MaterialStateProperty.all(
                            RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5.0)
                            )
                        )
                    ),
                    onPressed: (){},
                    child: const Text('Get started')),
              ),
            ),
          )
        ],
      ),
     );
  }
}
