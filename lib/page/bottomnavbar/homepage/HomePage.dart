// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, must_be_immutable, prefer_const_constructors_in_immutables, non_constant_identifier_names, unused_import, file_names

import 'dart:async';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bounce/flutter_bounce.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:poster_maker/Helper/commanlist/list.dart';
import 'package:poster_maker/Helper/utlity.dart';
import 'package:poster_maker/page/editBottomNavBar/EditBottomNavbar.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../appbar/Appbar.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> /*with TickerProviderStateMixin*/{
  // int _currentPage = 0;
  int posterIndex = 0;

  Timer _timer;
  TabController _tabController;
  // PageController controller =
  //     PageController(viewportFraction: 0.8, keepPage: true, initialPage: 0);
  // PageController pagecontroll =
  //     PageController(viewportFraction: 1, keepPage: true);

  @override
  void initState() {
    super.initState();
    // _tabController = TabController(length: 4, vsync: this);
    // _timer = Timer.periodic(Duration(seconds: 3), (Timer timer) {
    //   if (_currentPage < banner.length) {
    //     _currentPage;
    //   } else {
    //     _currentPage = 0;
    //   }

    //   // controller.animateToPage(
    //   //   _currentPage,
    //   //   duration: Duration(milliseconds: 350),
    //   //   curve: Curves.easeInCubic,
    //   // );
    // });
  }

  var currentIndex = 0;

  selectedIndex(index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  void dispose() {
    super.dispose();
    _timer?.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(children: [
        bannerView(),
        SizedBox(
          height: 10,
        ),
        SizedBox(
          height: 10,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: posterImage
                .map((e) => indicator(index: posterImage.indexOf(e)))
                .toList(),
          ),
        ),
        SizedBox(height: 20),
        Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
          tabButton(currentInd: 0, textName: 'New', selectedind: 0),
          tabButton(currentInd: 1, textName: 'Banner', selectedind: 1),
          tabButton(currentInd: 2, textName: 'Post', selectedind: 2),
          tabButton(currentInd: 3, textName: 'Story', selectedind: 3),
        ]),
        if (currentIndex == 0)
          New()
        else if (currentIndex == 1)
          Banner()
        else if (currentIndex == 2)
          Post()
        else if (currentIndex == 3)
          Story(),
      ]),
    );
  }

