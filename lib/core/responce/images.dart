import 'package:chili_tusk/core/responce/preview_gifs.dart';

import 'original.dart';
import 'preview.dart';

class Images {
  final Original original;
  final Preview preview;
  final PreviewGif previewGif;

  Images({
    required this.original,
    required this.preview,
    required this.previewGif,
  });

  factory Images.fromJson(Map<String, dynamic> json) {
    return Images(
      original: Original.fromJson(json['original']),
      preview: Preview.fromJson(json['preview']),
      previewGif: PreviewGif.fromJson(json['preview_gif']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'original': original.toJson(),
      'preview': preview.toJson(),
      'preview_gif': previewGif.toJson(),
    };
  }
}
