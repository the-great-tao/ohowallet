import 'package:ohowallet/core/exports.dart';
import 'package:ohowallet/screens/about_oho_screen.dart';
import 'package:ohowallet/widgets/oho_app_bar_02.dart';

class PrivacyPolicyScreenController extends BaseController {
  var text = 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Urna id volutpat lacus laoreet non curabitur gravida arcu. Amet nisl purus in mollis nunc sed id. Elementum curabitur vitae nunc sed. A pellentesque sit amet porttitor eget. Ac turpis egestas integer eget aliquet nibh. Nibh praesent tristique magna sit amet purus gravida. Sagittis nisl rhoncus mattis rhoncus urna neque viverra. Volutpat sed cras ornare arcu dui vivamus arcu felis bibendum.' +
      '\n\nSagittis vitae et leo duis ut diam. Et pharetra pharetra massa massa. Faucibus et molestie ac feugiat. Ac feugiat sed lectus vestibulum. Sagittis eu volutpat odio facilisis. Venenatis urna cursus eget nunc scelerisque viverra mauris. Facilisi cras fermentum odio eu feugiat pretium nibh ipsum consequat. Etiam tempor orci eu lobortis elementum nibh. Quis auctor elit sed vulputate mi sit. Quis ipsum suspendisse ultrices gravida dictum fusce ut placerat orci. Suspendisse potenti nullam ac tortor vitae purus faucibus ornare suspendisse. Lorem sed risus ultricies tristique nulla aliquet enim tortor. Condimentum mattis pellentesque id nibh tortor id.' +
      '\n\nLorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Urna id volutpat lacus laoreet non curabitur gravida arcu. Amet nisl purus in mollis nunc sed id. Elementum curabitur vitae nunc sed. A pellentesque sit amet porttitor eget. Ac turpis egestas integer eget aliquet nibh. Nibh praesent tristique magna sit amet purus gravida. Sagittis nisl rhoncus mattis rhoncus urna neque viverra. Volutpat sed cras ornare arcu dui vivamus arcu felis bibendum.';
}

class PrivacyPolicyScreen extends BaseWidget<PrivacyPolicyScreenController> {
  PrivacyPolicyScreen({
    super.key,
  }) : super(controller: PrivacyPolicyScreenController());

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
                      namePage: 'Privacy Policy',
                    ),
                    SizedBox(height: 20.r),
                    Text(
                      controller.text,
                      style: TextStyle(
                        color: OHOColors.blue5,
                        fontFamily: 'Outfit',
                        fontSize: 50.sp,
                        fontWeight: FontWeight.w300,
                        letterSpacing: 2.sp,
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
