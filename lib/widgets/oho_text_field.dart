import 'package:ohowallet/core/exports.dart';

abstract class OHOTextFieldValidator {
  String errorMessage;

  OHOTextFieldValidator({required this.errorMessage});

  bool isValid(String data);
}

class OHOTextFieldValidatorRequired extends OHOTextFieldValidator {
  OHOTextFieldValidatorRequired({required String errorMessage})
      : super(errorMessage: errorMessage);

  @override
  bool isValid(String data) {
    if (data.isEmpty) return false;
    return true;
  }
}

class OHOTextFieldValidatorMinLength extends OHOTextFieldValidator {
  final int minLength;

  OHOTextFieldValidatorMinLength({
    required this.minLength,
    required String errorMessage,
  }) : super(errorMessage: errorMessage);

  @override
  bool isValid(String data) {
    if (data.length < minLength) return false;
    return true;
  }
}

class OHOTextFieldValidatorMaxLength extends OHOTextFieldValidator {
  final int maxLength;

  OHOTextFieldValidatorMaxLength({
    required this.maxLength,
    required String errorMessage,
  }) : super(errorMessage: errorMessage);

  @override
  bool isValid(String data) {
    if (data.length > maxLength) return false;
    return true;
  }
}

class OHOTextFieldValidatorEqual extends OHOTextFieldValidator {
  final String tag;

  OHOTextFieldValidatorEqual({
    required this.tag,
    required String errorMessage,
  }) : super(errorMessage: errorMessage);

  @override
  bool isValid(String data) {
    try {
      OHOTextFieldController controller = Get.find(tag: tag);
      if (data != controller.data.value) return false;
    } catch (error) {
      errorMessage = 'Validation error';
      return false;
    }
    return true;
  }
}

class OHOTextFieldController extends BaseController {
  var data = ''.obs;
  final bool required;
  var isObscured = false.obs;
  final String messageTag;
  final List<OHOTextFieldValidator>? validators;
  final TextEditingController textEditingController;
  var valid = false;

  OHOTextFieldController({
    String? data,
    required this.required,
    required bool? obscureText,
    required this.messageTag,
    this.validators,
  }) : textEditingController = TextEditingController() {
    this.data.value = data ?? '';
    isObscured.value = obscureText ?? false;
  }

  @override
  void onInit() {
    super.onInit();
    textEditingController.text = data.value;
    ever(data, (String value) => validate(value));
  }

  bool isValid() {
    validate(data.value);
    return valid;
  }

  void validate(String data) {
    if (validators == null) {
      valid = true;
      return;
    }

    OHOMessageController messageController = Get.find(tag: messageTag);
    for (var validator in validators!) {
      if (!validator.isValid(data)) {
        valid = false;
        messageController.type.value = OHOMessageType.error;
        messageController.message.value = validator.errorMessage;
        return;
      }
    }

    valid = true;
    messageController.type.value = OHOMessageType.none;
    messageController.message.value = '';
  }

  void clear() {
    data.value = '';
    textEditingController.clear();
  }
}

class OHOTextField extends BaseWidget<OHOTextFieldController> {
  final double? width;
  final String? label;
  final String? hint;
  final String? description;
  final bool? required;
  final bool? obscureText;
  final int? maxLines;
  final bool? readOnly;
  final TextInputType? keyboardType;
  final List<TextInputFormatter>? inputFormatters;
  final List<OHOTextFieldValidator>? validators;

  OHOTextField({
    super.key,
    required super.tag,
    String? data,
    this.width,
    this.label,
    this.hint,
    this.description,
    this.required,
    this.obscureText,
    this.maxLines,
    this.readOnly,
    this.keyboardType,
    this.inputFormatters,
    this.validators,
  }) : super(
          controller: OHOTextFieldController(
            data: data,
            required: required ?? false,
            obscureText: obscureText,
            messageTag: const Uuid().v4(),
            validators: validators,
          ),
        );

