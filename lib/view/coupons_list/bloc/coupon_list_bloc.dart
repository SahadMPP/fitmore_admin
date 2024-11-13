import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'coupon_list_event.dart';
part 'coupon_list_state.dart';
part 'coupon_list_bloc.freezed.dart';

class CouponListBloc extends Bloc<CouponListEvent, CouponListState> {
  CouponListBloc() : super(_Initial()) {
    on<CouponListEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
