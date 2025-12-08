import 'package:movie_app/core/utils/app_assets.dart';

abstract class AppStrings {
  //===================On-Boarding=====================
  static const String discoverMovies = 'discoverMovies';
  static const String exploreAvastDescription = 'exploreAvastDescription';
  static const String exploreAllGenres = 'exploreAllGenres';
  static const String discoverMoviesDescription = 'discoverMoviesDescription';
  static const String createWatchlists = 'createWatchlists';
  static const String saveMoviesDescription = 'saveMoviesDescription';
  static const String startWatchingNow = 'startWatchingNow';
  static const String next = 'next';
  static const String back = 'back';
  static const String finish = 'finish';
  static const String isFirstOpen = 'isFirstOpen';

  //==================LogIn=============================
  static const String email = 'email';
  static const String password = 'password';
  static const String forgetPassword = 'forgetPassword';
  static const String login = 'login';
  static const String dontHaveAccount = 'dontHaveAccount';
  static const String createOne = 'createOne';
  static const String loginWithGoogle = 'loginWithGoogle';
  static const String oR = 'oR';
  static const String en = 'en';
  static const String ar = 'ar';
  static const String loading = 'loading';
  static const String successLogin = "SuccessLogin";

  //==================Register=============================
  static const String register = 'register';
  static const String name = 'name';
  static const String confirmPassword = 'confirmPassword';
  static const String phoneNumber = 'phoneNumber';
  static const String createAccount = 'createAccount';
  static const String alreadyHaveAccount = 'alreadyHaveAccount';
  static const String verifyEmail = 'verifyEmail';
  static const String forgetPasswordAppBar = 'forgetPasswordAppBar';
  static const String tokenOfLoggedInOrCreatedAccount =
      'tokenOfLoggedInOrCreatedAccount';
  static const String successRegister = "successRegister";

  //==================HomeBodyTab=============================
  static const String category = 'category';
  //==================MovieDetails=============================
  static const String screenShots = 'screenShots';
  static const String similar = 'similar';
  static const String summary = 'summary';
  static const String cast = 'cast';
  static const String genres = 'genres';
  static const String seeMore = 'seeMore';
  static const String readLess = 'ReadLess';
  static const String readMore = 'ReadMore';

  //===============states===================
  static const String notFound = 'notFound';

  //===============search===================
  static const String search = 'Search';

  //==============profile===================
  static const String watchList = 'watchList';
  static const String history = 'history';
  static const String editProfile = 'editProfile';
  static const String exit = 'exit';
  static const String resetPassword = 'resetPassword';
  static const String deleteAccount = 'deleteAccount';
  static const String updateData = 'updateData';
  static const String oldPassword = 'oldPassword';
  static const String newPassword = 'newPassword';
  static const String logOutSuccess = 'LogOutSuccessfully';
  static const String showDetails = 'ShowDetails';
  static const String deleteAccountSuccessfully = 'DeleteAccountSuccessfully';
  static List<String> avatars = [
    AppAssets.avatar1Image,
    AppAssets.avatar2Image,
    AppAssets.avatar3Image,
    // AppAssets.avatar4Image,
    AppAssets.avatar5Image,
    AppAssets.avatar6Image,
    // AppAssets.avatar7Image,
    AppAssets.avatar8Image,
    AppAssets.avatar9Image,
  ];
}
