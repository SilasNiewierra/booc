import 'package:booc/_variables.dart';
import 'package:booc/data_bloc.dart';
import 'package:booc/screens/analytics/analytics.dart';
import 'package:booc/screens/bucket_list/bucket_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MenuScreen extends StatefulWidget {
  final DataBloc dataBloc;
  MenuScreen({@required this.dataBloc});

  @override
  _MenuScreenState createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: _buildAppBar(),
        body: GestureDetector(
          onTap: () {
            Navigator.of(context).pop();
          },
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 2.0,
                  width: 50,
                  margin: EdgeInsets.symmetric(vertical: 10.0),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => AnalyticsScreen(
                                dataBloc: widget.dataBloc, animate: true)));
                  },
                  child: Hero(
                    tag: PageContext.analytics,
                    child: Text("Analytics",
                        style: Theme.of(context)
                            .textTheme
                            .headline5
                            .copyWith(color: defaultTextColor)),
                  ),
                ),
                Container(
                  height: 2.0,
                  width: 50,
                  color: defaultTextColor,
                  margin: EdgeInsets.symmetric(vertical: 10.0),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                BucketListScreen(dataBloc: widget.dataBloc)));
                  },
                  child: Hero(
                    tag: PageContext.bucket,
                    child: Text("Bucket List",
                        style: Theme.of(context)
                            .textTheme
                            .headline5
                            .copyWith(color: defaultTextColor)),
                  ),
                ),
                // Container(
                //   height: 2.0,
                //   width: 50,
                //   color: defaultTextColor,
                //   margin: EdgeInsets.symmetric(vertical: 10.0),
                // ),
                // GestureDetector(
                //   onTap: () {
                //     Navigator.of(context).pop();
                //     widget.dataBloc.updateSignedInState(false);
                //   },
                //   child: Text("Logout",
                //       style: Theme.of(context)
                //           .textTheme
                //           .headline5
                //           .copyWith(color: defaultTextColor)),
                // )
              ],
            ),
          ),
        ));
  }

  Widget _buildAppBar() {
    return AppBar(
      automaticallyImplyLeading: false,
      elevation: 0,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
              icon: SvgPicture.asset('assets/icons/cancel.svg',
                  color: defaultTextColor),
              onPressed: () {
                Navigator.of(context).pop();
              }),
        ],
      ),
      backgroundColor: Colors.transparent,
    );
  }
}
