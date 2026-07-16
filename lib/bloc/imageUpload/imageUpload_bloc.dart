import 'package:ecommerce_app3/bloc/imageUpload/imageUpload_event.dart';
import 'package:ecommerce_app3/bloc/imageUpload/imageUpload_state.dart';
import 'package:ecommerce_app3/services/image_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ImageuploadBloc extends Bloc<ImageUploadEvent, ImageuploadState> {
  UploadImageService uploadImageService = UploadImageService();
  ImageuploadBloc() : super(ImageInitial()) {
    on<UploadImage>((event, emit) {
      emit(ImageLoading());
      //selectimage return url
      //call imageupload return server image
      //emit server image
    });
  }
}
