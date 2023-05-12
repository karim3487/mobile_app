import 'package:another_flushbar/flushbar_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobile_app/models/ad.dart';
import 'package:mobile_app/shared/colors.dart';
import 'package:mobile_app/stores/auth_store/auth_store.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../data/sharedpref/constants/preferences.dart';
import '../../stores/ad_store/ad_store.dart';
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
    return Scaffold(
      backgroundColor: Colors.white,
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
            : Material(child: _buildListView());
      },
    );
  }

  _buildListView() {
    return _homeStore.adsList != null
        ? ListView.separated(
            itemCount: _homeStore.adsList!.ads!.length,
            separatorBuilder: (context, position) {
              return Divider();
            },
            itemBuilder: (context, position) {
              return _buildListItem(position);
            },
          )
        : const Center(
            child: Text("Новости"),
          );
  }

  Widget _buildListItem(int position) {
    return ListTile(
      dense: true,
      leading: Icon(Icons.cloud_circle),
      title: Text(
        '${_homeStore.adsList?.ads?[position].title}',
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        softWrap: false,
        // style: Theme.of(context).textTheme.subtitle1,
      ),
      subtitle: Text(
        '${_homeStore.adsList?.ads?[position].text}',
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        softWrap: false,
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
          duration: Duration(seconds: 3),
        ).show(context);
      }
    });

    return const SizedBox.shrink();
  }
}

class CardAd extends StatelessWidget {
  const CardAd({
    super.key,
    required this.ad,
  });
  final Ad ad;

  @override
  Widget build(BuildContext context) {
    AdStore adStore = AdStore(ad: ad);

    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: ExpansionTile(
        title: Text(
          adStore.fullName,
          style: const TextStyle(
              fontSize: 15, fontWeight: FontWeight.bold, color: Colors.black),
        ),
        subtitle: Text(
          ad.title,
          style: const TextStyle(fontSize: 15, color: Colors.black45),
        ),
        onExpansionChanged: (isExpanded) {},
        initiallyExpanded: true,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              ad.text.toString(),
              style: const TextStyle(fontSize: 15, color: Colors.black),
            ),
          ),
        ],
      ),
    );
  }
}
