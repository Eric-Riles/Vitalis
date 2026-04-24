import 'package:flutter/material.dart';
import 'package:flutter_application_1/data/globalConst.dart';
import 'package:flutter_application_1/data/notifiers.dart';
import 'package:flutter_application_1/views/pages/settings_page.dart';
import 'package:flutter_application_1/widgets/options_widget.dart';
import 'package:flutter_application_1/views/pages/community_page.dart';
import 'package:flutter_application_1/views/pages/home_page.dart';
import 'package:flutter_application_1/views/pages/info_page.dart';
import 'package:flutter_application_1/views/pages/messaging_page.dart';
import 'package:flutter_application_1/widgets/navbar_widget.dart';
import 'package:shared_preferences/shared_preferences.dart';

List<Widget> pages = [
  HomePage(),
  CommunityPage(),
  InfoPage(),
  MessagingPage(),
];

class WidgetTree extends StatefulWidget {
  const WidgetTree({super.key});

  @override
  State<WidgetTree> createState() => _WidgetTreeState();
}

class _WidgetTreeState extends State<WidgetTree> {

  @override
  void initState() {
    initAllVariables();
    super.initState();
  }

  void initAllVariables() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final bool? init1 = prefs.getBool(darkKey);
    final int? init2 = prefs.getInt(xpKey);
    darkModeNotifier.value = init1 ?? true;
    totalXpNotifier.value = init2 ?? 0;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Vitalis v0.1'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context){
                    return SettingsPage();
                  },
                ),
              );
            }, 
            icon: Icon(Icons.settings)
          ),
        ],
      ),
      drawer: OptionsWidget(),
      body: ValueListenableBuilder(
        valueListenable: selectedPageNotifier,
        builder: (context, selectedPage, child){
          return pages.elementAt(selectedPage);
        }
      ),
      bottomNavigationBar: NavbarWidget(),
    );
  }
}