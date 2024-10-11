import 'package:cached_network_image/cached_network_image.dart';
import 'package:word_prime/export.dart';

class CustomUserCircleAvatar extends StatelessWidget {
  final double? circleRadius;
  final String? profileImgAddress;
  final Color? borderColor;
  final double? borderPadding;
  final double? borderWidth;
  const CustomUserCircleAvatar({
    super.key,
    this.circleRadius,
    this.profileImgAddress,
    this.borderColor,
    this.borderPadding,
    this.borderWidth,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(borderPadding ?? 3),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.white,
        border: Border.all(
          color: borderColor ?? Colors.transparent,
          width: borderWidth ?? 0,
        ),
      ),
      child: CircleAvatar(
        backgroundColor: Colors.transparent,
        radius: circleRadius ?? 30,
        backgroundImage: CachedNetworkImageProvider(
          profileImgAddress ?? AppLocaleConstants.DEFAULT_PROFILE_PICTURE,
        ),
      ),
    );
  }
}
