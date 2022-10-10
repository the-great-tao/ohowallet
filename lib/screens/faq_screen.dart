import 'dart:math';

import 'package:ohowallet/core/exports.dart';
import 'package:ohowallet/models/Topic.dart';
import 'package:ohowallet/screens/about_oho_screen.dart';
import 'package:ohowallet/widgets/oho_app_bar_02.dart';

class FAQScreenController extends BaseController {
  var topics = <Topic>[].obs;
  var faqs = <AskAnswer>[].obs;
  var current = Topic().obs;
  var currentExpandedTag = "".obs;

  @override
  void onReady() async {
    super.onReady();
    await getTopicList();
    await getFAQList(topics.value[0]);
  }

  void setSelectedExpansionTile(String tag) {
    currentExpandedTag.value = tag;
  }

  String getSelectedExpansionTile() {
    return currentExpandedTag.value;
  }

  void setCurrentTopic(Topic topic) {
    current.value = topic;
  }

  bool isSelected(String name) {
    return current.value.name == name;
  }

  Future<void> getTopicList() async {
    var dataList = [
      {
        "name": "General",
        "listAskAnswer": [
          {
            "ask": "What is Metacoin?",
            "answer":
                "Metacoin is greatest crypto wallet platform in this century"
          },
          {
            "ask": "How to use Metacoin?",
            "answer":
                "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut a"
          },
          {
            "ask": "Is Metacoin is safe for me?",
            "answer":
                "Metacoin is greatest crypto wallet platform in this century"
          },
          {
            "ask": "How to send a money on Metacoin?",
            "answer":
                "Metacoin is greatest crypto wallet platform in this century"
          },
          {
            "ask": "How to reset account in Metacoin?",
            "answer":
                "Metacoin is greatest crypto wallet platform in this century"
          },
          {
            "ask": "Is there a tips for get a used this app?",
            "answer":
                "Metacoin is greatest crypto wallet platform in this century"
          },
          {
            "ask": "Is Metacoin free to use?",
            "answer":
                "Metacoin is greatest crypto wallet platform in this century"
          },
        ]
      },
      {
        "name": "Account",
        "listAskAnswer": [
          {
            "ask": "2 What is Metacoin?",
            "answer":
                "Metacoin is greatest crypto wallet platform in this century"
          },
          {
            "ask": "2 How to use Metacoin?",
            "answer":
                "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut a"
          },
          {
            "ask": "2 Is Metacoin is safe for me?",
            "answer":
                "Metacoin is greatest crypto wallet platform in this century"
          },
          {
            "ask": "2 How to send a money on Metacoin?",
            "answer":
                "Metacoin is greatest crypto wallet platform in this century"
          },
          {
            "ask": "2 How to reset account in Metacoin?",
            "answer":
                "Metacoin is greatest crypto wallet platform in this century"
          },
          {
            "ask": "2 Is there a tips for get a used this app?",
            "answer":
                "Metacoin is greatest crypto wallet platform in this century"
          },
          {
            "ask": "2 Is Metacoin free to use?",
            "answer":
                "Metacoin is greatest crypto wallet platform in this century"
          },
        ]
      },
      {
        "name": "Login",
        "listAskAnswer": [
          {
            "ask": "3 What is Metacoin?",
            "answer":
                "Metacoin is greatest crypto wallet platform in this century"
          },
          {
            "ask": "3 How to use Metacoin?",
            "answer":
                "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut a"
          },
          {
            "ask": "3 Is Metacoin is safe for me?",
            "answer":
                "Metacoin is greatest crypto wallet platform in this century"
          },
          {
            "ask": "How to send a money on Metacoin?",
            "answer":
                "Metacoin is greatest crypto wallet platform in this century"
          },
          {
            "ask": "How to reset account in Metacoin?",
            "answer":
                "Metacoin is greatest crypto wallet platform in this century"
          },
          {
            "ask": "Is there a tips for get a used this app?",
            "answer":
                "Metacoin is greatest crypto wallet platform in this century"
          },
          {
            "ask": "Is Metacoin free to use?",
            "answer":
                "Metacoin is greatest crypto wallet platform in this century"
          },
        ]
      },
      {
        "name": "Wallet",
        "listAskAnswer": [
          {
            "ask": "4 What is Metacoin?",
            "answer":
                "Metacoin is greatest crypto wallet platform in this century"
          },
          {
            "ask": "4 How to use Metacoin?",
            "answer":
                "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut a"
          },
          {
            "ask": "4 Is Metacoin is safe for me?",
            "answer":
                "Metacoin is greatest crypto wallet platform in this century"
          },
          {
            "ask": "How to send a money on Metacoin?",
            "answer":
                "Metacoin is greatest crypto wallet platform in this century"
          },
          {
            "ask": "How to reset account in Metacoin?",
            "answer":
                "Metacoin is greatest crypto wallet platform in this century"
          },
          {
            "ask": "Is there a tips for get a used this app?",
            "answer":
                "Metacoin is greatest crypto wallet platform in this century"
          },
          {
            "ask": "Is Metacoin free to use?",
            "answer":
                "Metacoin is greatest crypto wallet platform in this century"
          },
        ]
      },
      {
        "name": "Tips",
        "listAskAnswer": [
          {
            "ask": "4 What is Metacoin?",
            "answer":
                "Metacoin is greatest crypto wallet platform in this century"
          },
          {
            "ask": "4 How to use Metacoin?",
            "answer":
                "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut a"
          },
          {
            "ask": "4 Is Metacoin is safe for me?",
            "answer":
                "Metacoin is greatest crypto wallet platform in this century"
          },
          {
            "ask": "How to send a money on Metacoin?",
            "answer":
                "Metacoin is greatest crypto wallet platform in this century"
          },
          {
            "ask": "How to reset account in Metacoin?",
            "answer":
                "Metacoin is greatest crypto wallet platform in this century"
          },
          {
            "ask": "Is there a tips for get a used this app?",
            "answer":
                "Metacoin is greatest crypto wallet platform in this century"
          },
          {
            "ask": "Is Metacoin free to use?",
            "answer":
                "Metacoin is greatest crypto wallet platform in this century"
          },
        ]
      },
      {
        "name": "Somethingelse",
        "listAskAnswer": [
          {
            "ask": "4 What is Metacoin?",
            "answer":
                "Metacoin is greatest crypto wallet platform in this century"
          },
          {
            "ask": "4 How to use Metacoin?",
            "answer":
                "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut a"
          },
          {
            "ask": "4 Is Metacoin is safe for me?",
            "answer":
                "Metacoin is greatest crypto wallet platform in this century"
          },
          {
            "ask": "How to send a money on Metacoin?",
            "answer":
                "Metacoin is greatest crypto wallet platform in this century"
          },
          {
            "ask": "How to reset account in Metacoin?",
            "answer":
                "Metacoin is greatest crypto wallet platform in this century"
          },
          {
            "ask": "Is there a tips for get a used this app?",
            "answer":
                "Metacoin is greatest crypto wallet platform in this century"
          },
          {
            "ask": "Is Metacoin free to use?",
            "answer":
                "Metacoin is greatest crypto wallet platform in this century"
          },
        ]
      },
    ];
    topics.value = dataList.map<Topic>(Topic.fromJson).toList();
  }

