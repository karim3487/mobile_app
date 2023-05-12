// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:another_flushbar/flushbar_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:mobile_app/models/ad.dart';
import 'package:mobile_app/shared/colors.dart';
import 'package:mobile_app/stores/auth_store/auth_store.dart';

import '../../data/sharedpref/constants/preferences.dart';
import '../../stores/home_store/home_store.dart';
import '../../utils/routes.dart';
import '../../widgets/progress_indicator_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late HomeStore _homeStore;
  late AuthStore _authStore;

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    // initializing stores
    _homeStore = Provider.of<HomeStore>(context);
    _authStore = Provider.of<AuthStore>(context);

    // check to see if already called api
    if (!_homeStore.loading) {
      _homeStore.getAds();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(gradient: GradientBd.gradient),
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Новости"),
          actions: [
            IconButton(
              onPressed: () {
                _authStore.logout();
                SharedPreferences.getInstance().then((preference) {
                  preference.setBool(Preferences.isAuthenticated, false);
                  Navigator.of(context).pushReplacementNamed(Routes.login);
                });
              },
              icon: const Icon(
                Icons.power_settings_new,
              ),
            )
          ],
        ),
        body: _buildBody(),
      ),
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
            decoration: const BoxDecoration(gradient: GradientBd.gradient),
            child: ListView.separated(
              padding: const EdgeInsets.only(top: 10, left: 8, right: 8),
              itemCount: _homeStore.adsList!.ads!.length,
              separatorBuilder: (context, position) {
                return const SizedBox(
                  height: 10,
                );
              },
              itemBuilder: (context, position) {
                return _buildListItem(position);
              },
            ),
          )
        : const Center(
            child: Text("Новости"),
          );
  }

  Widget _buildListItem(int position) {
    return CardAd(ad: _homeStore.adsList?.ads?[position]);
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

class CardAd extends StatefulWidget {
  final Ad? ad;
  const CardAd({
    Key? key,
    this.ad,
  }) : super(key: key);

  @override
  State<CardAd> createState() => _CardAdState();
}

class _CardAdState extends State<CardAd> {
  late Ad? _ad;
  bool _isExpanded = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  void initState() {
    super.initState();
    _ad = widget.ad;
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // height: 130,
      child: ExpansionTile(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        collapsedShape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        backgroundColor: Colors.white,
        collapsedBackgroundColor: Colors.white,
        tilePadding:
            const EdgeInsets.only(top: 10, bottom: 10, right: 15, left: 15),
        title: Text(
          "${_ad?.creator.lastName} ${_ad?.creator.firstName[0]}. ${_ad?.creator.lastName[0]}.",
          style: const TextStyle(
              fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black),
        ),
        subtitle: Text(
          '${_ad?.title}',
          style: const TextStyle(fontSize: 16, color: Colors.black45),
          maxLines: 2,
        ),
        onExpansionChanged: (value) => _isExpanded = value,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(right: 16, left: 16, bottom: 16),
            child: Text(
              '${_ad?.text}',
              style: const TextStyle(fontSize: 15, color: Colors.black),
            ),
          ),
        ],
      ),
    );
  }
}
