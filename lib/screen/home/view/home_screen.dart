import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:provider/provider.dart';
import 'package:stegger_ui/screen/home/provider/home_provider.dart';

class home extends StatefulWidget {
  const home({Key? key}) : super(key: key);

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
  Homeprovider? hptrue;
  Homeprovider? hpfalse;
  @override
  Widget build(BuildContext context) {
    hptrue=Provider.of<Homeprovider>(context,listen: true);
    hpfalse=Provider.of<Homeprovider>(context,listen: false);
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: Colors.black12,
          title: Text(
            "Staggered RecycleView",
          ),
          centerTitle: true,
        ),
        body: GridView.custom(
          gridDelegate: SliverWovenGridDelegate.count(
            crossAxisCount: 2,
            mainAxisSpacing: 6,
            crossAxisSpacing: 6,
            pattern: [
              WovenGridTile(1),
              WovenGridTile(
                6 / 9,
                crossAxisRatio: 0.9,
                alignment: AlignmentDirectional.center,
              ),
            ],
          ),
          childrenDelegate: SliverChildBuilderDelegate(
            childCount: 8,
                (context, index) {
              return Stack(
                children: [
                  Container(
                    margin: EdgeInsets.all(5),
                    color: Colors.grey.shade600,
                    child: Stack(
                      children: [
                        Container(
                          height: double.infinity,
                          child: Image.asset(
                            "${hptrue!.images[index]}",
                            fit: BoxFit.cover,
                          ),
                        ),
                        Align(
                          alignment: Alignment.bottomCenter,
                          child: Container(
                            height: 40,
                            width: double.infinity,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(3)),
                            child: Center(
                                child: Text(
                                  "${hptrue!.name[index]}",
                                  style: TextStyle(
                                      fontSize: 17,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black),
                                )),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}