import 'package:carousel_slider/carousel_slider.dart';
import 'package:elliptic_text/elliptic_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled1/main.dart';

class Style1 extends StatefulWidget {
  Style1({Key? key}) : super(key: key);

  @override
  State<Style1> createState() => _Style1State();
}

class _Style1State extends State<Style1> {
  int index = 0;
  final slideList = [
    Slide(
      color: const Color(0xfff98fdb),
      label: 'Halloween Edition',
      title: 'Miongi Cat Care',
      subtitle: 'Joyful for your cat',
      caption: 'Trust me, there\'s way to make your cat love you more and more every day',
      imagePath: 'assets/images/style_1_1.png'
    ),
    Slide(
      color: const Color(0xff855fce),
      label: 'Halloween Edition',
      title: 'Miongi Cat Care',
      subtitle: 'More Get Closer',
      caption: 'Yep, of course you will get more closer with your beloved cat, absolutely.',
      imagePath: 'assets/images/style_1_2.png'
    ),
    Slide(
        color: const Color(0xffff9647),
        label: 'Halloween Edition',
        title: 'Miongi Cat Care',
        subtitle: 'Let\'s Care of Them',
        caption: 'This is the best choice for you to pleasure your beloved cat, well yeah, let\'s do this!',
        imagePath: 'assets/images/style_1_3.png'
    ),
  ];
  final CarouselController _controller = CarouselController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: CarouselSlider(
              carouselController: _controller,
              options: CarouselOptions(
                aspectRatio: MediaQuery.of(context).size.aspectRatio,
                enlargeCenterPage: true,
                enableInfiniteScroll: false,
                viewportFraction: 1.0,
                initialPage: index,
                onPageChanged: (int newIndex, reason) => setState(() => index = newIndex)
              ),
              items: slideList.map((i) => Column(
             //   crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Expanded(
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      color: i.color!,
                      child: Column(
                        children: [
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                vertical: 32.0,
                                horizontal: 16.0
                              ),
                              child: Center(
                                child: Image.asset(
                                  i.imagePath!
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Text(
                              i.title!,
                              style: Theme.of(context).textTheme.headline6!.copyWith(
                                color: Colors.white
                              ),
                            ),
                          )
                        ],
                      )
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
                    child: Center(
                      child: Text(
                        i.subtitle!,
                        style: Theme.of(context).textTheme.headline6?.copyWith(
                          // fontWeight: FontWeight.bold,
                           fontFamily: 'serif',
                        )
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Text(
                      i.caption!,
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.caption?.copyWith(
                        fontFamily: 'serif'
                      )
                    ),
                  ),
                  const SizedBox(height: 10,),
                ],
              )).toList(),
            ),
          ),
          Center(
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16.0)
              ),
              elevation: 16.0,
              shadowColor: slideList[index].color,
              child: AnimatedContainer(
                duration: const Duration(
                  milliseconds: 300
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16.0),
                  color: slideList[index].color,
                ),
                padding: const EdgeInsets.symmetric(
                  vertical: 8.0,
                  horizontal: 32.0
                ),
                child: Text(
                  'Get Started',
                  style: Theme.of(context).textTheme.button!.copyWith(
                    color: Colors.white
                  ),
                ),
              ),
            ),
          ),
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.center,
          //   children: [
          //     MaterialButton(
          //       minWidth: 50.0,
          //       child: const Text(
          //           'Get Started'
          //       ),
          //       color: index==1 ? Colors.orange[300] : Colors.purple[200],
          //       textColor: Colors.white,
          //       shape: RoundedRectangleBorder(
          //           borderRadius: BorderRadius.circular(20.0)
          //       ),
          //       onPressed: (){
          //
          //       },
          //     ),
          //   ],
          // ),
          SizedBox(
            height: 60.0,
            child: Stack(
              fit: StackFit.expand,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [0,1,2].map((e) {
                    return AnimatedContainer(
                      height: 6.0,
                      margin: const EdgeInsets.all(4.0),
                      width: e==index ? 35.0 : 6.0,
                      duration: const Duration(milliseconds: 300),
                      decoration: BoxDecoration(
                          color: e==index? slideList[index].color : const Color(0xff999999),
                          borderRadius: BorderRadius.circular(8.0)
                      ),
                    );
                  }).toList(),
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    if(index!=0)
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: TextButton(
                          child: Text(
                              'Prev',
                            style: TextStyle(
                              color: slideList[index].color
                            ),
                          ),
                          onPressed: () {
                            setState(() => index = index-1);
                            _controller.previousPage(duration: const Duration(milliseconds: 300));
                          },
                        ),
                      ),
                    const Spacer(),
                    if(index!=slideList.length-1)
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: TextButton(
                          child: Text(
                              'Next',
                            style: TextStyle(
                              color: slideList[index].color
                            ),
                          ),
                          onPressed: () {
                            setState(() => index = index + 1);
                            _controller.nextPage(duration: const Duration(milliseconds: 300));
                          },
                        ),
                      ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class Slide{
  final String? label;
  final String? title;
  final String? subtitle;
  final String? caption;
  final String? imagePath;
  final Color? color;
  final String? heading;
  final String? text;

  Slide({
    this.label,
    this.title,
    this.subtitle,
    this.caption,
    this.imagePath,
    this.heading,
    this.text,
    this.color
});
}