// >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>NewpageView<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< //
  Widget New() {
    return GestureDetector(
      onHorizontalDragEnd: (DragEndDetails details) {
        if (details.primaryVelocity < 0) {
          // User swiped Right
          setState(() {
            currentIndex++;
          });
        }
      },
      child: GridView.custom(
        padding: EdgeInsets.all(15),
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: SliverQuiltedGridDelegate(
          crossAxisCount: 4,
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
          repeatPattern: QuiltedGridRepeatPattern.inverted,
          pattern: const [
            QuiltedGridTile(2, 2),
            QuiltedGridTile(1, 2),
            QuiltedGridTile(1, 2),
            QuiltedGridTile(2, 2),
            QuiltedGridTile(2, 2),
            QuiltedGridTile(1, 2),
            QuiltedGridTile(2, 2),
            QuiltedGridTile(1, 2),
          ],
        ),
        childrenDelegate: SliverChildBuilderDelegate(
          (context, index) {
            var currentObj = item2[index];
            return Stack(
              children: [
                Bounce(
                  duration: Duration(milliseconds: 200),
                  onPressed: () {
                    Get.to(EditBottomNavBar());
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                              blurRadius: 3,
                              color: Color(AppColor.grey).withOpacity(0.5))
                        ],
                        image: DecorationImage(
                            image: AssetImage(currentObj), fit: BoxFit.cover),
                        borderRadius: BorderRadius.circular(15),
                        color: Color(AppColor.grey)),
                    // child: Center(
                    //   child: Text("$index"),2
                  ),
                ),
                Align(
                  alignment: Alignment.topRight,
                  child: GestureDetector(
                    onTap: () {},
                    child: Container(
                      margin: EdgeInsets.only(right: 10, top: 10),
                      height: 30,
                      width: 30,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color:
                              // isdarkMode.value
                              //     ? Color(AppColor.shadow).withOpacity(0.3)
                              //     :
                              Colors.black38),
                      child: Center(
                        child: Icon(
                          Icons.favorite,
                          size: 20,
                          color: Color(AppColor.orange),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            );
          },
          childCount: item2.length,
        ),
      ),
    );
  }

// >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>BannerView<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< //
  Widget Banner() {
    return GestureDetector(
        onHorizontalDragEnd: (DragEndDetails details) {
          if (details.primaryVelocity > 0) {
            // User swiped Left
            setState(() {
              currentIndex--;
            });
          } else if (details.primaryVelocity < 0) {
            // User swiped Right
            setState(() {
              currentIndex++;
            });
          }
        },
        child: GridView.custom(
          shrinkWrap: true,
          padding: EdgeInsets.all(15),
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: SliverQuiltedGridDelegate(
            crossAxisCount: 2,
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
            repeatPattern: QuiltedGridRepeatPattern.inverted,
            pattern: const [
              QuiltedGridTile(1, 2),
              QuiltedGridTile(1, 2),
            ],
          ),
          childrenDelegate: SliverChildBuilderDelegate(
            (context, index) {
              var currentObj = item2[index];
              return Container(
                decoration: BoxDecoration(
                    // boxShadow: [
                    //   BoxShadow(
                    //       blurRadius: 5,
                    //       color: isdarkMode.value
                    //           ? Colors.transparent
                    //           : Color(AppColor.grey))
                    // ],
                    image: DecorationImage(
                        image: AssetImage(currentObj), fit: BoxFit.fill),
                    borderRadius: BorderRadius.circular(15),
                    color: Color(AppColor.yellow).withOpacity(0.8)),
              );
            },
            childCount: item2.length,
          ),
        ));
    // Container(
    //     margin: EdgeInsets.all(15),
    //     height: Get.height,
    //     width: Get.width,
    //     // color: Color(AppColor.orange).withOpacity(0.1),
    //     child: GridView.builder(
    //       physics: NeverScrollableScrollPhysics(),
    //       itemCount: 25,
    //       gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
    //           crossAxisCount: 2,
    //           crossAxisSpacing: 10.0,
    //           mainAxisSpacing: 10.0,
    //           mainAxisExtent: 80.0),
    //       itemBuilder: (BuildContext context, int index) {
    //         return Container(
    //           width: Get.width * 0.4,
    //           decoration: BoxDecoration(
    //               color: Color(AppColor.yellow),
    //               borderRadius: BorderRadius.circular(15)),
    //           child: Center(child: Text("${index}")),
    //         );
    //       },
    //     ));
  }

// >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>Postview<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< //
  Widget Post() {
    return GestureDetector(
        onHorizontalDragEnd: (DragEndDetails details) {
          if (details.primaryVelocity > 0) {
            // User swiped Left
            setState(() {
              currentIndex--;
            });
          } else if (details.primaryVelocity < 0) {
            // User swiped Right
            setState(() {
              currentIndex++;
            });
          }
        },
        child: GridView.custom(
          padding: EdgeInsets.all(15),
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: SliverQuiltedGridDelegate(
            crossAxisCount: 2,
            mainAxisSpacing: 16,
            crossAxisSpacing: 16,
            repeatPattern: QuiltedGridRepeatPattern.inverted,
            pattern: const [
              QuiltedGridTile(1, 1),
              // QuiltedGridTile(1, 1),
              // QuiltedGridTile(1, 1),
              // QuiltedGridTile(1, 2),
            ],
          ),
          childrenDelegate: SliverChildBuilderDelegate(
            (context, index) {
              var currentObj = item[index];
              return Container(
                decoration: BoxDecoration(
                    // boxShadow: [
                    //   BoxShadow(
                    //       blurRadius: 5,
                    //       color: isdarkMode.value
                    //           ? Colors.transparent
                    //           : Color(AppColor.grey))
                    // ],
                    image: DecorationImage(
                        image: AssetImage(currentObj), fit: BoxFit.fill),
                    borderRadius: BorderRadius.circular(15),
                    color: Color(AppColor.yellow).withOpacity(0.8)),
              );
            },
            childCount: item.length,
          ),
        ));
    // Container(
    //     margin: EdgeInsets.all(15),
    //     height: Get.height,
    //     width: Get.width,
    //     // color: Color(AppColor.orange).withOpacity(0.1),
    //     child: GridView.builder(
    //       physics: NeverScrollableScrollPhysics(),
    //       itemCount: 25,
    //       gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
    //           crossAxisCount: 2,
    //           crossAxisSpacing: 10.0,
    //           mainAxisSpacing: 10.0,
    //           mainAxisExtent: 150.0),
    //       itemBuilder: (BuildContext context, int index) {
    //         return Container(
    //           width: Get.width * 0.4,
    //           decoration: BoxDecoration(
    //               color: Color(AppColor.orange),
    //               borderRadius: BorderRadius.circular(15)),
    //           child: Center(child: Text("${index}")),
    //         );
    //       },
    //     ));
  }

// >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>StoryView<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< //
  Widget Story() {
    return GestureDetector(
        onHorizontalDragEnd: (DragEndDetails details) {
          if (details.primaryVelocity > 0) {
            // User swiped Left
            setState(() {
              currentIndex--;
            });
          }
        },
        child: GridView.custom(
          padding: EdgeInsets.all(15),
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: SliverQuiltedGridDelegate(
            crossAxisCount: 2,
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
            repeatPattern: QuiltedGridRepeatPattern.inverted,
            pattern: const [
              QuiltedGridTile(1, 1),

              // QuiltedGridTile(2, 1),
              // QuiltedGridTile(1, 2),
              // QuiltedGridTile(1, 1),
              // QuiltedGridTile(1, 1),
              // QuiltedGridTile(1, 2),
            ],
          ),
          childrenDelegate: SliverChildBuilderDelegate(
            (context, index) {
              var currentObj = item2[index];
              return Container(
                decoration: BoxDecoration(
                    // boxShadow: [
                    //   BoxShadow(
                    //       blurRadius: 5,
                    //       color: isdarkMode.value
                    //           ? Colors.transparent
                    //           : Color(AppColor.grey))
                    // ],
                    image: DecorationImage(
                        image: AssetImage(currentObj), fit: BoxFit.fill),
                    // borderRadius: BorderRadius.circular(15),
                    color: Color(AppColor.yellow).withOpacity(0.8)),
              );
            },
            childCount: item.length,
          ),
        ));
    // Container(
    //     margin: EdgeInsets.all(15),
    //     height: Get.height,
    //     width: Get.width,
    //     // color: Color(AppColor.orange).withOpacity(0.1),
    //     child: GridView.builder(
    //       physics: NeverScrollableScrollPhysics(),
    //       itemCount: 25,
    //       gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
    //           crossAxisCount: 2,
    //           crossAxisSpacing: 16.0,
    //           mainAxisSpacing: 16.0,
    //           mainAxisExtent: 200.0),
    //       itemBuilder: (BuildContext context, int index) {
    //         return Container(
    //           width: Get.width * 0.4,
    //           decoration: BoxDecoration(
    //               color: Colors.red.withOpacity(0.4),
    //               borderRadius: BorderRadius.circular(15)),
    //           child: Center(child: Text("${index}")),
    //         );
    //       },
    //     ));
  }

// >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>TabButton<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< //

  Widget tabButton({
    Widget page,
    currentInd,
    selectedind,
    String textName,
  }) {
    return GestureDetector(
      onTap: () {
        _tabController.index = selectedind;
        currentIndex = selectedind;
        setState(() {});
      },
      child: Container(
        padding: EdgeInsets.only(left: 15, right: 15, bottom: 5, top: 3),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: currentIndex == currentInd
                ? Color(AppColor.orange)
                : Color(AppColor.orange).withOpacity(0.1)),
        child: Center(
          child: Text(
            textName,
            style: TextStyle(
                color: currentIndex == currentInd
                    ? Color(AppColor.white)
                    : Color(0xFFC3A1B5),
                fontFamily: AppFont.SemiBold),
          ),
        ),
      ),
    );
  }

// >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>Indicator<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< //
  Widget indicator({index}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 2),
      child: CircleAvatar(
        radius: (index != posterIndex) ? 3 : 4,
        backgroundColor: (index != posterIndex)
            ? Color(AppColor.grey)
            : Color(AppColor.orange),
      ),
    );

    // SmoothPageIndicator(
    //   controller: controller,
    //   count: banner.length,
    //   effect: ScrollingDotsEffect(
    //     activeStrokeWidth: 2.6,
    //     activeDotScale: 1.3,
    //     activeDotColor: Color(AppColor.yellow),
    //     dotColor: Color(AppColor.grey),
    //     dotHeight: 7,
    //     dotWidth: 7,
    //     // type: WormType.thin,
    //     // strokeWidth: 5,
    //   ),
    // );
  }

