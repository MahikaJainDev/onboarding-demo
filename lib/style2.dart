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
                      decoration: BoxDecoration(
                        border:const  Border(
                          bottom: BorderSide(
                            color: Color(0xff000000)
                          )
                        ),
                        color: i.color,
                      ),
                      child: Image.asset('assets/images/download.jpeg',
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 15),
                    child: Text(
                        i.heading!,
                        style: Theme.of(context).textTheme.headline3
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15.0),
                    child: Text(
                      i.text!,
                      textAlign: TextAlign.justify,
                      style: Theme.of(context).textTheme.caption,
                    ),
                  ),
                ],
              )).toList(),
            ),
          ),
          SizedBox(
            height: 200,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [0,1,2,3].map((e) => Padding(
                padding: const EdgeInsets.all(8.0),
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  height: 10,
                  width: e==index? 25.0 : 10.0,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.0),
                      color: e==index ? const Color(0xff000000) : Colors.grey[400],
                    ),
                  ),
                ),
              )).toList(),
            ),
          ),
        Padding(
          padding: const EdgeInsets.only(bottom: 20.0),
          child: SizedBox(
            width: 80.0,
            height: 80.0,
            child: Stack(
              fit: StackFit.expand,
              children: [
                CircularProgressIndicator(
                  value: setIndicator(index),
                  backgroundColor: Colors.grey[400],
                  strokeWidth: 2.0,
                  color: Colors.pink,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: FloatingActionButton(
                    elevation: 0.0,
                    backgroundColor: Colors.pink,
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
