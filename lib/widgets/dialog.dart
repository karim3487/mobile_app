import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomDialog extends StatefulWidget {
  const CustomDialog({
    Key? key,
    @required this.title,
    @required this.description,
    this.okFun,
    this.titleTextStyle = const TextStyle(
        color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
    this.descriptionTextStyle =
        const TextStyle(color: Colors.grey, fontSize: 15),
    this.cancelFun,
    this.cancelColor = Colors.grey,
    this.okColor = Colors.pink,
    this.ok = " OK !",
    this.cancel = "Cancel",
    this.defaultButtons = true,
    this.actionButtons,
  }) : super(key: key);

  final String? title;
  final String? description;
  final Function? okFun;
  final Function? cancelFun;
  final Color? okColor;
  final Color? cancelColor;
  final String? ok;
  final String? cancel;
  final TextStyle titleTextStyle;
  final TextStyle descriptionTextStyle;
  final bool defaultButtons;
  final Widget? actionButtons;

  @override
  State<CustomDialog> createState() => _CustomDialogState();
}

class _CustomDialogState extends State<CustomDialog> {
  double? width;
  double? height;
  String? title;
  String? description;
  Function? okFun;
  Function? cancelFun;
  Color? okColor;
  Color? cancelColor;
  TextStyle? titleTextStyle;
  TextStyle? descriptionTextStyle;
  String? ok;
  String? cancel;
  bool? defaultButtons;
  Widget? actionButtons;
  int package = 0; //0 user assets ,1 package assets

  @override
  void initState() {
    title = widget.title;
    description = widget.description;
    okFun = widget.okFun ?? () {};
    cancelFun = widget.cancelFun ?? () {};
    okColor = widget.okColor;
    cancelColor = widget.cancelColor;
    ok = widget.ok;
    cancel = widget.cancel;
    titleTextStyle = widget.titleTextStyle;
    descriptionTextStyle = widget.descriptionTextStyle;
    defaultButtons = widget.defaultButtons;
    actionButtons = widget.actionButtons;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (!defaultButtons!) {
      assert(actionButtons != null,
          '\n***actionButtons cannot be null when defaultButtons is false***\n');
    }
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
    var dialogWidth = 0.36 * height!;

    assert(MediaQuery.of(context) != null,
        '\n****context does not contain media query object***\n');
    assert(title != null, '\n****title is required***\n');
    assert(description != null, '\n****description is required***\n');

    return GestureDetector(
      onTap: () {
        Navigator.of(context).pop();
      },
      child: Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        elevation: 0,
        backgroundColor: Colors.transparent,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: Colors.white,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                decoration: BoxDecoration(
                  color: Colors.red[500],
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(15.0),
                    topRight: Radius.circular(15.0),
                  ),
                ),
                width: MediaQuery.of(context).size.width,
                child: const Padding(
                  padding: EdgeInsets.all(15),
                  child: Icon(
                    Icons.cancel_outlined,
                    size: 54,
                    color: Colors.white,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(10, 15, 10, 15),
                child: Text(
                  title!,
                  style: titleTextStyle,
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(10, 5, 10, 20),
                child: Container(
                  child: Text(
                    description!,
                    style: descriptionTextStyle,
                    textAlign: TextAlign.center,
                    maxLines: 5,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    customButton(cancel!, cancelColor!, cancelFun!),
                    const SizedBox(
                      width: 10,
                    ),
                    customButton(ok!, okColor!, okFun!),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget customButton(String t, Color c, Function f) {
    return Container(
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          backgroundColor: c,
        ),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
          child: Text(
            t,
            style: const TextStyle(color: Colors.white, fontSize: 15),
          ),
        ),
        onPressed: () {
          f();
          Navigator.of(context).pop();
        },
      ),
    );
  }
}
