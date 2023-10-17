/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal,deprecated_member_use

import 'package:flutter/widgets.dart';

class $AssetsIconsGen {
  const $AssetsIconsGen();

  /// File path: assets/icons/light_off.png
  AssetGenImage get lightOff =>
      const AssetGenImage('assets/icons/light_off.png');

  /// File path: assets/icons/light_off@2x.png
  AssetGenImage get lightOff2x =>
      const AssetGenImage('assets/icons/light_off@2x.png');

  /// File path: assets/icons/light_off@3x.png
  AssetGenImage get lightOff3x =>
      const AssetGenImage('assets/icons/light_off@3x.png');

  /// File path: assets/icons/light_on.png
  AssetGenImage get lightOn => const AssetGenImage('assets/icons/light_on.png');

  /// File path: assets/icons/light_on@2x.png
  AssetGenImage get lightOn2x =>
      const AssetGenImage('assets/icons/light_on@2x.png');

  /// File path: assets/icons/light_on@3x.png
  AssetGenImage get lightOn3x =>
      const AssetGenImage('assets/icons/light_on@3x.png');

  /// File path: assets/icons/moon.png
  AssetGenImage get moon => const AssetGenImage('assets/icons/moon.png');

  /// File path: assets/icons/moon@2x.png
  AssetGenImage get moon2x => const AssetGenImage('assets/icons/moon@2x.png');

  /// File path: assets/icons/moon@3x.png
  AssetGenImage get moon3x => const AssetGenImage('assets/icons/moon@3x.png');

  /// File path: assets/icons/sun.png
  AssetGenImage get sun => const AssetGenImage('assets/icons/sun.png');

  /// File path: assets/icons/sun@2x.png
  AssetGenImage get sun2x => const AssetGenImage('assets/icons/sun@2x.png');

  /// File path: assets/icons/sun@3x.png
  AssetGenImage get sun3x => const AssetGenImage('assets/icons/sun@3x.png');

  /// File path: assets/icons/theme_icon.png
  AssetGenImage get themeIcon =>
      const AssetGenImage('assets/icons/theme_icon.png');

  /// File path: assets/icons/theme_icon@2x.png
  AssetGenImage get themeIcon2x =>
      const AssetGenImage('assets/icons/theme_icon@2x.png');

  /// File path: assets/icons/theme_icon@3x.png
  AssetGenImage get themeIcon3x =>
      const AssetGenImage('assets/icons/theme_icon@3x.png');

  /// List of all assets
  List<AssetGenImage> get values => [
        lightOff,
        lightOff2x,
        lightOff3x,
        lightOn,
        lightOn2x,
        lightOn3x,
        moon,
        moon2x,
        moon3x,
        sun,
        sun2x,
        sun3x,
        themeIcon,
        themeIcon2x,
        themeIcon3x
      ];
}

class $AssetsImagesGen {
  const $AssetsImagesGen();

  /// File path: assets/images/map.png
  AssetGenImage get map => const AssetGenImage('assets/images/map.png');

  /// File path: assets/images/sheet_header.png
  AssetGenImage get sheetHeader =>
      const AssetGenImage('assets/images/sheet_header.png');

  /// List of all assets
  List<AssetGenImage> get values => [map, sheetHeader];
}

class $AssetsTranslationsGen {
  const $AssetsTranslationsGen();

  /// File path: assets/translations/en.json
  String get en => 'assets/translations/en.json';

  /// List of all assets
  List<String> get values => [en];
}

class Assets {
  Assets._();

  static const $AssetsIconsGen icons = $AssetsIconsGen();
  static const $AssetsImagesGen images = $AssetsImagesGen();
  static const $AssetsTranslationsGen translations = $AssetsTranslationsGen();
}

class AssetGenImage {
  const AssetGenImage(this._assetName);

  final String _assetName;

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
