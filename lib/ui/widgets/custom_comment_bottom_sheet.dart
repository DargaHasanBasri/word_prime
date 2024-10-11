import 'package:word_prime/export.dart';

class CustomCommentBottomSheet extends StatelessWidget {
  const CustomCommentBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height / 1.5,
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(16),
        ),
      ),
      child: Column(
        children: [
          Padding(
            padding: AppPaddings.paddingSmallVertical,
            child: Container(
              height: 4,
              width: 50,
              decoration: BoxDecoration(
                color: AppColors.mirage,
                borderRadius: BorderRadius.circular(6),
              ),
            ),
          ),
          Text(
            'Yorumlar',
            style: TextStyle(
              color: AppColors.mirage,
              fontSize: 16,
              fontWeight: FontWeight.w700,
            ),
          ),
          Expanded(
            child: ListView.separated(
              padding: AppPaddings.paddingMediumAll,
              itemCount: 20,
              itemBuilder: (context, index) {
                return Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CustomUserCircleAvatar(
                      circleRadius: 16,
                      borderWidth: 0,
                      profileImgAddress:
                          AppLocaleConstants.EXAMPLE_PROFILE_PICTURE,
                    ),
                    SizedBox(width: AppSizes.sizedBoxSmallWidth),
                    Container(
                      width: MediaQuery.of(context).size.width / 1.5,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text(
                                'Test User',
                                style: TextStyle(
                                  color: AppColors.mirage,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                maxLines: 1,
                              ),
                              SizedBox(width: AppSizes.sizedBoxSmallWidth),
                              Text(
                                '1s',
                                style: TextStyle(
                                  color: AppColors.mirage.withOpacity(0.25),
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                maxLines: 1,
                              ),
                            ],
                          ),
                          SizedBox(height: AppSizes.sizedBoxSmallHeight),
                          Text(
                            'Examp Comment  abc',
                            style: TextStyle(
                              color: AppColors.ebonyClay,
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              overflow: TextOverflow.ellipsis,
                            ),
                            maxLines: 3,
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            AppAssets.icInactiveLikePath,
                            width: 16,
                            height: 16,
                          ),
                          Text(
                            '12',
                            style: TextStyle(
                              color: AppColors.mirage,
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                );
              },
              separatorBuilder: (context, index) => SizedBox(
                height: AppSizes.sizedBoxMediumHeight,
              ),
            ),
          ),
          Padding(
            padding: AppPaddings.paddingMediumAll,
            child: Row(
              children: [
                CustomUserCircleAvatar(
                  profileImgAddress: AppLocaleConstants.EXAMPLE_PROFILE_PICTURE,
                  borderWidth: 0,
                  circleRadius: 20,
                ),
                SizedBox(width: AppSizes.sizedBoxSmallWidth),
                Expanded(
                  child: CustomTextFormField(
                    controller: TextEditingController(),
                    borderRadius: 60,
                    hintText: 'Write your comment...',
                    hintTextColor: AppColors.riverBed,
                    textInputAction: TextInputAction.done,
                    isSuffixIcon: true,
                    suffixIconAddress: AppAssets.icSendPath,
                    onPressSuffixIcon: () {},
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
