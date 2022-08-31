import 'package:auto_route/auto_route.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:homeservice/logic/counter/counter_cubit.dart';
import 'package:homeservice/model/model.dart';
import 'package:homeservice/model/model2.dart';
import 'package:homeservice/pages/sidemenu.dart';
import 'package:homeservice/repository/resgitration.repo.dart';
import 'package:homeservice/router/router.gr.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:marquee/marquee.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String> img = [
    'https://firebasestorage.googleapis.com/v0/b/ehomeservice-722a5.appspot.com/o/electrician%20copy.jpg?alt=media&token=64e3a228-b9a2-4ea4-b288-8dbca4a40b2e',
    'https://firebasestorage.googleapis.com/v0/b/ehomeservice-722a5.appspot.com/o/hometutor%20copy.jpg?alt=media&token=c2e6ef9c-048f-4c6b-8747-24a545068f89',
    'https://firebasestorage.googleapis.com/v0/b/ehomeservice-722a5.appspot.com/o/wallpainter%20copy.jpg?alt=media&token=75ec65ce-9b0e-4f32-9217-a1b5b1a7997e',
  ];
  String getusername = '';
  String? usernamefinal;
  String userna = '';
  String _email = '';
  List<ItemModel> datalist = [];
  List<ItemModel2> datalist2 = [];
  int _current = 0;

  @override
  void initState() {
    super.initState();
    getdata();
  }

  getdata() async {
    var _user = await ResgitrationRepo().Getdata();
    
    var _carouseldata = await ResgitrationRepo().Getcarouseldata();
    var name = await context.read<CounterCubit>().diskrepo.retrieve1();
    var email = await context.read<CounterCubit>().diskrepo.retrieve3();
    setState(() {
      datalist = _user!;
      datalist2 = _carouseldata!;
      userna = name;
      _email = email;
    });
  }

  @override
  Widget build(BuildContext context) {
    Future<bool> showExitPopup() async {
      return await showDialog(
            context: context,
            builder: (context) => AlertDialog(
              title: const Text('Exit App'),
              content: const Text('Do you want to exit an App?'),
              actions: [
                ElevatedButton(
                  onPressed: () => Navigator.of(context).pop(false),
                  child: const Text('No'),
                ),
                ElevatedButton(
                  onPressed: () => Navigator.of(context).pop(true),
                  child: const Text('Yes'),
                ),
              ],
            ),
          ) ??
          false;
    }

    return WillPopScope(
      onWillPop: showExitPopup,
      child: Scaffold(
        drawer: NavDrawer(
          email: _email,
          name: userna,
        ),
        backgroundColor: const Color(0xff82868E),
        appBar: AppBar(title: const Text("Home Services Provider")),
        body: SafeArea(
          child: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color(0xffFFFBFB),
                  Color(0xffEEEEEE),
                ],
              ),
            ),
            child: Column(children: [
              Expanded(
                flex: 26,
                child: Column(
                  children: [
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 15, bottom: 5, top: 5),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Align(
                            alignment: Alignment.bottomLeft,
                            child: Text(
                              "Hello $userna",
                              style: const TextStyle(
                                  fontSize: 22, fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 10),
                      child: Align(
                        alignment: Alignment.bottomLeft,
                        child: Text(
                          'Popular Services ',
                          style: TextStyle(
                              color: Color.fromARGB(255, 255, 94, 0),
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                          textAlign: TextAlign.right,
                        ),
                      ),
                    ),
                    CarouselSlider.builder(
                        itemBuilder: (context, index, realIndex) {
                          return InkWell(
                            onTap: () {
                              context.router.push(DetailRoute(
                                  data: datalist2[index].data,
                                  title: datalist2[index].text,
                                  serviceimage: datalist2[index].logo));
                            },
                            child: Container(
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(8),
                                child: Image.network(
                                  img[index],
                                  fit: BoxFit.fill,
                                  loadingBuilder: (BuildContext context,
                                      Widget child,
                                      ImageChunkEvent? loadingProgress) {
                                    if (loadingProgress == null) {
                                      return child;
                                    }
                                    return Center(
                                      child: CircularProgressIndicator(
                                        value: loadingProgress
                                                    .expectedTotalBytes !=
                                                null
                                            ? loadingProgress
                                                    .cumulativeBytesLoaded /
                                                loadingProgress
                                                    .expectedTotalBytes!
                                            : null,
                                      ),
                                    );
                                  },
                                ),
                              ),
                              margin: const EdgeInsets.all(6.0),
                            ),
                          );
                        },
                        itemCount: img.length,
                        options: CarouselOptions(
                            autoPlay: true,
                            enlargeCenterPage: true,
                            enableInfiniteScroll: true,
                            viewportFraction: 0.70,
                            height: 200,
                            onPageChanged: (i, r) {
                              setState(() {
                                _current = i;
                              });
                            })),
                    AnimatedSmoothIndicator(
                      activeIndex: _current,
                      count: img.length,
                      effect: const WormEffect(
                          spacing: 8.0,
                          radius: 2.0,
                          dotWidth: 7.0,
                          dotHeight: 7.0,
                          paintStyle: PaintingStyle.stroke,
                          strokeWidth: 1.5,
                          activeDotColor: Colors.pinkAccent),
                    ),
                    SizedBox(
                      height: 30,
                      child: Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: Marquee(
                          style: const TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 4, 8, 214),
                          ),

                          blankSpace: 200,

                          velocity: 150,

                          pauseAfterRound: const Duration(seconds: 1),
                          showFadingOnlyWhenScrolling: true,
                          //fadingEdgeStartFraction: 0.1,
                          //fadingEdgeEndFraction: 0.1,
                          startPadding: 11,
                          accelerationDuration: const Duration(seconds: 1),
                          accelerationCurve: Curves.linear,
                          decelerationDuration:
                              const Duration(milliseconds: 600),
                          decelerationCurve: Curves.easeOut,

                          text: 'Choose Your Services According To Your Needs',
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 15),
                          child: Align(
                            alignment: Alignment.topLeft,
                            child: Text('Services',
                                style: TextStyle(
                                    color: Color.fromARGB(255, 255, 94, 0),
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold)),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 24),
                          child: Align(
                            alignment: Alignment.topRight,
                            child: Stack(
                              alignment: Alignment.center,
                              children: [
                                Container(
                                  width: 80,
                                  height: 30,
                                  decoration: BoxDecoration(
                                      color: Color.fromARGB(255, 245, 228, 213),
                                      borderRadius: BorderRadius.circular(20)),
                                ),
                                TextButton(
                                  onPressed: () {
                                    context.router.push(
                                        AllserviceRoute(datalist: datalist));
                                  },
                                  child: const Text('See all',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 14,
                                          color: Colors.orange)),
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              Expanded(
                flex: 27,
                child: SizedBox(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              crossAxisSpacing: 20,
                              mainAxisSpacing: 20),
                      itemBuilder: (BuildContext ctx, index) {
                        return InkWell(
                          onTap: () {
                            context.router.push(DetailRoute(
                                data: datalist[index].data,
                                title: datalist[index].text,
                                serviceimage: datalist[index].logo));
                          },
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(18),
                            child: Container(
                              color: Colors.white,
                              height: 171,
                              width: 170,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Image.network(
                                    datalist[index].logo,
                                    cacheHeight: 120,
                                    cacheWidth: 120,
                                    fit: BoxFit.fill,
                                    filterQuality: FilterQuality.high,
                                    loadingBuilder: (BuildContext context,
                                        Widget child,
                                        ImageChunkEvent? loadingProgress) {
                                      if (loadingProgress == null) {
                                        return child;
                                      }
                                      return Center(
                                        child: CircularProgressIndicator(
                                          value: loadingProgress
                                                      .expectedTotalBytes !=
                                                  null
                                              ? loadingProgress
                                                      .cumulativeBytesLoaded /
                                                  loadingProgress
                                                      .expectedTotalBytes!
                                              : null,
                                        ),
                                      );
                                    },
                                  ),
                                  Text(
                                    datalist[index].text,
                                    style: const TextStyle(
                                        fontSize: 17,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                      shrinkWrap: true,
                      itemCount: datalist.length,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              )
            ]),
          ),
        ),
      ),
    );
  }
}
