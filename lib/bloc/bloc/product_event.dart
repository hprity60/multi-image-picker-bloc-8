part of 'product_bloc.dart';

@immutable
abstract class ProductEvent {}

class onSelectMultipleImageEvent extends ProductEvent {
  final List<XFile> images;

  onSelectMultipleImageEvent(this.images);
}

class onUnSelectMultipleImageEvent extends ProductEvent {}
