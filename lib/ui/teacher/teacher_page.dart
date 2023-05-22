import 'package:another_flushbar/flushbar_helper.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobile_app/stores/teacher/teacher_store.dart';
import 'package:mobile_app/ui/teacher/photo_view.dart';
import 'package:photo_view/photo_view.dart';
import 'package:provider/provider.dart';

import '../../shared/colors.dart';
import '../../utils/routes.dart';
import '../../widgets/navbar.dart';
import '../../widgets/progress_indicator_widget.dart';

class TeacherPage extends StatefulWidget {
  const TeacherPage({super.key});

  @override
  State<TeacherPage> createState() => _TeacherPageState();
}

class _TeacherPageState extends State<TeacherPage> {
  late TeacherStore _store;
  late PhotoViewScaleStateController scaleStateController;

  @override
  void initState() {
    scaleStateController = PhotoViewScaleStateController();
    super.initState();
  }

  @override
  void dispose() {
    scaleStateController.dispose();
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    // initializing stores
    _store = Provider.of<TeacherStore>(context);

    // check to see if already called api
    if (!_store.loading) {
      _store.getTeachers();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      appBar: AppBar(
        title: const Text("Преподаватели"),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pushNamed(context, Routes.home);
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
    return _store.teacherList != null
        ? Container(
            color: AppColors.primary,
            child: RefreshIndicator(
              onRefresh: () {
                if (!_store.loading) {
                  return _store.getTeachers();
                }
                return Future.delayed(Duration(seconds: 1));
              },
              child: ListView.separated(
                padding: const EdgeInsets.only(top: 10, left: 8, right: 8),
                itemCount: _store.teacherList!.teachers!.length,
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
            child: Text("Учителя"),
          );
  }

  _buildListItem(int position) {
    return _buildCard(position);
  }

  Widget _buildCard(int position) {
    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: SizedBox(
        height: 180,
        child: Row(children: [
          Padding(
            padding: const EdgeInsets.all(15),
            child: SizedBox(
              height: 160,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: InkWell(
                  child: CachedNetworkImage(
                    imageUrl: _store.teacherList!.teachers![position].imgUrl,
                    placeholder: (context, url) =>
                        Container(height: 160, color: Colors.grey),
                    errorWidget: (context, url, error) => Icon(Icons.error),
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ImageViewPage(
                          appBarTitle:
                              _store.teacherList!.teachers![position].fullName,
                          imageProvider: NetworkImage(
                            _store.teacherList!.teachers![position].imgUrl,
                          ),
                          maxScale: 0.6,
                          minScale: 0.03,
                          loadingBuilder: (context, event) {
                            if (event == null) {
                              return CustomProgressIndicatorWidget();
                            }

                            final value = event.cumulativeBytesLoaded /
                                (event.expectedTotalBytes ??
                                    event.cumulativeBytesLoaded);

                            final percentage = (100 * value).floor();
                            return Center(
                              child: Text("$percentage%"),
                            );
                          },
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(0, 20, 15, 5),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    _store.teacherList!.teachers![position].fullName,
                    maxLines: null,
                    textAlign: TextAlign.left,
                    style: const TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: Text(
                      _store.teacherList!.teachers![position].jobTitle,
                      textAlign: TextAlign.left,
                      maxLines: null,
                      style:
                          const TextStyle(color: Colors.black54, fontSize: 16),
                    ),
                  ),
                ],
              ),
            ),
          )
        ]),
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
