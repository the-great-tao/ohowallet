import 'package:ohowallet/core/exports.dart';

enum OHOMessageType {
  none,
  success,
  warning,
  error,
  info,
}

class OHOMessageController extends BaseController {
  Rx<OHOMessageType> type;
  RxString message;
  var color = Colors.transparent.obs;
  var backgroundColor = Colors.transparent.obs;

  OHOMessageController({
    required this.type,
    required this.message,
  }) : super() {
    updateColors();
  }

  @override
  void onInit() {
    super.onInit();
    ever(type, (value) => updateColors());
  }

  updateColors() {
    switch (type.value) {
      case OHOMessageType.none:
        break;
      case OHOMessageType.success:
        color.value = OHOColors.statusSuccess;
        backgroundColor.value = OHOColors.statusSuccessBackground;
        break;
      case OHOMessageType.warning:
        color.value = OHOColors.statusWarning;
        backgroundColor.value = OHOColors.statusWarningBackground;
        break;
      case OHOMessageType.error:
        color.value = OHOColors.statusError;
        backgroundColor.value = OHOColors.statusErrorBackground;
        break;
      case OHOMessageType.info:
        color.value = OHOColors.statusInfo;
        backgroundColor.value = OHOColors.statusInfoBackground;
        break;
    }
  }
}

class OHOMessage extends BaseWidget<OHOMessageController> {
  final EdgeInsetsGeometry? margin;

  OHOMessage({
    super.key,
    super.tag,
    this.margin,
    required OHOMessageType type,
    required String message,
  }) : super(
          controller: OHOMessageController(
            type: Rx<OHOMessageType>(type),
            message: RxString(message),
          ),
        );

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => controller.type.value == OHOMessageType.none
          ? Container()
          : Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(
                vertical: 20.r,
                horizontal: 50.r,
              ),
              margin: margin,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(9999),
                color: controller.backgroundColor.value,
              ),
              child: Row(
                children: [
                  Icon(
                    Icons.error,
                    color: controller.color.value,
                    size: 40.sp,
                  ),
                  SizedBox(width: 10.r),
                  Text(
                    controller.message.value,
                    style: TextStyle(
                      fontFamily: 'Outfit',
                      fontSize: 40.sp,
                      fontWeight: FontWeight.w300,
                      color: controller.color.value,
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}
