import 'dart:developer';

class RequestModel {
  double? age;
  double? sex;
  double? cp;
  double? trestbps;
  double? chol;
  double? fbs;
  double? restecg;
  double? thalach;
  int? exang;
  double? oldpeak;
  int? slope;
  double? ca;
  double? thal;

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

  Map<String, dynamic> toJson() {
    Map<String, dynamic> data = <String, dynamic>{};
    data['age'] = age;
    data['sex'] = sex;
    data['cp'] = cp;
    data['trestbps'] = trestbps;
    data['chol'] = chol;
    data['fbs'] = fbs;
    data['restecg'] = restecg;
    data['thalach'] = thalach;
    data['exang'] = exang;
    data['oldpeak'] = oldpeak;
    data['slope'] = slope;
    data['ca'] = ca;
    data['thal'] = thal;
    log(data.toString());
    return data;
  }
}
