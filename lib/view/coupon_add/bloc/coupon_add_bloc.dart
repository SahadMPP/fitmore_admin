import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'coupon_add_event.dart';
part 'coupon_add_state.dart';
part 'coupon_add_bloc.freezed.dart';

class CouponAddBloc extends Bloc<CouponAddEvent, CouponAddState> {
  CouponAddBloc() : super(_Initial()) {
    on<CouponAddEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
