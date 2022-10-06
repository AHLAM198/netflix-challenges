import 'package:flutter/cupertino.dart';
import 'package:netflix_reimagined/users_list/models/user_error.dart';
import 'package:netflix_reimagined/users_list/models/users_list_model.dart';
import 'package:netflix_reimagined/users_list/repo/api_status.dart';
import 'package:netflix_reimagined/users_list/repo/user_services.dart';

class UsersViewModel extends ChangeNotifier {
  bool _loading = false;
  List<UserModel> _userListModel = [];
  UserError? _userError;

  bool get loading => _loading;
  List<UserModel> get userListModel => _userListModel;
  UserError get userError => _userError!;

  setLoading(bool loading) async {
    _loading = loading;
    notifyListeners();
  }

  UsersViewModel() {
    getUsers();
  }

  setUserListModel(List<UserModel> userListModel) async {
    _userListModel = userListModel;
  }

  setUserError(UserError userError) async {
    _userError = userError;
  }

  getUsers() async {
    setLoading(true);
    var response = await UserServices.getUsers();
    if (response is Success) {
      setUserListModel(response.response as List<UserModel>);
    } else if (response is Failure) {
      UserError userError = UserError(
        code: response.code!,
        message: response.errorResponse.toString(),
      );
      setUserError(userError);
    }
    setLoading(false);
  }
}
