/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal,deprecated_member_use

import 'package:flutter/widgets.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:vector_graphics/vector_graphics.dart';

class $AssetsImagesGen {
  const $AssetsImagesGen();

  /// File path: assets/images/Prasad_Image-removebg.png
  AssetGenImage get prasadImageRemovebg =>
      const AssetGenImage('assets/images/Prasad_Image-removebg.png');

  /// File path: assets/images/check.svg
  SvgGenImage get check => const SvgGenImage('assets/images/check.svg');

  /// File path: assets/images/dragon.jpg
  AssetGenImage get dragon => const AssetGenImage('assets/images/dragon.jpg');

  /// File path: assets/images/facebook_logo.png
  AssetGenImage get facebookLogo =>
      const AssetGenImage('assets/images/facebook_logo.png');

  /// File path: assets/images/g1.png
  AssetGenImage get g1 => const AssetGenImage('assets/images/g1.png');

  /// File path: assets/images/g2.png
  AssetGenImage get g2 => const AssetGenImage('assets/images/g2.png');

  /// File path: assets/images/google_logo.png
  AssetGenImage get googleLogo =>
      const AssetGenImage('assets/images/google_logo.png');

  /// File path: assets/images/hair_fixing_logo-removebg-preview.png
  AssetGenImage get hairFixingLogoRemovebgPreview => const AssetGenImage(
      'assets/images/hair_fixing_logo-removebg-preview.png');

  /// File path: assets/images/hair_fixing_logo.png
  AssetGenImage get hairFixingLogo =>
      const AssetGenImage('assets/images/hair_fixing_logo.png');

  /// File path: assets/images/hfz_logo.svg
  SvgGenImage get hfzLogo => const SvgGenImage('assets/images/hfz_logo.svg');

  /// File path: assets/images/image1.png
  AssetGenImage get image1 => const AssetGenImage('assets/images/image1.png');

  /// File path: assets/images/image2.png
  AssetGenImage get image2 => const AssetGenImage('assets/images/image2.png');

  /// File path: assets/images/image3.png
  AssetGenImage get image3 => const AssetGenImage('assets/images/image3.png');

  /// File path: assets/images/stacked-steps-haikei.png
  AssetGenImage get stackedStepsHaikei =>
      const AssetGenImage('assets/images/stacked-steps-haikei.png');

  /// List of all assets
  List<dynamic> get values => [
        prasadImageRemovebg,
        check,
        dragon,
        facebookLogo,
        g1,
        g2,
        googleLogo,
        hairFixingLogoRemovebgPreview,
        hairFixingLogo,
        hfzLogo,
        image1,
        image2,
        image3,
        stackedStepsHaikei
      ];
}

class $AssetsTranslationsGen {
  const $AssetsTranslationsGen();

  /// File path: assets/translations/en-UK.json
  String get enUK => 'assets/translations/en-UK.json';

  /// File path: assets/translations/hi-IN.json
  String get hiIN => 'assets/translations/hi-IN.json';

  /// File path: assets/translations/kn-IN.json
  String get knIN => 'assets/translations/kn-IN.json';

  /// File path: assets/translations/te-IN.json
  String get teIN => 'assets/translations/te-IN.json';

  /// List of all assets
  List<String> get values => [enUK, hiIN, knIN, teIN];
}

class Assets {
  Assets._();

  static const $AssetsImagesGen images = $AssetsImagesGen();
  static const $AssetsTranslationsGen translations = $AssetsTranslationsGen();
}

class AssetGenImage {
  const AssetGenImage(
    this._assetName, {
    this.size,
    this.flavors = const {},
  });

  final String _assetName;

  final Size? size;
  final Set<String> flavors;

  Image image({
    Key? key,
    AssetBundle? bundle,
    ImageFrameBuilder? frameBuilder,
    ImageErrorWidgetBuilder? errorBuilder,
    String? semanticLabel,
    bool excludeFromSemantics = false,
    double? scale,
    double? width,
    double? height,
    Color? color,
    Animation<double>? opacity,
    BlendMode? colorBlendMode,
    BoxFit? fit,
    AlignmentGeometry alignment = Alignment.center,
    ImageRepeat repeat = ImageRepeat.noRepeat,
    Rect? centerSlice,
    bool matchTextDirection = false,
    bool gaplessPlayback = false,
    bool isAntiAlias = false,
    String? package,
    FilterQuality filterQuality = FilterQuality.low,
    int? cacheWidth,
    int? cacheHeight,
  }) {
    return Image.asset(
      _assetName,
      key: key,
      bundle: bundle,
      frameBuilder: frameBuilder,
      errorBuilder: errorBuilder,
      semanticLabel: semanticLabel,
      excludeFromSemantics: excludeFromSemantics,
      scale: scale,
      width: width,
      height: height,
      color: color,
      opacity: opacity,
      colorBlendMode: colorBlendMode,
      fit: fit,
      alignment: alignment,
      repeat: repeat,
      centerSlice: centerSlice,
      matchTextDirection: matchTextDirection,
      gaplessPlayback: gaplessPlayback,
      isAntiAlias: isAntiAlias,
      package: package,
      filterQuality: filterQuality,
      cacheWidth: cacheWidth,
      cacheHeight: cacheHeight,
    );
  }

  ImageProvider provider({
    AssetBundle? bundle,
    String? package,
  }) {
    return AssetImage(
      _assetName,
      bundle: bundle,
      package: package,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}

class SvgGenImage {
  const SvgGenImage(
    this._assetName, {
    this.size,
    this.flavors = const {},
  }) : _isVecFormat = false;

  const SvgGenImage.vec(
    this._assetName, {
    this.size,
    this.flavors = const {},
  }) : _isVecFormat = true;

  final String _assetName;
  final Size? size;
  final Set<String> flavors;
  final bool _isVecFormat;

  SvgPicture svg({
    Key? key,
    bool matchTextDirection = false,
    AssetBundle? bundle,
    String? package,
    double? width,
    double? height,
    BoxFit fit = BoxFit.contain,
    AlignmentGeometry alignment = Alignment.center,
    bool allowDrawingOutsideViewBox = false,
    WidgetBuilder? placeholderBuilder,
    String? semanticsLabel,
    bool excludeFromSemantics = false,
    SvgTheme? theme,
    ColorFilter? colorFilter,
    Clip clipBehavior = Clip.hardEdge,
    @deprecated Color? color,
    @deprecated BlendMode colorBlendMode = BlendMode.srcIn,
    @deprecated bool cacheColorFilter = false,
  }) {
    final BytesLoader loader;
    if (_isVecFormat) {
      loader = AssetBytesLoader(
        _assetName,
        assetBundle: bundle,
        packageName: package,
      );
    } else {
      loader = SvgAssetLoader(
        _assetName,
        assetBundle: bundle,
        packageName: package,
        theme: theme,
      );
    }
    return SvgPicture(
      loader,
      key: key,
      matchTextDirection: matchTextDirection,
      width: width,
      height: height,
      fit: fit,
      alignment: alignment,
      allowDrawingOutsideViewBox: allowDrawingOutsideViewBox,
      placeholderBuilder: placeholderBuilder,
      semanticsLabel: semanticsLabel,
      excludeFromSemantics: excludeFromSemantics,
      colorFilter: colorFilter ??
          (color == null ? null : ColorFilter.mode(color, colorBlendMode)),
      clipBehavior: clipBehavior,
      cacheColorFilter: cacheColorFilter,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}
