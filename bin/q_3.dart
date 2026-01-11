import 'package:p_target/revenue_service.dart';

void main() {
  final rawData = [
    DailyRevenue(1, 0.0),
    DailyRevenue(2, 2200.0),
    DailyRevenue(3, 500.0),
    DailyRevenue(4, 3000.0),
    DailyRevenue(5, 0.0),
    DailyRevenue(6, 2500.0),
  ];

  final service = RevenueService(rawData);

  print('--- Relatório Q3 ---');
  print('Menor valor: ${service.minValue}');
  print('Maior valor: ${service.maxValue}');
  print('Dias > média: ${service.daysAboveAverage}');
}
