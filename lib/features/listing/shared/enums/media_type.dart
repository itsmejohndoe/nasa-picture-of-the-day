enum MediaType {
  image('image'),
  video('video');

  final String type;

  const MediaType(this.type);

  factory MediaType.fromValue(String value) {
    if (value == 'image') {
      return MediaType.image;
    }
    return MediaType.video;
  }
}
