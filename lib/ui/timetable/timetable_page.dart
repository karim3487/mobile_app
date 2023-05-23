import 'package:another_flushbar/flushbar_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:mobile_app/shared/colors.dart';
import '../../models/ad.dart';
import '../../stores/home/home_store.dart';
import '../../stores/timetable/timetable_store.dart';
import '../../stores/user/user_store.dart';
import '../../widgets/navbar.dart';
import '../../widgets/progress_indicator_widget.dart';

class TimetablePage extends StatefulWidget {
  const TimetablePage({super.key});

  @override
  State<TimetablePage> createState() => _TimetablePageState();
}

class _TimetablePageState extends State<TimetablePage> {
  late TimetableStore _store;

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    // initializing stores
    _store = Provider.of<TimetableStore>(context);

    // check to see if already called api
    if (!_store.loading) {
      _store.getTimetables('И508Б');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      drawer: NavBar(),
      appBar: AppBar(
        title: const Text("Расписание"),
      ),
      body: _buildBody(),
    );
  }

  // body methods:--------------------------------------------------------------
  Widget _buildBody() {
    return Stack(
      children: <Widget>[
        _handleErrorMessage(),
        _buildMainContent(),
      ],
    );
  }

  Observer _buildMainContent() {
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
    return _store.timetableList != null
        ? Container(
            color: AppColors.primary,
            child: Container(),
          )
        : const Center(
            child: Text("Расписание"),
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
