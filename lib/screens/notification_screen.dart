import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  _NotificationScreenState createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  @override
  Widget build(BuildContext context) {
      return DraggableScrollableSheet(
        //maxChildSize: 0.6,
        initialChildSize: 0.93,
        expand: false,
        builder: (context, ScrollController) => Container(
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topLeft: const Radius.circular(10.0),
                  topRight: const Radius.circular(10.0))),
          child: ListView(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(25, 25, 10, 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Notifications',
                      style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.w600,
                          color: Colors.grey,
                          fontFamily: 'Poppins'),
                    ),
                    IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: Icon(
                          CupertinoIcons.clear,
                          size: 20,
                          color: Colors.black,
                        ))
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 25, right: 25),
                child: Divider(
                  color: Colors.grey,
                  height: 1,
                ),
              ),
              buildListTile(iconBtn: Icons.person_pin_sharp, title: 'FRIEND REQUEST', subTitle: '3 people want to be your friend',),
              setDivider(),
              buildListTile(iconBtn: Icons.chat, title: 'COMMENTS', subTitle: 'Someone has replied to your board',),
              setDivider(),
              buildListTile(iconBtn: Icons.business, title: 'PURCHASE SUCCESS', subTitle: 'You got top listed your business',),
              setDivider(),
              buildListTile(iconBtn: Icons.insert_chart, title: 'POLL', subTitle: 'You get 3 more votes',),
              setDivider(),
            ],
          ),
        ),
      );
    }
  }

setDivider() {
  return Padding(
    padding: const EdgeInsets.only(left: 25, right: 25, top: 5, bottom: 5),
    child: Divider(
      color: Colors.grey,
      height: 1,
    ),
  );
}

  class buildListTile extends StatelessWidget {
    var iconBtn;
    String title;
    String subTitle;
    buildListTile({this.iconBtn, required this.title, required this.subTitle});

    @override
    Widget build(BuildContext context) {
      return Padding(
        padding: const EdgeInsets.only(left: 8, right: 25, top: 10),
        child: ListTile(
          leading: Icon(
            iconBtn,
            color: Color(0xFF130CB7),
            size: 35,
          ),
          title: Text(
            title,
            style: TextStyle(
                color: Colors.grey.shade800,
                fontFamily: 'Poppins',
                fontSize: 17,
                fontWeight: FontWeight.w600),
          ),
          subtitle: Text(subTitle, style: TextStyle(fontFamily: 'Poppins', fontSize: 13),),
        ),
      );
    }
  }

