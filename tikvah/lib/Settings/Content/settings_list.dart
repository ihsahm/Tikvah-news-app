import 'package:dynamic_theme/dynamic_theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:dynamic_theme/theme_switcher_widgets.dart';
import 'package:url_launcher/url_launcher.dart';

class SettingsList extends StatefulWidget {
  @override
  _SettingsListState createState() => _SettingsListState();
}

class _SettingsListState extends State<SettingsList> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        ListTile(
          title: Text('Choose a language'),
          onTap: () {},
        ),
        ListTile(
          title: Text('Visit our telegram'),
          onTap: () {
            launch("https://t.me/tikvahethiopia");
          },
        ),
        ListTile(
          onTap: () {
            showDialog<void>(
                context: context,
                builder: (context) {
                  return BrightnessSwitcherDialog(
                    onSelectedTheme: (brightness) {
                      DynamicTheme.of(context).setBrightness(brightness);
                      Navigator.pop(context);
                    },
                  );
                });
          },
          title: Text('Theme mode'),
        ),
        ListTile(
          title: Text('Give us a comment'),
          onTap: () {
            showDialog<String>(
                context: context,
                builder: (BuildContext context) => AlertDialog(
                      title: Text('Send us your comments'),
                      content: Container(
                          width: double.infinity,
                          child: TextFormField(
                            decoration: InputDecoration(
                                hintText: 'Write your comment...'),
                            maxLines: 4,
                          )),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: Text('Cancel'),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: Text('Send'),
                        ),
                      ],
                    ));
            //launch("https://t.me/TikvahEthiopiaBot");
          },
        ),
      ],
    );
  }
}
