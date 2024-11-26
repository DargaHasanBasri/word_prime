import 'package:dotted_border/dotted_border.dart';
import 'package:word_prime/export.dart';

class AddPhotoContainer extends StatelessWidget {
  final VoidCallback onTap;
  final Uint8List? selectedImageBytes;
  const AddPhotoContainer({
    super.key,
    this.selectedImageBytes,
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
        color: Theme.of(context).colorScheme.secondary,
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
              child: selectedImageBytes != null
                  ? Center(
                      child: Image.memory(
                        selectedImageBytes!,
                        fit: BoxFit.cover,
                        width: double.infinity,
                        height: double.infinity,
                      ),
                    )
                  : Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(AppAssets.icAddPhotoPath),
                          SizedBox(height: 16),
                          Text(
                            LocaleKeys.addPost_selectImage.locale,
                            style: Theme.of(context).textTheme.titleSmall,
                          ),
                          Text(
                            '(${LocaleKeys.optional.locale})',
                            style: Theme.of(context).textTheme.titleSmall,
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
