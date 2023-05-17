// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'file_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$FileStore on _FileStore, Store {
  Computed<String>? _$fileSizeComputed;

  @override
  String get fileSize => (_$fileSizeComputed ??=
          Computed<String>(() => super.fileSize, name: '_FileStore.fileSize'))
      .value;
  Computed<String>? _$extComputed;

  @override
  String get ext => (_$extComputed ??=
          Computed<String>(() => super.ext, name: '_FileStore.ext'))
      .value;

  late final _$isUploadingAtom =
      Atom(name: '_FileStore.isUploading', context: context);

  @override
  bool get isUploading {
    _$isUploadingAtom.reportRead();
    return super.isUploading;
  }

  @override
  set isUploading(bool value) {
    _$isUploadingAtom.reportWrite(value, super.isUploading, () {
      super.isUploading = value;
    });
  }

  late final _$progressAtom =
      Atom(name: '_FileStore.progress', context: context);

  @override
  double get progress {
    _$progressAtom.reportRead();
    return super.progress;
  }

  @override
  set progress(double value) {
    _$progressAtom.reportWrite(value, super.progress, () {
      super.progress = value;
    });
  }

  late final _$uploadFileAsyncAction =
      AsyncAction('_FileStore.uploadFile', context: context);

  @override
  Future<void> uploadFile() {
    return _$uploadFileAsyncAction.run(() => super.uploadFile());
  }

  @override
  String toString() {
    return '''
isUploading: ${isUploading},
progress: ${progress},
fileSize: ${fileSize},
ext: ${ext}
    ''';
  }
}
