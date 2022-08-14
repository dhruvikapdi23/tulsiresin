import 'package:tulsiresin/common/array/user_setting_list.dart';
import 'package:tulsiresin/config.dart';
import 'package:tulsiresin/controllers/user_controller.dart';
import 'package:tulsiresin/views/user/widgets/dynamic_list_card.dart';
import 'package:tulsiresin/views/user/widgets/name_email_layout.dart';
import 'package:tulsiresin/views/user/widgets/top_layout.dart';

class User extends StatelessWidget {
  final userCtrl = Get.put(UserController());
   User({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<UserController>(
      builder: (_) {
        return SafeArea(
          child: Scaffold(
            backgroundColor: appCtrl.appTheme.surface,
            body: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  InkWell(onTap: ()=>Get.toNamed(routeName.editProfile),child: const TopLayout()),
                  Space(0, 80),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                       NameEmailLayout(
                        title: CommonFonts().userName,
                        value: 'minh',
                      ),
                      Space(0, 20),
                       NameEmailLayout(
                        title: CommonFonts().email,
                        value: 'minhcasi@gmail.com',
                      ),
                      Space(0, 50),
                      ...userSettingList.asMap().entries.map((e) {
                        dynamic childData = e.value['child'];
                        List child = childData;
                        return DynamicListCard(data: e.value,child: child,);
                      }).toList()
                    ],
                  ).marginSymmetric(horizontal: Insets.i20)
                ],
              ),
            ),
          ),
        );
      }
    );
  }
}
