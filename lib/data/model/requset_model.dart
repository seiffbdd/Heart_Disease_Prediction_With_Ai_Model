class RequestModel {
  final double? age;
  final double? sex;
  final double? cp;
  final double? trestbps;
  final double? chol;
  final double? fbs;
  final double? restecg;
  final double? thalach;
  final int? exang;
  final double? oldpeak;
  final int? slope;
  final double? ca;
  final double? thal;

  RequestModel({
    required this.age,
    required this.sex,
    required this.cp,
    required this.trestbps,
    required this.chol,
    required this.fbs,
    required this.restecg,
    required this.thalach,
    required this.exang,
    required this.oldpeak,
    required this.slope,
    required this.ca,
    required this.thal,
  });

  factory RequestModel.fromJson(Map<String, dynamic> json) {
    return RequestModel(
      age: json['age'],
      sex: json['sex'],
      cp: json['cp'],
      trestbps: json['trestbps'],
      chol: json['chol'],
      fbs: json['fbs'],
      restecg: json['restecg'],
      thalach: json['thalach'],
      exang: json['exang'],
      oldpeak: json['oldpeak'],
      slope: json['slope'],
      ca: json['ca'],
      thal: json['thal'],
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'age': age,
      'sex': sex,
      'cp': cp,
      'trestbps': trestbps,
      'chol': chol,
      'fbs': fbs,
      'restecg': restecg,
      'thalach': thalach,
      'exang': exang,
      'oldpeak': oldpeak,
      'slope': slope,
      'ca': ca,
      'thal': thal,
    };
  }
}
