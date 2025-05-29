import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class MemberListWidget extends StatefulWidget {
  const MemberListWidget({
    super.key,
    required this.memberList,
    required this.deviceSize,
    required this.onPayedClicked,
  });

  final List memberList;
  final Size deviceSize;
  final Function(String, bool?, int) onPayedClicked;

  @override
  State<MemberListWidget> createState() => _MemberListWidgetState();
}

class _MemberListWidgetState extends State<MemberListWidget> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const AlwaysScrollableScrollPhysics(),
      itemCount: widget.memberList.length,
      itemBuilder: (context, index) {
        var firstName = widget.memberList[index].firstname.toString();
        var lastName = widget.memberList[index].lastname.toString();
        var birthDay = DateTime.parse(widget.memberList[index].birthday.toString());
        var memberNo = widget.memberList[index].memberNumber.toString();
        var memberCardDone = widget.memberList[index].memberCheckIn;
        return ListTile(
          trailing: SizedBox(
            width: 125,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ...memberCardDone.asMap().entries.map(
                      (entry) {
                    int entryIndex = entry.key;
                    var element = entry.value;
                    var checkDate =
                    DateFormat("dd.MM.yyyy").format(element.checkInDate);
                    return element.checkIn
                        ? Expanded(
                      child: Row(
                        children: [
                          Expanded(
                            child: Column(
                              children: [
                                Flexible(child: Text(checkDate)),
                                Flexible(
                                  child: Checkbox(
                                    value: element.checkIn,
                                    onChanged: null,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Column(
                              children: [
                                const Flexible(child: Text("Bezahlt")),
                                Flexible(
                                  child: Checkbox(
                                    value: element.payed,
                                    onChanged: element.payed
                                        ? null
                                        : (value) => widget.onPayedClicked(
                                        memberNo, value, entryIndex),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    )
                        : const SizedBox();
                  },
                ),
              ],
            ),
          ),
          title: Text("$firstName $lastName"),
          subtitle: Text(
            DateFormat("dd.MM.yyyy").format(birthDay),
          ),
        );
      },
    );
  }
}