import 'package:another_flushbar/flushbar_helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

import '../../shared/colors.dart';
import '../../stores/files/file_list_store.dart';
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
    return Container(
      decoration: const BoxDecoration(gradient: GradientBd.gradient),
      child: Scaffold(
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
      ),
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
            decoration: const BoxDecoration(gradient: GradientBd.gradient),
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
          )
        : const Center(
            child: Text("Методические материалы"),
          );
  }

  _buildListItem(int position) {
    return _buildCard(position);
  }

  _buildCard(int position) {
    return Card(
      color: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: ListTile(
        title: Text(_store.fileList!.files![position].title),
        subtitle: Text(
          "${(_store.fileList!.files![position].size / 1000).toString()} MB",
        ),
        onTap: () {},
      ),
    );
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
