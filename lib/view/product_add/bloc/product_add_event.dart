part of 'product_add_bloc.dart';

@freezed
class ProductAddEvent with _$ProductAddEvent {
  const factory ProductAddEvent.started() = _Started;
}