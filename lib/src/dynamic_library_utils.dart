import 'dart:ffi';
import 'dart:io';

import 'package:first_flutter_ffi_study_project/src/ffi_bindings.dart';

class DynamicLibraryUtils {
  DynamicLibraryUtils._();

  static const String _testLibName = 'hello'; //库名称
  static FFIBinding? _bindings;

  static FFIBinding getFfiBindings() {
    return _bindings ??= FFIBinding(_loadTestLibrary(_testLibName));
  }

  static DynamicLibrary _loadTestLibrary(String libName) {
    final DynamicLibrary dylib = () {
      if (Platform.isMacOS || Platform.isIOS) {
        return DynamicLibrary.open('$libName.framework/$libName');
      }
      if (Platform.isAndroid || Platform.isLinux) {
        return DynamicLibrary.open('lib$libName.so');
      }
      if (Platform.isWindows) {
        return DynamicLibrary.open('$libName.dll');
      }
      throw UnsupportedError('Unknown platform: ${Platform.operatingSystem}');
    }();
    return dylib;
  }
}
