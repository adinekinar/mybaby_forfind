import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:my_baby/home_screen.dart';
import 'package:my_baby/widgets/recomendation.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import 'colors.dart';

class RecommendationScreen extends StatelessWidget {
  final int index;
  const RecommendationScreen({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Image.asset(
          'assets/logo_biru.png',
          width: 111,
          height: 45,
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: Colors.black,
        leading: GestureDetector(
          child: Icon( Icons.arrow_back, color: Colors.black),
          onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
              builder: (context) => const HomeScreen(),
            ),
          )
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: Stack(
          children: [
            Container(
              width: double.infinity,
              margin: const EdgeInsets.only(top: 150),
              decoration: BoxDecoration(
                  color: CustomColors.secondary,
                  borderRadius: BorderRadius.circular(8)),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 23, vertical: 31),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const SizedBox(height: 60),
                    const Text(
                      'Rekomendasi Jenis Susu',
                      style: TextStyle(
                          color: CustomColors.primary,
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 11, bottom: 21),
                      child: Text(
                        recom[index].name,
                        style: const TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                    ),
                    const Text(
                      'Deskripsi Jenis Susu',
                      style: TextStyle(
                          color: CustomColors.primary,
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      recom[index].desc,
                      textAlign: TextAlign.justify,
                      style: const TextStyle(fontSize: 12),
                    ),
                    const SizedBox(height: 21),
                    const Text(
                      'Beberapa Pilihan',
                      style: TextStyle(
                          color: CustomColors.primary,
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 11),
                    Text(recom[index].listrecom)
                  ],
                ),
              ),
            ),
            Align(
              alignment: Alignment.topCenter,
              child: HotNewsSlider(pURL: recom[index].pUrl)
            ),
          ],
        ),
      ),
    );
  }
}

//class untuk slider
class HotNewsSlider extends StatefulWidget {
  const HotNewsSlider({Key? key, required this.pURL}) : super(key: key);
  final List<String> pURL;

  @override
  _HotNewsSliderState createState() => _HotNewsSliderState();
}

class _HotNewsSliderState extends State<HotNewsSlider> {
  int activeIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          CarouselSlider.builder(
            options: CarouselOptions(
              height: 225,
              autoPlay: true,
              autoPlayInterval: const Duration(seconds: 20),
              enlargeCenterPage: true,
              enlargeStrategy: CenterPageEnlargeStrategy.scale,
              onPageChanged: (index, reason) =>
                  setState(() => activeIndex = index),
            ),
            itemCount: widget.pURL.length,
            itemBuilder: (context, index, realIndex) {
              final Hoturl = widget.pURL[index];
              return buildImage(Hoturl, index);
            },
          ),
          buildIndicator(),
        ],
      ),
    );
  }

  //buat nampilin image dicarousel slider
  Widget buildImage(String hoturl, int index) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(15),
      child: Image.network(
        hoturl,
        fit: BoxFit.fill,
      ),
    );
  }

  //untuk nampilin indikatornya
  Widget buildIndicator() {
    return AnimatedSmoothIndicator(
      activeIndex: activeIndex,
      count: widget.pURL.length,
      effect: ExpandingDotsEffect(
        dotHeight: 5,
        dotWidth: 5,
        activeDotColor: CustomColors.primary,
        dotColor: Colors.black12,
      ),
    );
  }
}