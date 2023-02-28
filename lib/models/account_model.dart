class AccountModel {
  final double savings;
  final double emergency;
  final Map<String, double> investment;

  AccountModel({
    required this.savings,
    required this.emergency,
    required this.investment,
  });

  double get totalInvestment {
    if (investment.isNotEmpty) {
      return investment.values.reduce((value, element) => value + element);
    }
    return 0.0;
  }

  double get totalAmount => totalInvestment + savings + emergency;

  List<double> get percentages {
    final double savingPercent = (savings / totalAmount) * 100;
    final double invsetmentPercent = (totalInvestment / totalAmount) * 100;
    final double emergencyPercent = (emergency / totalAmount) * 100;
    return [savingPercent, invsetmentPercent, emergencyPercent];
  }
}
