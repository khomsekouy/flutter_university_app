import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_university_app/environment/model/environment_model.dart';


part 'environment_state.dart';

class EnvironmentCubit extends Cubit<EnvironmentState> {
  EnvironmentCubit() : super(EnvironmentInitial());

  /// emits [EnvironmentLoaded] state with the [environment] model
  void loadEnvironment(EnvironmentModel environment) {
    emit(EnvironmentLoaded(environment: environment));
  }
}