//>>>>>>>>>>>>>>>>>>>>>>> BannerView <<<<<<<<<<<<<<<<<<<<<<<<
  Widget bannerView() {
    return CarouselSlider.builder(
      itemCount: posterImage.length,
      options: CarouselOptions(
          aspectRatio: 3.0,
          autoPlay: true,
          onPageChanged: (i, _) {
            setState(() {
              posterIndex = i;
            });
          }),
      itemBuilder: (BuildContext context, int itemIndex, int pageViewIndex) =>
          Container(
        margin: EdgeInsets.only(left: 10, right: 10),
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(posterImage[itemIndex]), fit: BoxFit.fill)),
      ),
    );
  }

// TABBARVIEW
  tabBarView() {
    return Column(
      children: [
        TabBar(
            overlayColor: MaterialStateProperty.resolveWith<Color>(
              (Set<MaterialState> states) {
                return Colors.transparent;
              },
            ),
            indicatorColor: Colors.transparent,
            controller: _tabController,
            onTap: (val) {
              selectedIndex(val);
            },
            tabs: [
              Tab(
                child: tab(
                  item:
                      tabButton(currentInd: 0, textName: 'New', selectedind: 0),
                ),
                // text: 'New',
              ),
              Tab(
                child: tab(
                  item: tabButton(
                      currentInd: 1, textName: 'Banner', selectedind: 1),
                ),
              ),
              // text: 'Banner',
              Tab(
                child: tab(
                  item: tabButton(
                      currentInd: 2, textName: 'Post', selectedind: 2),
                ),
              ),
              Tab(
                child: tab(
                  item: tabButton(
                      currentInd: 3, textName: 'Story', selectedind: 3),
                ),
              ),
            ]),
        SizedBox(
          height: 1000,
          child: TabBarView(controller: _tabController, children: [
            New(),
            Banner(),
            Post(),
            Story(),
          ]),
        )
      ],
    );
  }

  Widget tab({item}) {
    return Container(
      margin: EdgeInsets.all(5),
      height: 50,
      width: 150,
      child: item,
    );
  }
}
