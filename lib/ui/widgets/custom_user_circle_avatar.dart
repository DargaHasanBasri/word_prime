import 'package:cached_network_image/cached_network_image.dart';
import 'package:word_prime/export.dart';

class CustomUserCircleAvatar extends StatelessWidget {
  final double? circleRadius;
  final String? profileImgAddress;
  final Color? borderColor;
  const CustomUserCircleAvatar({
    super.key,
    this.circleRadius,
    this.profileImgAddress,
    this.borderColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(3),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: borderColor ?? Colors.white,
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
