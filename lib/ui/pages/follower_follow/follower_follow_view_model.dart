import 'package:word_prime/export.dart';

class FollowerFollowViewModel extends BaseViewModel {
  final bool isFollow;
  FollowerFollowViewModel(this.isFollow);

  ValueNotifier<bool> isFollowOrFollower = ValueNotifier(true);

}
