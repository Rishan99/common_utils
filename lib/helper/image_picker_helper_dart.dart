import 'dart:io';
import 'package:common_utils/enums/enum.dart';
import 'package:flutter/material.dart';

void onImagePickerPick(BuildContext context, Function(ImagePickerSource) onSourceSelected) {
  showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      enableDrag: true,
      builder: (context) => Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                contentPadding: const EdgeInsets.symmetric(horizontal: 12),
                onTap: () async {
                  Navigator.of(context, rootNavigator: false).pop();
                  onSourceSelected(ImagePickerSource.camera);
                },
                leading: const Icon(Icons.camera_alt_outlined),
                title: const Text(
                  "From Camera",
                ),
              ),
              ListTile(
                contentPadding: const EdgeInsets.symmetric(horizontal: 12),
                onTap: () async {
                  Navigator.of(context, rootNavigator: false).pop();
                  onSourceSelected(ImagePickerSource.gallery);
                },
                leading: const Icon(Icons.image),
                title: const Text(
                  "From Gallery",
                ),
              )
            ],
          ));
}
