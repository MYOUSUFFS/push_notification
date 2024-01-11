import 'package:flutter/material.dart';

ScaffoldFeatureController<MaterialBanner, MaterialBannerClosedReason>
    materialBanner(
  BuildContext context,
  String title,
  String subtitle,
) {
  return ScaffoldMessenger.of(context).showMaterialBanner(MaterialBanner(
    padding: EdgeInsets.all(8),
    content: Card(
      color: Colors.green.shade300,
      child: ListTile(
        title: Text(title),
        subtitle: Text(subtitle),
      ),
    ),
    actions: [
      IconButton(
        onPressed: () =>
            ScaffoldMessenger.of(context).hideCurrentMaterialBanner(),
        icon: Icon(
          Icons.close,
          color: Colors.red,
        ),
      ),
    ],
    onVisible: () => Future.delayed(Duration(seconds: 3)).then(
      (value) => ScaffoldMessenger.of(context).hideCurrentMaterialBanner(),
    ),
  ));
}
