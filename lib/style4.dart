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
    Slide(
        color: const Color(0xffdeeae5),
        subtitle: 'Realtime Monitoring',
        caption:
            'Trust me, there\'s way to make your cat love you more and more every day',
        imagePath: 'assets/images/style_3_1.png'),
    Slide(
        color: const Color(0xffdeeae5),
        subtitle: 'Grafik & Statistik Harian',
        caption:
            'Trust me, there\'s way to make your cat love you more and more every day',
        imagePath: 'assets/images/style_3_2.png'),
    Slide(
        color: const Color(0xffdeeae5),
        subtitle: 'Mode Otomatis & Manual',
        caption:
            'Trust me, there\'s way to make your cat love you more and more every day',
        imagePath: 'assets/images/style_3_3.png'),
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
                  onPageChanged: (int newIndex, reason) =>
                      setState(() => index = newIndex)),
              items: slideList
                  .map((i) => Column(
                        children: [
                          Expanded(
                            child: Container(
                              color: i.color,
                              child: Image.asset(
                                i.imagePath!,
                                // alignment: Alignment.topRight,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 40.0, vertical: 30),
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Text(i.subtitle!,
                                  textAlign: TextAlign.left,
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline6
                                      ?.copyWith(
                                        fontFamily: 'serif',
                                        fontWeight: FontWeight.bold,
                                        color: const Color(0xff055840),
                                      )),
                            ),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 40.0),
                            child: Text(
                              i.caption!,
                              textAlign: TextAlign.left,
                              style:
                                  Theme.of(context).textTheme.caption?.copyWith(
                                        fontFamily: 'serif',
                                      ),
                            ),
                          ),
                          const SizedBox(
                            height: 50,
                          ),
                        ],
                      ))
                  .toList(),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 30),
            child: Row(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [0, 1, 2]
                      .map((e) => AnimatedContainer(
                            margin: const EdgeInsets.all(4.0),
                            height: 6.0,
                            width: e == index ? 30 : 6.0,
                            duration: const Duration(milliseconds: 300),
                            decoration: BoxDecoration(
                                color: e == index
                                    ? const Color(0xff055840)
                                    : const Color(0xff999999),
                                borderRadius: BorderRadius.circular(8.0)),
                          ))
                      .toList(),
                ),
                const Spacer(),
                SizedBox(
                  height: 45,
                  child: MaterialButton(
                    elevation: 6,
                      color: const Color(0xffffc10d),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25.0)),
                      onPressed: () {
                        if (index != slideList.length - 1) {
                          controller.nextPage(
                              duration: const Duration(milliseconds: 500));
                        }
                      },
                      child: Text(
                        index != slideList.length - 1 ? 'Next' : 'Sign up',
                        style: const TextStyle(
                            color: Color(0xff055840),
                            fontWeight: FontWeight.bold),
                      )),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
