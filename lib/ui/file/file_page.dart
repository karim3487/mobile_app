import 'package:another_flushbar/flushbar_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:percent_indicator/percent_indicator.dart';

import '../../shared/colors.dart';
import '../../stores/files/file_list_store.dart';
import '../../stores/files/file_store.dart';
import '../../widgets/navbar.dart';
import '../../widgets/progress_indicator_widget.dart';

class FilePage extends StatefulWidget {
  const FilePage({super.key});

  @override
  State<FilePage> createState() => _FilePageState();
}

class _FilePageState extends State<FilePage> {
  late FileListStore _store;

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    // initializing stores
    _store = Provider.of<FileListStore>(context);

    // check to see if already called api
    if (!_store.loading) {
      _store.getFiles();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const NavBar(),
      appBar: AppBar(
        title: const Text("Методические материалы"),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return Stack(
      children: <Widget>[
        _handleErrorMessage(),
        _buildMainContent(),
      ],
    );
  }

  _buildMainContent() {
    return Observer(
      builder: (context) {
        return _store.loading
            ? CustomProgressIndicatorWidget()
            : Material(
                child: _buildListView(),
              );
      },
    );
  }

  _buildListView() {
    return _store.fileList != null
        ? Container(
            color: AppColors.primary,
            child: RefreshIndicator(
              onRefresh: () {
                if (!_store.loading) {
                  return _store.getFiles();
                }
                return Future.delayed(Duration(seconds: 1));
              },
              child: ListView.separated(
                padding: const EdgeInsets.only(top: 10, left: 8, right: 8),
                itemCount: _store.fileList!.files!.length,
                separatorBuilder: (context, position) {
                  return const SizedBox(
                    height: 5,
                  );
                },
                itemBuilder: (context, position) {
                  return _buildListItem(position);
                },
              ),
            ),
          )
        : const Center(
            child: Text("Методические материалы"),
          );
  }

  _buildListItem(int position) {
    return _buildCard(position);
  }

  _buildCard(int position) {
    FileStore fileStore = FileStore(_store.fileList!.files![position]);
    return FileCard(fileStore: fileStore);
  }

  Widget _handleErrorMessage() {
    return Observer(
      builder: (context) {
        if (_store.errorStore.errorMessage.isNotEmpty) {
          return _showErrorMessage(_store.errorStore.errorMessage);
        }
        return const SizedBox.shrink();
      },
    );
  }

  // General Methods:-----------------------------------------------------------
  _showErrorMessage(String message) {
    Future.delayed(const Duration(milliseconds: 0), () {
      if (message.isNotEmpty) {
        FlushbarHelper.createError(
          message: message,
          title: "Ошибка",
          duration: const Duration(seconds: 3),
        ).show(context);
      }
    });

    return const SizedBox.shrink();
  }
}

class FileCard extends StatelessWidget {
  const FileCard({
    super.key,
    required this.fileStore,
  });

  final FileStore fileStore;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        fileStore.uploadFile();
      },
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        elevation: 3,
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Container(
                  color: fileStore.color,
                  width: 60,
                  height: 60,
                  alignment: Alignment.center,
                  child: Observer(
                    builder: (BuildContext context) {
                      return Stack(
                        children: [
                          Positioned.fill(
                            child: Container(
                              alignment: Alignment.center,
                              child: Text(
                                (fileStore.ext.toUpperCase()).substring(1),
                                style: const TextStyle(
                                  fontSize: 17,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                          if (fileStore.isUploading)
                            Positioned.fill(
                              child: Container(
                                alignment: Alignment.center,
                                color: Colors.black54,
                                child: CircularPercentIndicator(
                                  radius: 25,
                                  percent: fileStore.progress / 100,
                                  lineWidth: 5,
                                  progressColor: Colors.white,
                                  backgroundColor: Colors.grey,
                                  animation: true,
                                  animationDuration: 1200,
                                  circularStrokeCap: CircularStrokeCap.round,
                                  center: Text(
                                    fileStore.progress.toString(),
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                            )
                        ],
                      );
                    },
                  ),
                ),
              ),
              SizedBox(width: 10),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      fileStore.file.title,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 4),
                    Text(
                      fileStore.fileSize,
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
