class DailyRevenue {
  final int day;
  final double value;

  const DailyRevenue(this.day, this.value);
}

class RevenueService {
  final List<DailyRevenue> _sortedData;

  late final double _average;
  late final int _daysAboveAverage;

  RevenueService(List<DailyRevenue> rawData)
      : _sortedData = rawData.where((d) => d.value > 0).toList() {
    if (_sortedData.isEmpty) {
      _average = 0.0;
      _daysAboveAverage = 0;
      return;
    }

    _sortedData.sort((a, b) => a.value.compareTo(b.value));

    final sum =
        _sortedData.fold<double>(0.0, (prev, element) => prev + element.value);
    _average = sum / _sortedData.length;

    final cutOffIndex = _sortedData.indexWhere((d) => d.value > _average);

    if (cutOffIndex == -1) {
      _daysAboveAverage = 0;
    } else {
      _daysAboveAverage = _sortedData.length - cutOffIndex;
    }
  }

  double get minValue => _sortedData.isEmpty ? 0.0 : _sortedData.first.value;

  double get maxValue => _sortedData.isEmpty ? 0.0 : _sortedData.last.value;

  int get daysAboveAverage => _daysAboveAverage;
}
