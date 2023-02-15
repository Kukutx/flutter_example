// ignore_for_file: non_constant_identifier_names

import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

// 判断当前环境平台
class PlatformUtils {
  static bool _isWeb() {
    // 通过kIsWeb变量判断是否为web环境!
    return kIsWeb == true;
  }

  static bool _isAndroid() {
    return _isWeb() ? false : Platform.isAndroid;
  }

  static bool _isIOS() {
    return _isWeb() ? false : Platform.isIOS;
  }

  static bool _isMacOS() {
    return _isWeb() ? false : Platform.isMacOS;
  }

  static bool _isWindows() {
    return _isWeb() ? false : Platform.isWindows;
  }

  static bool _isFuchsia() {
    return _isWeb() ? false : Platform.isFuchsia;
  }

  static bool _isLinux() {
    return _isWeb() ? false : Platform.isLinux;
  }

  static bool get isWeb => _isWeb();

  static bool get isAndroid => _isAndroid();

  static bool get isIOS => _isIOS();

  static bool get isMacOS => _isMacOS();

  static bool get isWindows => _isWindows();

  static bool get isFuchsia => _isFuchsia();

  static bool get isLinux => _isLinux();
}

// 判断目标平台
// ignore: camel_case_types
class isPlatform extends StatefulWidget {
  const isPlatform({super.key, required this.SupportedComponents, required this.NoSupportedComponents});
  final Widget SupportedComponents;
  final Widget NoSupportedComponents;

  @override
  State<isPlatform> createState() => _isPlatformState();
}

// ignore: camel_case_types
class _isPlatformState extends State<isPlatform> {
    // 判断目标平台
    Widget _isPlatform(Widget SupportedComponents, Widget NoSupportedComponents) {
    if (PlatformUtils.isAndroid) {
      // Android
      return SupportedComponents;
    } else if (PlatformUtils.isIOS) {
      // IOS
      return SupportedComponents;
    } else if (PlatformUtils.isWeb) {
      // Web
      return SupportedComponents;
    } else if (PlatformUtils.isFuchsia) {
      // Fuchsia
      return NoSupportedComponents;
    } else if (PlatformUtils.isWindows) {
      // Windows
      return NoSupportedComponents;
    } else if (PlatformUtils.isMacOS) {
      // MacOS
      return NoSupportedComponents;
    } else if (PlatformUtils.isLinux) {
      // Linux
      return NoSupportedComponents;
    } else {
      return NoSupportedComponents;
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _isPlatform(widget.SupportedComponents,widget.NoSupportedComponents),
    );
  }
}
