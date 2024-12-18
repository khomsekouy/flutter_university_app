
import 'package:flutter_university_app/app/app.dart';
import 'package:flutter_university_app/app/bootstrap.dart';
import 'package:flutter_university_app/environment/model/environment_model.dart';

void main() {
  bootstrap(() {
    final environment = EnvironmentModel.from(Environment.dev);
    return App(environment: environment);
  });
}
