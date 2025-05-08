import 'package:common_utils/helper/progress_dialog.dart';
import 'package:common_utils/widgets/form_seperator_box.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:toastification/toastification.dart';

Future<dynamic> showBottomSheetCustom(BuildContext context, Widget widget, {String? title, bool? isDismiss, bool? dragEnable}) async {
  return await showModalBottomSheet(
    backgroundColor: Colors.transparent,
    isScrollControlled: true,
    context: context,
    isDismissible: isDismiss ?? true,
    enableDrag: dragEnable ?? true,
    builder: (context) => Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16.0),
          topRight: Radius.circular(16.0),
        ),
      ),
      padding: MediaQuery.viewInsetsOf(context).add(AppDefaults.kPageSidePadding).add(const EdgeInsets.symmetric(vertical: 12)),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, mainAxisSize: MainAxisSize.min, children: [
        Row(
          children: [
            Expanded(
              child: (title != null)
                  ? Text(
                      title,
                      style: Theme.of(context).textTheme.displaySmall?.copyWith(fontWeight: FontWeight.w600, fontSize: 20.sp),
                    )
                  : const SizedBox.shrink(),
            ),
            CloseButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
            )
          ],
        ),
        SizedBox(
          height: 5.h,
        ),
        widget,
        SizedBox(
          height: 8.h,
        ),
      ]),
    ),
  );
}

_overlaySupprt(String message, ToastificationType type) {
  toastification.show(
      title: Text(
        message,
        maxLines: 3,
      ),
      style: ToastificationStyle.fillColored,
      showIcon: false,
      type: type,
      autoCloseDuration: const Duration(seconds: 3),
      closeOnClick: true,
      alignment: Alignment.bottomCenter);
}

displayToastFailure(String message) {
  _overlaySupprt(message, ToastificationType.error);
}

displayToastSuccess(String message) {
  _overlaySupprt(message, ToastificationType.success);
}

void asyncCallHelperWithLoadingBar(BuildContext context, {required Future<dynamic> Function() processCall, required Function onSuccess, Function(Object)? onError}) async {
  ProgressDialog pr = ProgressDialog(context);
  await pr.show();
  try {
    var response = await processCall();
    await pr.hide();
    if (response == null) {
      onSuccess();
    } else {
      onSuccess(response);
    }
  } catch (ex) {
    try {
      await pr.hide();
    } catch (ex) {
      debugPrint(ex.toString());
      //
    }
    if (onError == null) {
      displayToastFailure(ex.toString());
    } else {
      onError(ex);
    }
  }
}

hideKeyboard(BuildContext context) {
  FocusScope.of(context).requestFocus(FocusNode());
}
