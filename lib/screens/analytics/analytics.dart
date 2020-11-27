import 'package:booc/_variables.dart';
import 'package:booc/app_bar.dart';
import 'package:booc/book_grid_view.dart';
import 'package:booc/data_bloc.dart';
import 'package:flutter/material.dart';
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
      appBar: buildAppBar(
          context, widget.dataBloc, "Analytics", PageContext.analytics),
      body: _buildBody(context),
    );
  }

  Widget _buildBody(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.only(bottom: 20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Analytics,", style: getH4()),
                Text("a visual representation of your read categories.",
                    style: getH6()),
              ],
            ),
          ),
          ValueListenableBuilder(
            valueListenable: widget.dataBloc.categoryData,
            builder: (BuildContext ctx,
                List<charts.Series<ChartSegment, String>> list, Widget wdg) {
              Size size = MediaQuery.of(context).size;
              return list[0].data.length > 0
                  ? _buildAnalytics(list, size)
                  : Expanded(
                      child: buildEmptyBody(context, PageContext.analytics));
            },
          ),
        ],
      ),
    );
  }

  Widget _buildAnalytics(
      List<charts.Series<ChartSegment, String>> list, Size size) {
    return Container(
      height: size.height / 1.5,
      child: Stack(
        children: [
          Center(
            child: charts.PieChart(
              list,
              animate: widget.animate,
              defaultRenderer: new charts.ArcRendererConfig(arcWidth: 50),
              behaviors: [
                new charts.DatumLegend(
                  position: charts.BehaviorPosition.bottom,
                  // horizontalFirst: false,
                  outsideJustification:
                      charts.OutsideJustification.middleDrawArea,
                  cellPadding: new EdgeInsets.only(right: 4.0, bottom: 4.0),
                  entryTextStyle:
                      charts.TextStyleSpec(fontSize: getH5().fontSize.floor()),
                ),
              ],
            ),
          ),
          Center(
            child: Container(
              padding: EdgeInsets.only(bottom: 10.0),
              child: Text(
                "Categories",
                style: getH4().copyWith(fontWeight: FontWeight.w100),
              ),
            ),
          )
        ],
      ),
    );
  }
}
