import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobile_app/shared/colors.dart';
import 'package:mobile_app/utils/routes.dart';
import 'package:provider/provider.dart';
import 'package:dropdown_textfield/dropdown_textfield.dart';
import 'package:searchfield/searchfield.dart';

import '../../stores/timetable/timetable_store.dart';
import '../../widgets/progress_indicator_widget.dart';

class GroupChoiceDialog extends StatefulWidget {
  const GroupChoiceDialog({super.key});

  @override
  State<GroupChoiceDialog> createState() => _GroupChoiceDialogState();
}

class _GroupChoiceDialogState extends State<GroupChoiceDialog> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  FocusNode searchFocusNode = FocusNode();
  FocusNode textFieldFocusNode = FocusNode();
  late SingleValueDropDownController _cnt;
  late MultiValueDropDownController _cntMulti;
  late TimetableStore _store;

  @override
  void initState() {
    _cnt = SingleValueDropDownController();
    _cntMulti = MultiValueDropDownController();
    super.initState();
  }

  @override
  void dispose() {
    _cnt.dispose();
    _cntMulti.dispose();
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    // initializing stores
    _store = Provider.of<TimetableStore>(context);

    // check to see if already called api
    if (!_store.loading) {
      _store.getGroups();
    }
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      backgroundColor: AppColors.primary,
      elevation: 5,
      content: SingleChildScrollView(
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.only(top: 16, bottom: 16),
              child: Text(
                "Выберите группу",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            Observer(
              builder: (context) {
                return SearchField(
                  suggestions: _store.groupCodes,
                  suggestionState: Suggestion.expand,
                  suggestionsDecoration:
                      SuggestionDecoration(color: Colors.white),
                  hint: "Группа...",
                  searchStyle: TextStyle(
                    fontSize: 16,
                  ),
                  itemHeight: 40,
                  onSuggestionTap: (p0) {
                    _store.groupCode = p0.searchKey;
                    _store.updateGroupCode(p0.searchKey);
                  },
                );
              },
            ),
          ],
        ),
      ),
      actions: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(AppColors.secondary),
                overlayColor:
                    MaterialStatePropertyAll(Theme.of(context).primaryColor),
                shape: MaterialStateProperty.all(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
              ),
              child: const Text(
                "Сохранить",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
              ),
              onPressed: () async {
                Navigator.popAndPushNamed(context, Routes.timetable);
              },
            ),
          ],
        ),
      ],
    );
  }
}
