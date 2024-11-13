import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'dashbord_event.dart';
part 'dashbord_state.dart';
part 'dashbord_bloc.freezed.dart';

class DashbordBloc extends Bloc<DashbordEvent, DashbordState> {
  DashbordBloc() : super(_Initial()) {
    on<DashbordEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
