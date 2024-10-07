import 'package:dotted_border/dotted_border.dart';
import 'package:word_prime/export.dart';

class AddPhotoContainer extends StatelessWidget {
  final VoidCallback onTap;
  const AddPhotoContainer({
    super.key,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 16 / 9,
      child: DottedBorder(
        borderType: BorderType.RRect,
        radius: Radius.circular(16),
        dashPattern: [6, 6],
        color: AppColors.santaGrey,
        strokeWidth: 2,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: InkWell(
            borderRadius: BorderRadius.circular(16),
            onTap: () => onTap.call(),
            child: Ink(
              decoration: BoxDecoration(
                color: Colors.transparent,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(AppAssets.icAddPhotoPath),
                    SizedBox(height: 16),
                    Text(
                      LocaleKeys.addPost_selectImage.locale,
                      style: TextStyle(
                        color: AppColors.mirage,
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
