import '../../../config.dart';

class SocialIconLayout extends StatelessWidget {
  final String? icon;
  const SocialIconLayout({Key? key,this.icon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Sizes.s65,
      width: Sizes.s65,
      padding: const EdgeInsets.symmetric(vertical: Insets.i20),
      decoration: BoxDecoration(
          color: const Color(0xFFF0F0F0),
          borderRadius: BorderRadius.circular(AppRadius.r50)),
      child: Image.asset(icon!,fit: BoxFit.contain,),
    );
  }
}
