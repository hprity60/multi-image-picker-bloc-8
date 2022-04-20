import 'package:bloc/bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:meta/meta.dart';

part 'product_event.dart';
part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  ProductBloc() : super(ProductState()) {
    on<onSelectMultipleImageEvent>((_onSelectMultipleImages));
    on<onUnSelectMultipleImageEvent>((_onUnSelectMultipleImages));
  }
  Future<void> _onSelectMultipleImages(
      onSelectMultipleImageEvent event, Emitter<ProductState> emit) async {
    emit(state.copywith(images: event.images));
  }

  Future<void> _onUnSelectMultipleImages(
      onUnSelectMultipleImageEvent event, Emitter<ProductState> emit) async {
    emit(state.copywith(images: []));
  }
}
