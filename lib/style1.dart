import 'package:carousel_slider/carousel_slider.dart';
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
    Slide(color: Colors.pink[100], heading: 'Joyful for your Cat', text: 'Trust me, there\'s way to make your cat love you more and more every day'),
    Slide(color: Colors.purple[200], heading: 'More Get Closer', text: 'Yep, of course you will get more closer with your beloved cat, absolutely.'),
    Slide(color: Colors.orange[300], heading: 'Let\'s Care of Them', text: 'This is the best choice for you to pleasure your beloved cat, well yeah, let\'s do this!'),
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
                          const Padding(
                            padding: EdgeInsets.only(top: 30.0),
                            child: Text('Quick and easy payments',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(30.0),
                            child: Container(
                              decoration: const BoxDecoration(
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(50.0),
                                  topRight: Radius.circular(50.0)
                                )
                              ),
                                child: Image.asset('assets/images/download.jpeg')),
                          ),
                          const Text('Quick payments',
                          style: TextStyle(
                            color: Colors.white
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
                        i.heading!,
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
                      i.text!,
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.caption?.copyWith(
                        fontFamily: 'serif'
                      )
                    ),
                  ),
                  const SizedBox(height: 10,),
                  MaterialButton(
                    minWidth: 50.0,
                    child: const Text(
                      'Get Started'
                    ),
                    color: index==1 ? Colors.orange[300] : Colors.purple[200],
                    textColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0)
                    ),
                    onPressed: (){

                    },
                  )
                ],
              )).toList(),
            ),
          ),
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
                          color: e==index? Colors.orange[300] : const Color(0xff999999),
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
                              color: Colors.purple[200]
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
                              color: Colors.purple[200]
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
  final String? heading;
  final String? text;
  final Color? color;

  Slide({
    this.heading,
    this.text,
    this.color
});
}