  Future<void> getFAQList(Topic topic) async {
    faqs.value = topic.listAskAnswer ?? [];
    setCurrentTopic(topic);
  }
}

class FAQScreen extends BaseWidget<FAQScreenController> {
  FAQScreen({
    super.key,
    String? tag,
  }) : super(controller: FAQScreenController(), tag: tag);

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Scaffold(
        body: Ink(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            gradient: themeService.screenBackgroundGradient,
          ),
          child: SafeArea(
            child: Padding(
              padding: EdgeInsets.all(50.r),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    OHOAppBar02(
                      namePage: 'FAQ',
                    ),
                    SizedBox(height: 20.r),
                    SizedBox(
                      height: 130.r,
                      child: Obx(
                        () => ListView(
                          scrollDirection: Axis.horizontal,
                          children: [
                            for (int index = 0;
                                index < controller.topics.value.length;
                                index++) ...[
                              GestureDetector(
                                onTap: () {
                                  controller
                                      .getFAQList(controller.topics[index]);
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(60.sp),
                                    color: controller.isSelected(
                                            controller.topics[index].name ?? '')
                                        ? OHOColors.gold2
                                        : OHOColors.white,
                                  ),
                                  padding:
                                      EdgeInsets.only(left: 40.w, right: 40.w),
                                  child: Center(
                                    child: OHOText(
                                      controller.topics.value[index].name ?? '',
                                      color: controller.isSelected(
                                              controller.topics[index].name ??
                                                  '')
                                          ? OHOColors.white
                                          : OHOColors.blue3,
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 50.w,
                                child: Container(
                                  color: Colors.transparent,
                                ),
                              ),
                            ],
                          ],
                        ),
                      ),
                    ),
                    Obx(
                      () => ListView.builder(
                        shrinkWrap: true,
                        itemCount: controller.faqs.length,
                        itemBuilder: (context, index) {
                          return AskAnswerList(
                            tag: 'faq-tile-${controller.current.value.name}-$index',
                            index: index,
                            askAnswer: controller.faqs[index],
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      );
    });
  }
}

class AskAnswerListController extends BaseController {
  var expanded = false.obs;

  void updateExpanded(String tagName) {
    closePrevious();

    final controller = Get.find<FAQScreenController>();
    controller.setSelectedExpansionTile(tagName);
    expanded.value = true;
  }

  void closePrevious() {
    final controller = Get.find<FAQScreenController>();
    String tag = controller.getSelectedExpansionTile();
    if (tag != '') {
      final contactController = Get.find<AskAnswerListController>(tag: tag);
      contactController.setExpanded(false);
    }
  }

  void setExpanded(bool isSelected) {
    expanded.value = isSelected;
  }
}

class AskAnswerList extends BaseWidget<AskAnswerListController> {
  final AskAnswer? askAnswer;
  final int? index;

  AskAnswerList({
    super.key,
    String? tag,
    this.askAnswer,
    this.index,
  }) : super(
          controller: AskAnswerListController(),
          tag: tag,
        );

  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        return Column(
          children: [
            SizedBox(
              height: 50.h,
            ),
            Theme(
              data: ThemeData().copyWith(dividerColor: Colors.transparent),
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    width: 1,
                    color: OHOColors.gold2,
                  ),
                  borderRadius: BorderRadius.circular(27.sp),
                  color: OHOColors.white,
                ),
                child: ExpansionTile(
                  key: UniqueKey(),
                  initiallyExpanded: controller.expanded.value,
                  textColor: OHOColors.gold2,
                  collapsedTextColor: OHOColors.blue3,
                  onExpansionChanged: (bool) {
                    if (bool) {
                      controller.updateExpanded(tag!);
                    }
                  },
                  title: Text(
                    askAnswer?.ask ?? '',
                    style:
                        TextStyle(fontSize: 40.sp, fontWeight: FontWeight.bold),
                  ),
                  children: [
                    Container(
                      padding: EdgeInsets.only(
                        left: 40.w,
                        right: 40.w,
                        bottom: 15.h,
                      ),
                      child: Text(
                        askAnswer?.answer ?? '',
                        style: TextStyle(
                          color: OHOColors.blue5,
                          fontSize: 40.sp,
                          fontFamily: 'Outfit',
                          fontWeight: FontWeight.w400,
                          letterSpacing: 1.sp,
                        ),
                        textAlign: TextAlign.left,
                      ),
                    ),
                    SizedBox(
                      height: 50.h,
                    ),
                  ],
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
