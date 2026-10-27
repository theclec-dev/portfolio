class AppAssets {
  static final String imagePath = 'assets/images/';
  static final String iconPath = 'assets/icons/';

  //fonts
  static final String offBit = 'OffBit';
  static final String archivo = 'Archivo';
  static final String offBitDot = 'OffBit-Dot';
  static final String offBit101 = 'OffBit101';

  //images
  static String avatarVector = '${imagePath}avatar_vector.png';
  static String avatarLive = '${imagePath}avatar_live.png';
  static String photo = '${imagePath}photo.png';

  //project images
  static String projectIcon(String id) => '${imagePath}projects/$id.png';

  /// Screenshot/mockup shown behind the Projects list while [id] is hovered.
  /// Optional: if the file doesn't exist, the hover simply shows no image.
  static String projectPreview(String id) => '${imagePath}projects/${id}_preview.png';

  //icons
}
