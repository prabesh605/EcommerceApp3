import 'package:ecommerce_app3/bloc/imageUpload/imageUpload_event.dart';
import 'package:ecommerce_app3/bloc/imageUpload/imageUpload_state.dart';
import 'package:ecommerce_app3/services/image_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ImageuploadBloc extends Bloc<ImageUploadEvent, ImageuploadState> {
  UploadImageService uploadImageService = UploadImageService();
  ImageuploadBloc() : super(ImageInitial()) {
    on<UploadImage>((event, emit) async {
      emit(ImageLoading());
      String filePath = await uploadImageService.selectImage();
      if (filePath.isNotEmpty) {
        // String url = await uploadImageService.firebaseUpload(
        //   filePath,
        // ); //firebase
        String url = await uploadImageService.uploadImage(filePath);
        if (url.isNotEmpty) {
          emit(ImageLoaded(url));
        } else {
          emit(ImageError("error"));
        }
      } else {
        emit(ImageError("error"));
      }

      //selectimage return url
      //call imageupload return server image
      //emit server image
    });
  }
}
