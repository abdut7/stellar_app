import '/utils/colors.dart';
import '/utils/extensions.dart';
import '/utils/styles.dart';
import 'package:flutter/material.dart';

/// Build the image widget from [imgUrl]
///

bool isErrorShowing = false;

// Future<T?> showAppErrorDialog<T>({
//   required String? msg,
//   required BuildContext context,
// }) async {
//   if (isErrorShowing) return null;
//   isErrorShowing = true;

//   final res = await showDialog<T>(
//     context: context,
//     builder: (context) => Dialog(
//       insetPadding: const EdgeInsets.all(12),
//       child: Container(
//         padding: const EdgeInsets.fromLTRB(24, 36, 24, 36),
//         decoration: _Decoration(
//           colorBg: Theme.of(context).canvasColor,
//           colorGrey: Colors.white,
//         ),
//         child: Column(
//           mainAxisSize: MainAxisSize.min,
//           children: [
//             //SvgPicture.asset('error_bubbles'.asAssetSvg()),
//             const Padding(
//               padding: EdgeInsets.only(top: 24, bottom: 8),
//               child: Text(
//                 "Error",
//               ),
//             ),
//             Text(
//               msg ?? "",
//               textAlign: TextAlign.center,
//               maxLines: 3,
//             ),
//           ],
//         ),
//       ),
//       shape: RoundedRectangleBorder(
//         borderRadius: BorderRadius.circular(8),
//       ),
//     ),
//   );
//   isErrorShowing = false;
//   return res;
// }

// class _Decoration extends Decoration {
//   final Color colorBg, colorGrey;

//   const _Decoration({
//     required this.colorBg,
//     required this.colorGrey,
//   }) : super();

//   @override
//   BoxPainter createBoxPainter([void Function()? onChanged]) {
//     return _BoxPainter(colorBg, colorGrey);
//   }
// }

// ignore: unused_element
class _BoxPainter extends BoxPainter {
  final Color colorBg, colorGrey;

  _BoxPainter(this.colorBg, this.colorGrey) : super();

  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration configuration) {
    canvas.clipRRect(
      RRect.fromRectAndRadius(
        offset & configuration.size!,
        const Radius.circular(8.0),
      ),
    );
    canvas.drawPaint(Paint()..color = colorBg);
    final path = Path();
    path.moveTo(offset.dx, offset.dy + configuration.size!.height * 0.70);
    path.lineTo(offset.dx + configuration.size!.width,
        offset.dy + configuration.size!.height * 0.20);
    path.lineTo(offset.dx + configuration.size!.width,
        offset.dy + configuration.size!.height);
    path.lineTo(offset.dx, offset.dy + configuration.size!.height);
    path.lineTo(offset.dx, offset.dy + configuration.size!.height * 0.70);

    canvas.drawPath(path, Paint()..color = colorGrey);
  }
}

Future<T?> showAppErrorDialog<T>({
  required String? msg,
  required BuildContext context,
}) async {
  if (isErrorShowing) return null;
  isErrorShowing = true;

  final res = await showGeneralDialog<T>(
    barrierLabel: "Label",
    barrierDismissible: true,
    barrierColor: Colors.black.withOpacity(0.5),
    transitionDuration: const Duration(milliseconds: 700),
    context: context,
    pageBuilder: (context, anim1, anim2) {
      return Dialog(
        insetPadding: const EdgeInsets.symmetric(horizontal: 25),
        backgroundColor: Colors.transparent,
        child: Column(
          //mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                padding: const EdgeInsets.only(
                    left: 20, top: 20, right: 10, bottom: 20),
                margin: const EdgeInsets.symmetric(vertical: 20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: color3C3F4E,
                ),
                child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset(
                        'error.png'.asAssetImg(),
                        height: 31,
                        width: 31,
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Warning!',
                              style: tsS18W600.copyWith(
                                  decoration: TextDecoration.none),
                            ),
                            const SizedBox(height: 10),
                            Text(msg.toString(),
                                style: tsS14W600.copyWith(
                                    decoration: TextDecoration.none)),
                          ],
                        ),
                      ),
                      InkWell(
                        child: Container(
                          alignment: Alignment.topCenter,
                          width: 25,
                          height: 25,
                          child: Image.asset(
                            'close.png'.asAssetImg(),
                            width: 12,
                            height: 12,
                          ),
                        ),
                        onTap: () {
                          Navigator.pop(context);
                        },
                      )
                    ]),
              ),
              // child: Container(
              //   height: 300,
              //   child: const SizedBox.expand(child: FlutterLogo()),
              //   margin: const EdgeInsets.only(bottom: 50, left: 12, right: 12),
              //   decoration: BoxDecoration(
              //     color: Colors.white,
              //     borderRadius: BorderRadius.circular(40),
              //   ),
              // ),
            ),
          ],
        ),
      );
    },
    transitionBuilder: (context, anim1, anim2, child) {
      return SlideTransition(
        position: Tween(begin: const Offset(0, 1), end: const Offset(0, 0))
            .animate(anim1),
        child: child,
      );
    },
  );
  isErrorShowing = false;
  return res;
}

void showAppDialog({
  String title = "Error",
  required String msg,
  String buttonText = "OK",
  BuildContext? context,
}) {
  showDialog(
    context: context!,
    barrierDismissible: false,
    builder: (_) {
      return AlertDialog(
        title: Visibility(
            visible: false,
            child: Text(
              title,
              style: tsS18W600,
            )),
        content: Text(msg),
        actions: <Widget>[
          TextButton(
              child: const Text('Ok'),
              onPressed: () {
                Navigator.pop(context);
              })
        ],
      );
    },
  );
}
