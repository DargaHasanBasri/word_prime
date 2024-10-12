import 'package:word_prime/export.dart';

class AnalysisResults extends StatelessWidget {
  const AnalysisResults({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.rhino,
        borderRadius: BorderRadius.circular(14),
        boxShadow: [
          BoxShadow(
            color: AppColors.white.withOpacity(0.25),
            offset: Offset(0, 4),
            blurRadius: 4,
          ),
        ],
      ),
      child: Stack(
        children: [
          Padding(
            padding: AppPaddings.appPaddingAll,
            child: Container(
              width: 100,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    "Quiz Analiz Sonuçlarım",
                    style: TextStyle(
                      color: AppColors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                      overflow: TextOverflow.ellipsis,
                    ),
                    maxLines: 2,
                  ),
                  SizedBox(height: 16),
                  CustomButton(
                    title: 'Tümünü Gör',
                    titleFontSize: 12,
                    titleVerticalPadding: 8,
                    borderRadius: 8,
                  )
                ],
              ),
            ),
          ),
          Positioned(
            right: 0,
            child: Image.asset(
              AppAssets.imgQuizAnalysisIllustrationPath,
            ),
          ),
          Positioned(
            right: 30,
            bottom: 0,
            child: Image.asset(
              AppAssets.imgQuizAnalysisPath,
            ),
          ),
        ],
      ),
    );
  }
}
