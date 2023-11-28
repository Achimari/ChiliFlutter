class Preview {
  final String height;
  final String mp4;
  final String mp4Size;
  final String width;

  Preview({
    required this.height,
    required this.mp4,
    required this.mp4Size,
    required this.width,
  });

  factory Preview.fromJson(Map<String, dynamic> json) {
    return Preview(
      height: json['height'],
      mp4: json['mp4'],
      mp4Size: json['mp4_size'],
      width: json['width'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'height': height,
      'mp4': mp4,
      'mp4_size': mp4Size,
      'width': width,
    };
  }
}
