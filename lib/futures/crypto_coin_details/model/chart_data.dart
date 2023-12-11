import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
part 'chart_data.g.dart';

@JsonSerializable()
class ChartData extends Equatable {
  final double price;
  final int index;

  const ChartData({required this.index, required this.price});

  @override
  List<Object?> get props => [price, index];

  factory ChartData.fromJson(Map<String, dynamic> json) =>
      _$ChartDataFromJson(json);

  Map<String, dynamic> toJson() => _$ChartDataToJson(this);
}
