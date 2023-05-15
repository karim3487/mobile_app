// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'file_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$FileStore on _FileStore, Store {
  Computed<bool>? _$loadingComputed;

  @override
  bool get loading => (_$loadingComputed ??=
          Computed<bool>(() => super.loading, name: '_FileStore.loading'))
      .value;

  late final _$fetchFilesFutureAtom =
      Atom(name: '_FileStore.fetchFilesFuture', context: context);

  @override
  ObservableFuture<FileList?> get fetchFilesFuture {
    _$fetchFilesFutureAtom.reportRead();
    return super.fetchFilesFuture;
  }

  @override
  set fetchFilesFuture(ObservableFuture<FileList?> value) {
    _$fetchFilesFutureAtom.reportWrite(value, super.fetchFilesFuture, () {
      super.fetchFilesFuture = value;
    });
  }

  late final _$fileListAtom =
      Atom(name: '_FileStore.fileList', context: context);

  @override
  FileList? get fileList {
    _$fileListAtom.reportRead();
    return super.fileList;
  }

  @override
  set fileList(FileList? value) {
    _$fileListAtom.reportWrite(value, super.fileList, () {
      super.fileList = value;
    });
  }

  late final _$successAtom = Atom(name: '_FileStore.success', context: context);

  @override
  bool get success {
    _$successAtom.reportRead();
    return super.success;
  }

  @override
  set success(bool value) {
    _$successAtom.reportWrite(value, super.success, () {
      super.success = value;
    });
  }

  late final _$getFilesAsyncAction =
      AsyncAction('_FileStore.getFiles', context: context);

  @override
  Future<void> getFiles() {
    return _$getFilesAsyncAction.run(() => super.getFiles());
  }

  @override
  String toString() {
    return '''
fetchFilesFuture: ${fetchFilesFuture},
fileList: ${fileList},
success: ${success},
loading: ${loading}
    ''';
  }
}
