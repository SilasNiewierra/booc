import 'package:boek/_variables.dart';
import 'package:boek/data_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class AnalyticsScreen extends StatefulWidget {
  final DataBloc dataBloc;
  final bool animate;

  AnalyticsScreen({this.dataBloc, this.animate});

  @override
  _AnalyticsScreenState createState() => _AnalyticsScreenState();
}

class _AnalyticsScreenState extends State<AnalyticsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context),
      body: _buildBody(context),
    );
  }

  Widget _buildAppBar(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            icon: SvgPicture.asset(
              'assets/icons/back.svg',
              color: defaultTextColor,
            ),
            onPressed: () => Navigator.pop(context),
          ),
          Hero(
            tag: 'analytics',
            child: Text(
              "Analytics",
              style: Theme.of(context)
                  .textTheme
                  .headline5
                  .copyWith(color: defaultTextColor),
            ),
          ),
          IconButton(
            icon: SvgPicture.asset(
              'assets/icons/back.svg',
              color: Colors.transparent,
            ),
            onPressed: null,
          ),
        ],
      ),
      elevation: 0,
      backgroundColor: Colors.transparent,
    );
  }

  Widget _buildBody(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.0),
      child: ValueListenableBuilder(
        valueListenable: widget.dataBloc.categoryData,
        builder: (BuildContext ctx,
            List<charts.Series<ChartSegment, String>> list, Widget wdg) {
          return Stack(
            children: [
              Center(
                child: charts.PieChart(
                  list,
                  animate: widget.animate,
                  defaultRenderer: new charts.ArcRendererConfig(arcWidth: 50),
                  behaviors: [
                    new charts.DatumLegend(
                      position: charts.BehaviorPosition.bottom,
                      horizontalFirst: false,
                      outsideJustification:
                          charts.OutsideJustification.middleDrawArea,
                      cellPadding: new EdgeInsets.only(right: 4.0, bottom: 4.0),
                      entryTextStyle: charts.TextStyleSpec(
                          fontSize: Theme.of(context)
                              .textTheme
                              .headline6
                              .fontSize
                              .floor()),
                    )
                  ],
                ),
              ),
              Center(
                child: Container(
                  padding: EdgeInsets.only(bottom: 80.0),
                  child: Text(
                    "Categories",
                    style: Theme.of(context)
                        .textTheme
                        .headline4
                        .copyWith(color: defaultTextColor),
                  ),
                ),
              )
            ],
          );
        },
      ),
    );
  }
}
