// Copyright 2015 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:flutter_study/model/banner_model.dart';
import 'package:url_launcher/url_launcher.dart';

import 'my_home_banner.dart';

class MyPagination extends StatelessWidget {
  final List<Data> data;

  MyPagination(this.data);

  void _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  List<Widget> _pageSelector(BuildContext context) {
    List<Widget> list = [];


    /*if (arr.length > 0) {
      list.add(HomeBanner(bannerStories, (story) {
        _launchURL('${story.url}');
      }));
    }*/
    if(data.length >0){
      list.add(MyHomeBanner(data, (story){
        _launchURL('${story.targetUrl}');
      }));
    }
    print(list);
    return list;
  }

  @override
  Widget build(BuildContext context) {
    return
      Column(
        key:Key('__header__'),
        //physics: AlwaysScrollableScrollPhysics(),
        //padding: EdgeInsets.only(),
        children: _pageSelector(context)
      );
  }
}
