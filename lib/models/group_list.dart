import 'group.dart';

class GroupList {
  final List<Group>? groups;

  GroupList({
    this.groups,
  });

  factory GroupList.fromJson(List<dynamic> json) {
    List<Group> groups = <Group>[];
    groups = json.map((group) => Group.fromJson(group)).toList();

    return GroupList(
      groups: groups,
    );
  }
  List<String> get codeList =>
      groups?.map((group) => group.code ?? '').toList() ?? [];
}
