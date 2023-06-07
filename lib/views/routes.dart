import 'package:app1/views/loginscreen.dart';
import 'package:app1/views/savingscreen.dart';
import 'package:app1/views/logout.dart';
import 'package:app1/views/signupscreen.dart';
import 'package:app1/views/status.dart';
import 'package:app1/views/updatejoin.dart';
import 'package:get/get.dart';
import './splashscreen.dart';
import './loginscreen.dart';
import './signupscreen.dart';
import 'package:app1/models/listview.dart';
import './homes.dart';
import 'borrowinscreen.dart';
import './savingscreen.dart';
import 'create.dart';
import 'delete.dart';
import 'helpsscreen.dart';
import 'joiningpage.dart';


class Routes{
static const HOME = '/';
static const LANDINGPAGE = '/landingpage';
static const LOGIN = '/login';
static const SIGNUP = '/signup';
static const LISTVIEW= '/listview';
static const SAVING= '/saving';
static const BORROWING= '/borrowing';
static const WALLET= '/wallet';
static const PROFILE = '/profile';
static const JOIN = '/join';
static const CREATE = '/create';
static const UPDATE = '/update';
static const DELETE = '/delete';
static const SETTING = '/logout';
static const HELP = '/help';
static const STATUS = '/status';



static final routes = [
GetPage(name: HOME, page: () => MyHomePage()),
GetPage(name: LOGIN, page: () => LoginScreen()),
GetPage(name: SIGNUP, page: () => SignupScreen()),
GetPage(name: LISTVIEW, page: () => MyListView()),
GetPage(name: PROFILE, page: () => MyBottomNavigationBar()),
GetPage(name: SAVING, page: () => SavingsScreen ()),
GetPage(name: BORROWING, page: () =>  BorrowingScreen()),
GetPage(name: JOIN, page: () =>  RegistrationScreen()),
GetPage(name: CREATE, page: () =>  CreateScreen()),
GetPage(name: UPDATE, page: () =>  UpdateScreen()),
GetPage(name: DELETE, page: () => DeleteScreen()),
GetPage(name: SETTING, page: () =>  LogoutScreen()),
GetPage(name: HELP, page: () =>   HelpScreen()),
GetPage(name: STATUS, page: () =>  StatusScreen()),
];
}





