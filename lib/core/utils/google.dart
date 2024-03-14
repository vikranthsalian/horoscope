import 'package:adithya_horoscope/core/injector/injector.dart';
import 'package:adithya_horoscope/domain/model/response.dart';
import 'package:adithya_horoscope/domain/usecase/auth_usecase.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:google_sign_in/google_sign_in.dart';

class Google {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  List<String> scopes = <String>[
    'email',
    'https://www.googleapis.com/auth/contacts.readonly',
  ];

  GoogleSignIn _googleSignIn = GoogleSignIn(
    // Optional clientId
    // clientId: 'your-client_id.apps.googleusercontent.com',
    scopes: ['email'],
  );

  signIn() async {
    print("Google Signing In===================>");
    try {
      GoogleSignInAccount? googleUser =
          await _googleSignIn.signIn().catchError((onError) {
        print("Error $onError");
      });
      GoogleSignInAuthentication? googleSignInAuthentication =
          await googleUser?.authentication;

      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleSignInAuthentication!.accessToken,
        idToken: googleSignInAuthentication.idToken,
      );
      await _auth.signInWithCredential(credential);
      print("GOOGLE USER : ==========>");
      String? token = googleSignInAuthentication.idToken;
      print(googleUser?.displayName);
      print(googleUser?.email);
      print(googleUser?.photoUrl);

      Map<String, dynamic> payload = {
        "name": googleUser?.displayName,
        "email": googleUser?.email,
        "password": googleUser?.id,
        "gender": "Male",
        "username": googleUser?.displayName,
        "mobile": "",
        "profile_pic": googleUser?.photoUrl,
        "platform": "GOOGLE",
        "nationality": "KOREAN",
        "address": "--"
      };
      MetaResponse response =
          await Injector.resolve<AuthUseCase>().createMembership(payload);

      if (response.isSuccess!) {
        login(googleUser?.email, googleUser?.id);
      } else {
        print("do login===========>");
        if (response.statusCode == 302) {
          login(googleUser?.email, googleUser?.id);
        }
      }
    } catch (error) {
      print(error);
    }
  }

  signInSilently() {
    _googleSignIn.onCurrentUserChanged
        .listen((GoogleSignInAccount? account) async {
// #docregion CanAccessScopes
      // In mobile, being authenticated means being authorized...
      bool isAuthorized = account != null;
      // However, on web...
      if (kIsWeb && account != null) {
        isAuthorized = await _googleSignIn.canAccessScopes(scopes);
      }
// #enddocregion CanAccessScopes

      // setState(() {
      //   _currentUser = account;
      //   _isAuthorized = isAuthorized;
      // });

      // Now that we know that the user can access the required scopes, the app
      // can call the REST API.
      if (isAuthorized) {
        //  unawaited(_handleGetContact(account!));
      }
    });

    // In the web, _googleSignIn.signInSilently() triggers the One Tap UX.
    //
    // It is recommended by Google Identity Services to render both the One Tap UX
    // and the Google Sign In button together to "reduce friction and improve
    // sign-in rates" ([docs](https://developers.google.com/identity/gsi/web/guides/display-button#html)).
    _googleSignIn.signInSilently();
  }

  // Future<void> _handleGetContact(GoogleSignInAccount user) async {
  //   final http.Response response = await http.get(
  //     Uri.parse('https://people.googleapis.com/v1/people/me/connections'
  //         '?requestMask.includeField=person.names'),
  //     headers: await user.authHeaders,
  //   );
  //   if (response.statusCode != 200) {
  //     setState(() {
  //       _contactText = 'People API gave a ${response.statusCode} '
  //           'response. Check logs for details.';
  //     });
  //     print('People API ${response.statusCode} response: ${response.body}');
  //     return;
  //   }
  //   final Map<String, dynamic> data =
  //       json.decode(response.body) as Map<String, dynamic>;
  //   final String? namedContact = _pickFirstNamedContact(data);
  //   setState(() {
  //     if (namedContact != null) {
  //       _contactText = 'I see you know $namedContact!';
  //     } else {
  //       _contactText = 'No contacts to display.';
  //     }
  //   });
  // }

  signOut() async {
    try {
      print("Google Signing Out===================>");
      await _googleSignIn.disconnect();
    } catch (error) {
      print(error);
    }
  }

  void login(email, password) async {
    Map<String, dynamic> data = {"email": email, "password": password};

    // UserModel? userModel =
    //     await Injector.resolve<AuthUseCase>().userLogin(data);
    if (false) {
      // if (userModel.isSuccess!) {
      //   MetaHiveConfig().putHive(StringConstants.accessToken, userModel.token);
      //   MetaHiveConfig().putHive(StringConstants.currency, "Won");
      //
      //   UserData userData = userModel.data as UserData;
      //
      //   MetaHiveConfig().putHive(StringConstants.userId, userData.id);
      //   MetaHiveConfig().putHive(StringConstants.userData, userData);
      //   MetaHiveConfig().putHive(StringConstants.loggedIn, true);
      //   MetaHiveConfig().putHive(StringConstants.keepLoggedIn, true);
      //   globalContext.read<LoginCubit>().setLoginResponse(userData);
      //
      //   await CommonService().getConfigData({});
      //
      //   globalContext.read<LocationCubit>().setLocationAddress();
      //   Navigator.pushNamed(globalContext, RouteConstants.navPath);
    } else {
      // showDialog(
      //     context: globalContext,
      //     builder: (_) => MetaDialogCommonError(
      //           path: AssetConstants.dkCry,
      //           offset: -88,
      //           label: 'Not Authorised',
      //           desc: "duplicate_account_detected",
      //           buttonLabel: 'ok',
      //           onPress: () {
      //             Navigator.pop(globalContext);
      //           },
      //         ));
    }
  }
}

class Google2 {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  googleSignIn() async {
    // UserModel? user;
    try {
      GoogleSignInAccount? googleUser =
          await _googleSignIn.signIn().catchError((onError) {
        print("Error $onError");
      });

      GoogleSignInAuthentication? googleSignInAuthentication =
          await googleUser?.authentication;

      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleSignInAuthentication!.accessToken,
        idToken: googleSignInAuthentication.idToken,
      );
      await _auth.signInWithCredential(credential);
      print("GOOGLE USER : ==========>");
      String? token = googleSignInAuthentication.idToken;
      print(googleUser?.displayName);
      print(googleUser?.email);
      print(googleUser?.photoUrl);
      var now = DateTime.now();
      // user = UserModel(
      //     displayName: googleUser?.displayName,
      //     email: googleUser?.email,
      //     photoUrl: googleUser?.photoUrl,
      //     id: googleUser?.id,
      //     token: token,
      //     loginType: 'GOOGLE',
      //     status: 'ENABLED',
      //     created_at: '',
      //     last_login: now.toString());
      //print("GOOGLE USER : ==========>${user.displayName}");
    } catch (e) {
      return e.toString();
    }
    return "user";
  }

  googleLogout() async {
    await _googleSignIn.signOut();
    await _auth.signOut();
  }
}
