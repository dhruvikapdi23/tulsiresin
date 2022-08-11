import 'package:tulsiresin/config.dart';
import 'package:tulsiresin/controllers/edit_profile_controller.dart';
import 'package:tulsiresin/views/edit_profile/widgets/name_text_box.dart';
import 'package:tulsiresin/widgets/common/custom_button.dart';
import 'package:tulsiresin/widgets/common/email_text_box.dart';

class EditProfile extends StatelessWidget {
  final editProfileCtrl = Get.put(EditProfileController());

  EditProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<EditProfileController>(builder: (_) {
      return Scaffold(
        backgroundColor: appCtrl.appTheme.white,
        appBar: AppBar(
          backgroundColor: appCtrl.appTheme.white,
          elevation: 0,
          centerTitle: true,
          title: Text(CommonFonts().editProfile),
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Stack(
                alignment: Alignment.bottomRight,
                children: [
                  InkWell(
                    onTap: ()=> editProfileCtrl.openSelector(context),
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(AppRadius.r50),
                        child: editProfileCtrl.selectedFile != null ?  Image.file(
                          editProfileCtrl.selectedFile!,
                          fit: BoxFit.cover,
                          height: Sizes.s100,
                          width: Sizes.s105,
                        ): Image.asset(
                          imageAssets.user,
                          height: Sizes.s100,
                          width: Sizes.s105,
                          alignment: Alignment.centerLeft,
                          fit: BoxFit.cover,
                        )),
                  ),
                  Positioned(
                      right: 10,
                      child: Container(
                          padding: const EdgeInsets.only(
                              left: Insets.i3,
                              right: Insets.i2,
                              top: Insets.i2,
                              bottom: Insets.i3),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: appCtrl.appTheme.primary,
                          ),
                          child: Icon(
                            Icons.edit,
                            color: appCtrl.appTheme.white,
                            size: Sizes.s16,
                          )))
                ],
              ),
              Space(0, 20),
              EmailTextBox(
                controller: editProfileCtrl.txtEmail,
              ),
              Space(0, 50),
              NameTextBox(
                controller: editProfileCtrl.txtName,
              ),
              Space(0, 50),
              CustomButton(title: "UPDATE",radius: 0,)
            ],
          )
              .width(MediaQuery.of(context).size.width)
              .marginSymmetric(horizontal: Insets.i15, vertical: Insets.i5),
        ),
      );
    });
  }
}
