class Original {
  final String frames;
  final String hash;
  final String height;
  final String mp4;
  final String mp4Size;
  final String size;
  final String url;
  final String webp;
  final String webpSize;
  final String width;

  Original({
    required this.frames,
    required this.hash,
    required this.height,
    required this.mp4,
    required this.mp4Size,
    required this.size,
    required this.url,
    required this.webp,
    required this.webpSize,
    required this.width,
  });

  factory Original.fromJson(Map<String, dynamic> json) {
    return Original(
      frames: json['frames'],
      hash: json['hash'],
      height: json['height'],
      mp4: json['mp4'],
      mp4Size: json['mp4_size'],
      size: json['size'],
      url: json['url'],
      webp: json['webp'],
      webpSize: json['webp_size'],
      width: json['width'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'frames': frames,
      'hash': hash,
      'height': height,
      'mp4': mp4,
      'mp4_size': mp4Size,
      'size': size,
      'url': url,
      'webp': webp,
      'webp_size': webpSize,
      'width': width,
    };
  }
}
