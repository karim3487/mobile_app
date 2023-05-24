import 'package:another_flushbar/flushbar_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:mobile_app/shared/colors.dart';
import '../../models/ad.dart';
import '../../stores/home/home_store.dart';
import '../../stores/user/user_store.dart';
import '../../widgets/navbar.dart';
import '../../widgets/progress_indicator_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late HomeStore _homeStore;
  late UserStore _userStore;

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    // initializing stores
    _homeStore = Provider.of<HomeStore>(context);
    _userStore = Provider.of<UserStore>(context);

    // check to see if already called api
    if (!_homeStore.loading) {
      _homeStore.getAds();
    }
    _userStore.getUser();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      drawer: NavBar(),
      appBar: AppBar(
        title: const Text("Новости"),
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
        return _homeStore.loading
            ? CustomProgressIndicatorWidget()
            : Material(
                child: _buildListView(),
              );
      },
    );
  }

  _buildListView() {
    return _homeStore.adsList != null
        ? Container(
            color: AppColors.primary,
            child: RefreshIndicator(
              onRefresh: () {
                if (!_homeStore.loading) {
                  return _homeStore.getAds();
                }
                return Future.delayed(Duration(seconds: 1));
              },
              child: ListView.separated(
                padding: const EdgeInsets.only(top: 10, left: 8, right: 8),
                itemCount: _homeStore.adsList!.ads!.length,
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
            child: Text("Новости"),
          );
  }

  Widget _buildListItem(int position) {
    return _buildCard(position);
  }

  Widget _buildCard(int position) {
    Ad? ad = _homeStore.adsList?.ads?[position];

    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      elevation: 3,
      child: ExpansionTile(
        expandedCrossAxisAlignment: CrossAxisAlignment.start,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        collapsedShape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        backgroundColor: Colors.white,
        collapsedBackgroundColor: Colors.white,
        tilePadding:
            const EdgeInsets.only(top: 10, bottom: 10, right: 15, left: 15),
        title: Text(
          "${ad!.creator.lastName} ${ad.creator.firstName ?? [
                0
              ]}. ${ad.creator.lastName ?? [0]}.",
          style: const TextStyle(
              fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black),
        ),
        subtitle: Text(
          ad.title,
          style: const TextStyle(fontSize: 16, color: Colors.black45),
          maxLines: 2,
        ),
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(right: 16, left: 16, bottom: 16),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                ad.text,
                style: const TextStyle(fontSize: 15, color: Colors.black),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _handleErrorMessage() {
    return Observer(
      builder: (context) {
        if (_homeStore.errorStore.errorMessage.isNotEmpty) {
          return _showErrorMessage(_homeStore.errorStore.errorMessage);
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
