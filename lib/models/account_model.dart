class AccountModel {
  final num savings;
  final num emergency;
  final Map<String, dynamic> investment;

  AccountModel({
    required this.savings,
    required this.emergency,
    required this.investment,
  });

  num get totalInvestment {
    if (investment.isNotEmpty) {
      return investment.values.reduce((value, element) => value + element);
    }
    return 0.0;
  }

  num get totalAmount => totalInvestment + savings + emergency;

  List<double> get percentages {
    final double savingPercent = (savings / totalAmount) * 100;
    final double invsetmentPercent = (totalInvestment / totalAmount) * 100;
    final double emergencyPercent = (emergency / totalAmount) * 100;
    return [savingPercent, invsetmentPercent, emergencyPercent];
  }
}
