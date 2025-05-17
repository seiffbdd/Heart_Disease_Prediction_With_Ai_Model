import 'package:flutter/material.dart';
import 'package:heart_disease_prediction/data/api_helper.dart';
import 'package:heart_disease_prediction/data/model/requset_model.dart';
import 'package:heart_disease_prediction/presentation/widget/build_number_field.dart';
import 'package:heart_disease_prediction/presentation/widget/build_row.dart';

class HeartDiseaseInputScreen extends StatefulWidget {
  const HeartDiseaseInputScreen({super.key});

  @override
  State<HeartDiseaseInputScreen> createState() =>
      _HeartDiseaseInputScreenState();
}

class _HeartDiseaseInputScreenState extends State<HeartDiseaseInputScreen> {
  late GlobalKey<FormState> _formKey;
  Map<String, dynamic>? prediction;
  late final TextEditingController _age;
  late final TextEditingController _sex;
  late final TextEditingController _cp;
  late final TextEditingController _trestbps;
  late final TextEditingController _chol;
  late final TextEditingController _fbs;
  late final TextEditingController _restecg;
  late final TextEditingController _thalach;
  late final TextEditingController _exang;
  late final TextEditingController _oldPeak;
  late final TextEditingController _slope;
  late final TextEditingController _ca;
  late final TextEditingController _thal;
  @override
  void initState() {
    _formKey = GlobalKey<FormState>();
    _age = TextEditingController();
    _sex = TextEditingController();
    _cp = TextEditingController();
    _trestbps = TextEditingController();
    _chol = TextEditingController();
    _fbs = TextEditingController();
    _restecg = TextEditingController();
    _thalach = TextEditingController();
    _exang = TextEditingController();
    _oldPeak = TextEditingController();
    _slope = TextEditingController();
    _ca = TextEditingController();
    _thal = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Heart Disease Prediction',
          style: TextStyle(color: Colors.white, fontSize: 32),
        ),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: EdgeInsets.all(12.0),
        child: Form(
          key: _formKey,
          autovalidateMode: AutovalidateMode.onUnfocus,
          child: SingleChildScrollView(
            child: Column(
              children: [
                BuildRow(
                  firstField: BuildNumberField(controller: _age, label: 'Age'),
                  secondField: BuildNumberField(
                    label: 'Sex (1=Male, 0=Female)',
                    controller: _sex,
                  ),
                ),
                BuildRow(
                  firstField: BuildNumberField(
                    label: 'Chest pain type (0 - 3)',
                    controller: _cp,
                  ),
                  secondField: BuildNumberField(
                    label: 'Resting blood pressure',
                    controller: _trestbps,
                  ),
                ),
                BuildRow(
                  firstField: BuildNumberField(
                    label: 'Serum cholesterol (mg/dl)',
                    controller: _chol,
                  ),

                  secondField: BuildNumberField(
                    label:
                        'Fasting blood sugar > 120 mg/dl (1 = true; 0 = false)',
                    controller: _fbs,
                  ),
                ),
                BuildRow(
                  firstField: BuildNumberField(
                    label: 'Resting electrocardiographic results',
                    controller: _restecg,
                  ),

                  secondField: BuildNumberField(
                    label: 'Maximum heart rate achieved',
                    controller: _thalach,
                  ),
                ),
                BuildRow(
                  firstField: BuildNumberField(
                    label: 'Exercise-induced angina',
                    controller: _exang,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'This Field can\'t be empty';
                      } else if (!isInt(value)) {
                        return 'This Field only accepts numeric values';
                      }
                      return null;
                    },
                  ),

                  secondField: BuildNumberField(
                    label: 'ST depression induced by exercise',
                    controller: _oldPeak,
                  ),
                ),
                BuildRow(
                  firstField: BuildNumberField(
                    label: 'Slope of the peak exercise ST segment',
                    controller: _slope,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'This Field can\'t be empty';
                      } else if (!isInt(value)) {
                        return 'This Field only accepts numeric values';
                      }
                      return null;
                    },
                  ),

                  secondField: BuildNumberField(
                    label: 'Number of major vessels colored by fluoroscopy',
                    controller: _ca,
                  ),
                ),
                BuildNumberField(
                  label:
                      'Thalassemia (3 = normal; 6 = fixed defect; 7 = reversible defect)',
                  controller: _thal,
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: _onSubmit,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    padding: EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    textStyle: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  child: Text("Submit", style: TextStyle(color: Colors.white)),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  _onSubmit() async {
    if (_formKey.currentState!.validate()) {
      final requestModel = RequestModel(
        age: double.tryParse(_age.text),
        sex: double.tryParse(_age.text),
        cp: double.tryParse(_age.text),
        trestbps: double.tryParse(_age.text),
        chol: double.tryParse(_age.text),
        fbs: double.tryParse(_age.text),
        restecg: double.tryParse(_age.text),
        thalach: double.tryParse(_age.text),
        exang: int.tryParse(_age.text),
        oldpeak: double.tryParse(_age.text),
        slope: int.tryParse(_age.text),
        ca: double.tryParse(_age.text),
        thal: double.tryParse(_age.text),
      );
      try {
        prediction = await ApiHelper.predict(requestModel.toJson());
        showDialog(
          // ignore: use_build_context_synchronously
          context: context,
          builder: (context) {
            if (prediction != null) {
              return AlertDialog(
                title: Text(
                  'Prediction: ${prediction!['prediction']}',
                  style: TextStyle(fontSize: 40),
                ),
                content: Text(
                  'Result: ${prediction!['result']}',
                  style: TextStyle(fontSize: 24),
                ),
              );
            } else {
              return SnackBar(content: Text('Error'));
            }
          },
        );
        debugPrint('Prediction result: $prediction');
      } catch (e) {
        debugPrint('Error: $e');
      }
    }
  }

  bool isInt(String s) => int.tryParse(s) != null;
}
