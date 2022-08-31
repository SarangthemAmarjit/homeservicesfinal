import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:homeservice/model/model.dart';
import 'package:homeservice/repository/resgitration.repo.dart';
import 'package:homeservice/router/router.gr.dart';

class AllservicePage extends StatefulWidget {
  List<ItemModel> datalist;
  AllservicePage({Key? key, required this.datalist}) : super(key: key);

  @override
  State<AllservicePage> createState() => _AllservicePageState();
}

class _AllservicePageState extends State<AllservicePage> {
  @override
  void initState() {
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('All Services'),
      ),
      body: SizedBox(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, crossAxisSpacing: 20, mainAxisSpacing: 20),
            itemBuilder: (BuildContext ctx, index) {
              return InkWell(
                onTap: () {
                  switch (widget.datalist[index].id) {
                    case 1:
                      {
                        context.router.push(DetailRoute(
                            data: widget.datalist[index].data,
                            title: widget.datalist[index].text,
                            serviceimage: widget.datalist[index].logo));
                      }
                      break;
                    case 2:
                      {
                        context.router.push(DetailRoute(
                            data: widget.datalist[index].data,
                            title: widget.datalist[index].text,
                            serviceimage: widget.datalist[index].logo));
                      }
                      break;
                    case 3:
                      {
                        context.router.push(DetailRoute(
                            data: widget.datalist[index].data,
                            title: widget.datalist[index].text,
                            serviceimage: widget.datalist[index].logo));
                      }
                      break;
                    case 4:
                      {
                        context.router.push(DetailRoute(
                            data: widget.datalist[index].data,
                            title: widget.datalist[index].text,
                            serviceimage: widget.datalist[index].logo));
                      }
                      break;
                    case 5:
                      {
                        context.router.push(DetailRoute(
                            data: widget.datalist[index].data,
                            title: widget.datalist[index].text,
                            serviceimage: widget.datalist[index].logo));
                      }
                      break;
                    case 6:
                      {
                        context.router.push(DetailRoute(
                            data: widget.datalist[index].data,
                            title: widget.datalist[index].text,
                            serviceimage: widget.datalist[index].logo));
                      }
                      break;
                    case 7:
                      {
                        context.router.push(DetailRoute(
                            data: widget.datalist[index].data,
                            title: widget.datalist[index].text,
                            serviceimage: widget.datalist[index].logo));
                      }
                      break;
                    case 8:
                      {
                        context.router.push(DetailRoute(
                            data: widget.datalist[index].data,
                            title: widget.datalist[index].text,
                            serviceimage: widget.datalist[index].logo));
                      }
                      break;

                    default:
                      print('This is Default');
                  }
                },
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(18),
                  child: Container(
                    color: Colors.white,
                    height: 170,
                    width: 170,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.network(
                          widget.datalist[index].logo,
                          cacheHeight: 120,
                          cacheWidth: 120,
                          fit: BoxFit.fill,
                          filterQuality: FilterQuality.high,
                          loadingBuilder: (BuildContext context, Widget child,
                              ImageChunkEvent? loadingProgress) {
                            if (loadingProgress == null) {
                              return child;
                            }
                            return Center(
                              child: CircularProgressIndicator(
                                value: loadingProgress.expectedTotalBytes !=
                                        null
                                    ? loadingProgress.cumulativeBytesLoaded /
                                        loadingProgress.expectedTotalBytes!
                                    : null,
                              ),
                            );
                          },
                        ),
                        Text(
                          widget.datalist[index].text,
                          style: const TextStyle(
                              fontSize: 17, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
            shrinkWrap: true,
            itemCount: widget.datalist.length,
          ),
        ),
      ),
    );
  }
}
