import 'package:crypto_app/futures/crypto_coin_details/model/chart_data.dart';
import 'package:crypto_app/ui/theme/const.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class CryptoChart extends StatefulWidget {
  const CryptoChart(
      {super.key, required this.data, required this.max, required this.min});
  final List<ChartData> data;
  final double max;
  final double min;

  @override
  State<CryptoChart> createState() => _CryptoChartState();
}

class _CryptoChartState extends State<CryptoChart> {
  late List<ChartData> data;
  late double max;
  late double min;
  @override
  void initState() {
    data = widget.data;
    max = widget.max;
    min = widget.min;

    print('Data length: ${data.length}');
    print('X-axis range: ${1} to ${168}');
    print('Y-axis range: $min to $max');
    // var price = [
    //   41622.87175618215,
    //   41785.69097467152,
    //   41767.73523829736,
    //   41636.777838177615,
    //   41261.26187984762,
    //   41543.32992258695,
    //   41596.505521581465,
    //   41736.91177926652,
    //   41903.07658106982,
    //   41761.825735036175,
    //   41932.1761443509,
    //   41925.569045271164,
    //   41985.05643054763,
    //   41892.30568414858,
    //   41834.54382511119,
    //   41733.99456113161,
    //   41771.427116477666,
    //   41779.76286436433,
    //   41907.14135655048,
    //   41720.04054226303,
    //   41528.838930401165,
    //   41619.54179198166,
    //   41719.55696442351,
    //   41688.85473566735,
    //   41732.733222462906,
    //   41864.37115219754,
    //   41850.27349166447,
    //   42117.57166153031,
    //   42281.57399093059,
    //   42694.49578039032,
    //   43407.18988409029,
    //   43717.871172531464,
    //   43793.743516859664,
    //   43752.536813083076,
    //   44038.3773951916,
    //   44313.5688067047,
    //   44105.94477259938,
    //   44084.07542946641,
    //   43890.1725456299,
    //   43853.15503176022,
    //   43725.79279287818,
    //   43759.93874031614,
    //   43647.56990366777,
    //   43613.25858429163,
    //   43700.47163804608,
    //   43830.09830285976,
    //   43919.23914241112,
    //   44068.522598662625,
    //   43835.07913180642,
    //   44070.619677976836,
    //   44123.75642200011,
    //   44084.59699545886,
    //   43774.17848906289,
    //   43830.406264064164,
    //   44026.879581062705,
    //   43941.442351835816,
    //   44017.505223580854,
    //   43876.81941256845,
    //   43824.256902592155,
    //   43634.9044842414,
    //   43788.28880825234,
    //   43840.39396879242,
    //   43914.485116075564,
    //   43975.42782937081,
    //   43914.50403665742,
    //   43985.76702287833,
    //   43983.83364085532,
    //   43876.01905224208,
    //   43914.510795354676,
    //   43637.9456245303,
    //   43422.577584515966,
    //   43178.29915588401,
    //   43231.10412076097,
    //   43319.006727940316,
    //   43268.742623633174,
    //   43480.92990610841,
    //   43707.9881922381,
    //   43686.935181568064,
    //   43321.512329799174,
    //   43288.23234764201,
    //   43158.79442501625,
    //   43234.89391741567,
    //   43377.592325683276,
    //   43166.048404404966,
    //   43270.11955970747,
    //   43382.56326133669,
    //   43396.43772710228,
    //   43512.27963831054,
    //   43389.520293612215,
    //   43470.02565791358,
    //   43427.5014450611,
    //   43360.89817301741,
    //   43207.56300245892,
    //   43248.20340119713,
    //   43174.14096733939,
    //   43329.93272271259,
    //   43659.830608952616,
    //   43794.25619153226,
    //   43633.412709203716,
    //   43937.59163050896,
    //   43819.98586201575,
    //   43832.78035618881,
    //   43734.95670481345,
    //   43871.06803558629,
    //   43911.84414986522,
    //   44304.29854895467,
    //   44385.97528580486,
    //   44252.83509521942,
    //   44158.48119026304,
    //   44198.705818343165,
    //   44108.697502579984,
    //   44196.30077985671,
    //   44154.298824625366,
    //   44239.39526772252,
    //   44290.2632794866,
    //   44229.141019371375,
    //   44204.4580785644,
    //   43840.60632056117,
    //   43847.66351672282,
    //   43853.63342948888,
    //   43824.94502243738,
    //   43899.368140170685,
    //   44006.937503718174,
    //   43949.441930030014,
    //   44117.99323780744,
    //   44017.79837995913,
    //   43944.03423047422,
    //   43965.949557801694,
    //   43945.693569809504,
    //   43980.53017046564,
    //   44006.302674216204,
    //   43908.53000269771,
    //   43714.93535399452,
    //   43791.11048243972,
    //   43802.145000795754,
    //   43797.215945807526,
    //   43845.42419301062,
    //   43939.24408548624,
    //   43894.827602213125,
    //   43917.5199241797,
    //   43968.39740026597,
    //   43787.873300938925,
    //   43634.41192705681,
    //   43715.96053031301,
    //   43737.59599352967,
    //   43812.044576847926,
    //   43832.213030611165,
    //   43864.44652833788,
    //   43935.43898772248,
    //   43805.59128814079,
    //   43792.2242364665,
    //   43864.742796961626,
    //   43798.29205483033,
    //   43967.496154161665,
    //   43812.09560255007,
    //   43783.921845319455,
    //   43757.959937619176,
    //   43645.41521066105,
    //   43266.820817984015,
    //   41977.79580342069,
    //   42335.19287326501,
    //   42170.359240455335,
    //   41963.918435869426,
    //   41983.16618652562,
    //   42130.029010755534,
    //   42203.07612417308,
    //   42289.044855997876,
    //   42384.16182852714
    // ];
    // data = price.asMap().entries.map((entry) {
    //   return ChartData.fromJson({
    //     'price': entry.value,
    //     'index': entry.key + 1,
    //   });
    // }).toList();
    // max = price
    //     .reduce((currentMax, price) => currentMax < price ? price : currentMax);
    // min = price
    //     .reduce((currentMax, price) => currentMax > price ? price : currentMax);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SfCartesianChart(
      margin: const EdgeInsets.all(0),
      borderWidth: 0,
      borderColor: Colors.transparent,
      plotAreaBorderWidth: 0,
      //add my custom max and min
      primaryXAxis: NumericAxis(
          maximum: 1,
          minimum: 168,
          isVisible: false,
          borderWidth: 0,
          borderColor: Colors.transparent),
      primaryYAxis: NumericAxis(
          maximum: max,
          minimum: min,
          interval: 1000,
          isVisible: false,
          borderWidth: 0,
          borderColor: Colors.transparent),
      series: <ChartSeries<ChartData, int>>[
        SplineAreaSeries(
          dataSource: data,
          xValueMapper: (ChartData data, _) => data.index,
          yValueMapper: (ChartData data, _) => data.price,
          splineType: SplineType.natural,
          gradient: LinearGradient(
              colors: [splineColor, scaffoldBackground.withAlpha(150)],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter),
        ),
        SplineSeries(
            // markerSettings: MarkerSettings(
            //     // isVisible: true,
            //     // color: accentColor,
            //     // borderWidth: 0.001,
            //     ),
            color: accentColor,
            dataSource: data,
            xValueMapper: (ChartData data, _) => data.index,
            yValueMapper: (ChartData data, _) => data.price)
      ],
      trackballBehavior: TrackballBehavior(
        enable: true,
        lineType: TrackballLineType.vertical,
        tooltipSettings: const InteractiveTooltip(enable: true),
      ),
    );
  }
}
