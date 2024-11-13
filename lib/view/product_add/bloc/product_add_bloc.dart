import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'product_add_event.dart';
part 'product_add_state.dart';
part 'product_add_bloc.freezed.dart';

class ProductAddBloc extends Bloc<ProductAddEvent, ProductAddState> {
  ProductAddBloc() : super(_Initial()) {
    on<ProductAddEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
