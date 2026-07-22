abstract class ImageuploadState {}

class ImageInitial extends ImageuploadState {}

class ImageLoading extends ImageuploadState {}

class ImageError extends ImageuploadState {
  final String error;
  ImageError(this.error);
}

class ImageLoaded extends ImageuploadState {
  final String url;
  ImageLoaded(this.url);
}