  @override
  Widget build(BuildContext context) {
    final bool obscureText_ = obscureText ?? false;
    final int maxLines_ = maxLines ?? 1;
    final double paddingRight_ = obscureText_ ? 150.r : 50.r;
    final double borderRadius_ = maxLines_ == 1 ? 9999 : 50.r;

    return SizedBox(
      width: width ?? double.infinity,
      child: Column(
        children: [
          Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(horizontal: 50.r),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                label == null
                    ? Container()
                    : Text(
                        label!,
                        style: TextStyle(
                          fontFamily: 'Outfit',
                          fontSize: 60.sp,
                          fontWeight: FontWeight.normal,
                          color: themeService.textColor,
                        ),
                      ),
                required == null
                    ? Container()
                    : Text(
                        ' *',
                        style: TextStyle(
                          fontFamily: 'Outfit',
                          fontSize: 60.sp,
                          fontWeight: FontWeight.normal,
                          color: OHOColors.statusError,
                        ),
                      )
              ],
            ),
          ),
          label == null ? Container() : SizedBox(height: 20.r),
          Obx(
            () => Stack(
              alignment: controller.isObscured.value || maxLines_ == 1
                  ? Alignment.centerRight
                  : Alignment.topRight,
              children: [
                TextField(
                  controller: controller.textEditingController,
                  keyboardType: keyboardType,
                  inputFormatters: inputFormatters,
                  maxLines: maxLines_ != 1 &&
                          obscureText_ &&
                          controller.isObscured.value
                      ? 1
                      : maxLines_,
                  readOnly: readOnly ?? false,
                  obscureText: controller.isObscured.value,
                  autocorrect: false,
                  enableSuggestions: false,
                  cursorColor: themeService.textColor,
                  textAlignVertical: TextAlignVertical.center,
                  style: TextStyle(
                    fontFamily: 'Outfit',
                    fontSize: 50.sp,
                    fontWeight: FontWeight.normal,
                    color: readOnly != null && readOnly!
                        ? themeService.textFieldHintColor
                        : themeService.textColor,
                  ),
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: themeService.textFieldBackgroundColor,
                    hintText: hint ?? label,
                    hintStyle: TextStyle(
                      fontFamily: 'Outfit',
                      fontSize: 50.sp,
                      fontWeight: FontWeight.normal,
                      color: themeService.textFieldHintColor,
                    ),
                    contentPadding:
                        EdgeInsets.fromLTRB(50.r, 30.r, paddingRight_, 30.r),
                    enabledBorder: controller.data.value.isEmpty
                        ? OutlineInputBorder(
                            borderSide: BorderSide(
                              color: themeService.textFieldBorderColor,
                              width: 2.sp,
                            ),
                            borderRadius: BorderRadius.circular(borderRadius_),
                          )
                        : OutlineInputBorder(
                            borderSide: BorderSide(
                              color: themeService.textFieldBorderColor,
                              width: 3.sp,
                            ),
                            borderRadius: BorderRadius.circular(borderRadius_),
                          ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: themeService.textFieldBorderColor,
                        width: 5.sp,
                      ),
                      borderRadius: BorderRadius.circular(borderRadius_),
                    ),
                  ),
                  onChanged: (data) => controller.data.value = data,
                ),
                !obscureText_
                    ? Container()
                    : Container(
                        alignment: Alignment.centerRight,
                        padding: EdgeInsets.symmetric(
                          vertical: maxLines_ == 1 ? 0.r : 30.r,
                          horizontal: 50.r,
                        ),
                        child: controller.isObscured.value
                            ? GestureDetector(
                                onTap: () {
                                  controller.isObscured.value =
                                      !controller.isObscured.value;
                                },
                                child: SvgPicture.asset(
                                  'assets/icons/eye-1-slash.svg',
                                  width: 60.r,
                                  height: 60.r,
                                  color: themeService.textFieldHintColor,
                                ),
                              )
                            : GestureDetector(
                                onTap: () {
                                  controller.isObscured.value =
                                      !controller.isObscured.value;
                                },
                                child: SvgPicture.asset(
                                  'assets/icons/eye-1.svg',
                                  width: 60.r,
                                  height: 60.r,
                                  color: themeService.textFieldHintColor,
                                ),
                              ),
                      ),
              ],
            ),
          ),
          validators == null
              ? Container()
              : OHOMessage(
                  tag: controller.messageTag,
                  margin: EdgeInsets.fromLTRB(0, 20.r, 0, 0),
                  type: OHOMessageType.none,
                  message: '',
                ),
          description == null ? Container() : SizedBox(height: 20.r),
          description == null
              ? Container()
              : Container(
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(horizontal: 50.r),
                  child: Text(
                    description!,
                    style: TextStyle(
                      fontFamily: 'Outfit',
                      fontSize: 40.sp,
                      fontWeight: FontWeight.w300,
                      color: themeService.textColor,
                    ),
                  ),
                ),
        ],
      ),
    );
  }
}
