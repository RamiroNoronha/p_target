import 'package:p_target/revenue_service.dart';
import 'package:test/test.dart';

void main() {
  group('RevenueService - Cálculos de Faturamento', () {
    test('Deve calcular min, max e dias > média corretamente ignorando zeros',
        () {
      final dados = [
        DailyRevenue(1, 100.0),
        DailyRevenue(2, 0.0),
        DailyRevenue(3, 300.0),
        DailyRevenue(4, 0.0),
        DailyRevenue(5, 200.0),
      ];

      final service = RevenueService(dados);

      expect(service.minValue, 100.0);
      expect(service.maxValue, 300.0);
      expect(service.daysAboveAverage, 1);
    });

    test('Lista Vazia ou só com zeros deve retornar 0', () {
      final dadosZeros = [
        DailyRevenue(1, 0.0),
        DailyRevenue(2, 0.0),
      ];

      final service = RevenueService(dadosZeros);

      expect(service.minValue, 0.0);
      expect(service.maxValue, 0.0);
      expect(service.daysAboveAverage, 0);
    });

    test('Todos os valores iguais', () {
      final dadosIguais = [
        DailyRevenue(1, 500.0),
        DailyRevenue(2, 500.0),
      ];

      final service = RevenueService(dadosIguais);

      expect(service.minValue, 500.0);
      expect(service.maxValue, 500.0);
      expect(service.daysAboveAverage, 0);
    });
  });
}
