import 'package:akonet_flutter/data/models/isp.dart';
import 'package:akonet_flutter/generated/i18n.dart';
import 'package:akonet_flutter/screens/details_screen/details_bloc.dart';
import 'package:akonet_flutter/widgets/material_status_widget.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DetailsScreen extends StatefulWidget {
  final Isp isp;

  const DetailsScreen({Key key, @required this.isp}) : super(key: key);

  @override
  _DetailsScreenState createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  DetailsBloc bloc = DetailsBloc();

  @override
  void initState() {
    super.initState();

    bloc.dispatch(RefreshDetails(widget.isp.id));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.isp.name ?? "Isp"),
      ),
      body: BlocBuilder(
        bloc: bloc,
        builder: (BuildContext context, AsyncSnapshot<Details> state) {
          if (state.hasData) {
            return ListView(
              padding: EdgeInsets.all(8),
              children: <Widget>[
                LineChartWidget(
                  seriesList: seriesList(
                      color: Colors.red,
                      label: S.of(context).packet_loss,
                      values: state.data.hourlyLossStats),
                  chartTitle: S.of(context).packet_loss_24_hours,
                ),
                LineChartWidget(
                  seriesList: seriesList(
                      color: Colors.purple,
                      label: S.of(context).downtime_minutes,
                      values: state.data.hourlyDowntimeStats),
                  chartTitle: S.of(context).downtime_24_hours,
                ),
                LineChartWidget(
                  seriesList: seriesList(
                      color: Colors.orange,
                      label: S.of(context).downtime_minutes,
                      values: state.data.dailyDowntimeStats),
                  chartTitle: S.of(context).downtime_daily,
                )
              ],
            );
          }
          return StatusWidget(
            snapshot: state,
            action: (){
              bloc.dispatch(RefreshDetails(widget.isp.id));
            },
          );
        },
      ),
    );
  }

  List<charts.Series<int, int>> seriesList(
      {@required List<int> values,
      @required MaterialColor color,
      @required String label}) {
    return <charts.Series<int, int>>[
      charts.Series(
        data: values,
        id: label,
        colorFn: (int datum, int index) {
          return charts.Color(b: color.blue, r: color.red, g: color.green);
        },
        measureFn: (int datum, int index) {
          return datum;
        },
        domainFn: (int datum, int index) {
          return index;
        },
      )
    ];
  }
}

class LineChartWidget extends StatelessWidget {
  final List<charts.Series> seriesList;

  final String chartTitle;

  const LineChartWidget(
      {Key key, @required this.seriesList, @required this.chartTitle})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      child: charts.LineChart(
        seriesList,
        primaryMeasureAxis: charts.AxisSpec(showAxisLine: true),
        defaultRenderer: charts.LineRendererConfig(includePoints: true),
        behaviors: [
          charts.SeriesLegend(position: charts.BehaviorPosition.bottom),
          charts.ChartTitle(chartTitle),
        ],
      ),
    );
  }
}
