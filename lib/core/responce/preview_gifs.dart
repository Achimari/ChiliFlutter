class PreviewGif {
  final String height;
  final String size;
  final String url;
  final String width;

  PreviewGif({
    required this.height,
    required this.size,
    required this.url,
    required this.width,
  });

  factory PreviewGif.fromJson(Map<String, dynamic> json) {
    return PreviewGif(
      height: json['height'],
      size: json['size'],
      url: json['url'],
      width: json['width'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'height': height,
      'size': size,
      'url': url,
      'width': width,
    };
  }
}
