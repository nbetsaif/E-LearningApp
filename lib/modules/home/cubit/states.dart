abstract class HomeStates{}

class HomeInitialState extends HomeStates{}

class HomeGetUserLoadingState extends HomeStates{}

class HomeGetUserSuccessState extends HomeStates{}

class HomeGetUserErrorState extends HomeStates
{
  String error;
  HomeGetUserErrorState(this.error);
}

class HomeChangeBotNavBarState extends HomeStates{}

class HomeUpdateUserLoadingState extends HomeStates{}

class HomeUpdateUserSuccessState extends HomeStates{}

class HomeUpdateUserErrorState extends HomeStates
{
  String error;
  HomeUpdateUserErrorState(this.error);
}

class HomeGetAllUsersLoadingState extends HomeStates{}

class HomeGetAllUsersSuccessState extends HomeStates{}

class HomeGetAllUsersErrorState extends HomeStates
{
  String error;
  HomeGetAllUsersErrorState(this.error);
}