class Metric {
  Metric({
      required this.amount,
      required this.unitShort,
      required this.unitLong,});

   factory Metric.fromJson(Map<String,dynamic> json) {
    return Metric(amount: json['amount'] as double, unitShort: json['unitShort'] as String , unitLong: json['unitLong'] as String );
  }
  double amount;
  String unitShort;
  String unitLong;

}