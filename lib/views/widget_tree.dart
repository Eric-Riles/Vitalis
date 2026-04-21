import 'package:flutter/material.dart';
import 'package:flutter_application_1/data/notifiers.dart';
import 'package:flutter_application_1/views/pages/settings_page.dart';
import 'package:flutter_application_1/widgets/options_widget.dart';
import 'package:flutter_application_1/views/pages/community_page.dart';
import 'package:flutter_application_1/views/pages/home_page.dart';
import 'package:flutter_application_1/views/pages/info_page.dart';
import 'package:flutter_application_1/views/pages/messaging_page.dart';
import 'package:flutter_application_1/widgets/navbar_widget.dart';

List<Widget> pages = [
  HomePage(),
  CommunityPage(),
  InfoPage(),
  MessagingPage(),
];

class WidgetTree extends StatelessWidget {
  const WidgetTree({super.key});

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