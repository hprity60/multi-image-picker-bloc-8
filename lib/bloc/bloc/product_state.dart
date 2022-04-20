part of 'product_bloc.dart';

@immutable
class ProductState {
  final List<XFile>? images;

  ProductState({this.images});

  ProductState copywith({List<XFile>? images}) =>
      ProductState(images: images ?? this.images);
}
