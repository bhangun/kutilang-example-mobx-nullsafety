import 'package:flutter/material.dart';
import 'package:kutilang_example/widgets/appbar_widget.dart';
import 'package:package_info_plus/package_info_plus.dart';

class AboutScreen extends StatefulWidget {
  AboutScreen({Key? key}) : super(key: key);

  @override
  _AboutScreenState createState() => _AboutScreenState();
}

class _AboutScreenState extends State<AboutScreen> {
  String appName = "";
  String packageName = "";
  String version = "";
  String buildNumber = "";

  @override
  void initState() {
    PackageInfo.fromPlatform().then((PackageInfo packageInfo) {
      appName = packageInfo.appName;
      packageName = packageInfo.packageName;
      version = packageInfo.version;
      buildNumber = packageInfo.buildNumber;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: KutAppBar(
        title: 'About Page',
      ),
      body: Center(
          child: Column(children: [
        Text("Apps Name: "+appName),
        Text("Package Name: "+packageName),
        Text("Version: "+version),
        Text("Build Number: "+buildNumber),
      ])),
    );
  }
}
