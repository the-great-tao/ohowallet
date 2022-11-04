import 'package:ohowallet/core/exports.dart';

class ContactListItemController extends BaseController {}

class ContactListItem extends BaseWidget<ContactListItemController> {
  final String contactKey;
  final Contact contact;
  final bool editable;
  final Function getBackOnSelected;

  ContactListItem({
    super.key,
    super.tag,
    required this.contactKey,
    required this.contact,
    this.editable = true,
    required this.getBackOnSelected,
  }) : super(controller: ContactListItemController());

  Widget get randomIcon => ClipRRect(
        borderRadius: BorderRadius.circular(9999),
        child: SizedBox(
          width: 150.r,
          height: 150.r,
          child: AvatarGenerator(
            seed: contactKey,
            colors: themeService.randomIconColors,
            verticalTileCount: 3,
            horizontalTileCount: 3,
          ),
        ),
      );

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        highlightColor: themeService.listItemInkwellHighlightColor,
        splashColor: themeService.listItemInkwellSplashColor,
        onTap: () async {
          getBackOnSelected(contactKey, contact);
          Get.back();
        },
        child: Padding(
          padding: EdgeInsets.symmetric(
            vertical: 25.h,
            horizontal: 50.w,
          ),
          child: Row(
            children: [
              randomIcon,
              SizedBox(width: 50.w),
              SizedBox(
                height: 150.r,
                width: 550.w,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    OHOHeaderText(
                      contact.name,
                      softWrap: false,
                      fontSize: 50.sp,
                      overflow: TextOverflow.fade,
                    ),
                    OHOText(
                      WalletService.getShortHex(
                        contact.address.hexEip55,
                        partLength: 8,
                      ),
                      softWrap: false,
                      fontSize: 40.sp,
                      overflow: TextOverflow.fade,
                    ),
                  ],
                ),
              ),
              Expanded(child: Container()),
              !editable ? Container() : SizedBox(width: 10.w),
              !editable
                  ? Container()
                  : GestureDetector(
                      onTap: () => Get.to(
                        () => AddContactScreen(
                          isEditing: true,
                          contactKey: contactKey,
                          contact: contact,
                        ),
                      ),
                      child: Icon(
                        Icons.edit,
                        size: 60.sp,
                        color: themeService.textColor,
                      ),
                    ),
            ],
          ),
        ),
      ),
    );
  }
}

class ContactListScreenController extends BaseController {
  var editable = true.obs;
}

class ContactListScreen extends BaseWidget<ContactListScreenController> {
  final Function getBackOnSelected;

  ContactListScreen({
    super.key,
    super.tag,
    required this.getBackOnSelected,
  }) : super(controller: ContactListScreenController());

  Widget get contacts => Column(
        children: [
          for (var contactKey in walletService.contacts.value.contacts.keys)
            ContactListItem(
              contactKey: contactKey,
              contact: walletService.contacts.value.contacts[contactKey]!,
              editable: controller.editable.value,
              getBackOnSelected: getBackOnSelected,
            ),
        ],
      );

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          elevation: 0.0,
          toolbarHeight: 300.h,
          backgroundColor: Colors.transparent,
          automaticallyImplyLeading: false,
          flexibleSpace: SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(
                vertical: 50.h,
                horizontal: 50.w,
              ),
              child: OHOAppBar01(step: 0),
            ),
          ),
        ),
        body: Container(
          width: double.infinity,
          height: double.infinity,
          padding: EdgeInsets.symmetric(horizontal: 50.w),
          decoration: BoxDecoration(
            gradient: themeService.screenBackgroundGradient,
          ),
          child: SafeArea(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      SizedBox(
                        width: double.infinity,
                        child: OHOHeaderText('Contacts'),
                      ),
                      // Positioned(
                      //   right: 50.w,
                      //   child: GestureDetector(
                      //     onTap: () => controller.editable.value =
                      //         !controller.editable.value,
                      //     child: Icon(
                      //       Icons.edit,
                      //       size: 60.sp,
                      //       color: themeService.textColor,
                      //     ),
                      //   ),
                      // )
                    ],
                  ),
                  contacts,
                  SizedBox(height: 50.h),
                  OHOSolidButton(
                    title: 'Add Contact',
                    onTap: () => Get.to(() => AddContactScreen()),
                  ),
                  SizedBox(height: 1000.h),
                ],
              ),
            ),
          ),
        ),
      );
    });
  }
}
