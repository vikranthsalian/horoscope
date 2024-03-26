import 'package:adithya_horoscope/core/app/navigator_key.dart';
import 'package:adithya_horoscope/core/config/hive_config.dart';
import 'package:adithya_horoscope/core/constants/route_constants.dart';
import 'package:adithya_horoscope/core/constants/string_constants.dart';
import 'package:adithya_horoscope/data/cubits/login/login_cubit.dart';
import 'package:adithya_horoscope/data/datasources/user.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';
import 'package:google_sign_in/google_sign_in.dart';

class Google {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  List<String> scopes = <String>[
    'email',
    'https://www.googleapis.com/auth/contacts.readonly',
    "https://www.googleapis.com/auth/userinfo.profile"
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
      String id = "", name = "", email = "", pic = "";

      id = googleUser?.id ?? "";
      name = googleUser?.displayName ?? "";
      email = googleUser?.email ?? "";
      pic = googleUser?.photoUrl ?? "";

      DatabaseReference ref = FirebaseDatabase.instance.ref("users/$id");

      Map<String, dynamic> data = {
        "id": id,
        "name": name,
        "email": email,
        "mobile": "",
        "photoUrl": pic,
        "last_login": DateTime.now().toString(),
      };

      final snapshot = await ref.get();

      if (!snapshot.exists) {
        data['status'] = 1;
        data['plan_details'] = "basic";
        data['reg_date'] = DateTime.now().toString();

        await ref.set(data).then((_) {
          print(" Data saved successfully!");
        }).catchError((error) {
          print(error);
        });
      } else {
        Map<dynamic, dynamic>? userData =
            snapshot.value as Map<dynamic, dynamic>?;
        print(userData);
        userData!['last_login'] = DateTime.now().toString();

        if (userData['plan_id'] != null &&
            userData['plan_id'].toString().isNotEmpty &&
            userData['plan_details'] == "premium") {
          DatabaseReference pref = FirebaseDatabase.instance
              .ref("payment_details/${userData['plan_id']}");

          final snapshot = await pref.get();
          Map<dynamic, dynamic>? paymentData =
              snapshot.value as Map<dynamic, dynamic>?;

          DateTime cdateTime = DateTime.now();
          DateTime endDate =
              DateFormat("dd-MM-yyyy").parse(paymentData!['end_date']);

          var diff = endDate.difference(cdateTime).inDays;
          if (diff < 1) {
            await ref.update({
              "plan_details": "basic",
              "plan_id": "",
              "last_login": DateTime.now().toString(),
            }).then((_) {
              print(" Data saved successfully!");
            }).catchError((error) {
              print(error);
            });
          }
          print("------------");
          print(diff);
        } else {
          //update user

          await ref.update({
            "last_login": DateTime.now().toString(),
          }).then((_) {
            print(" Data saved successfully!");
          }).catchError((error) {
            print(error);
          });
        }
      }
      final sp = await ref.get();
      Map<dynamic, dynamic>? finalData = sp.value as Map<dynamic, dynamic>?;
      Map<String, dynamic> allData = finalData!.cast<String, dynamic>();

      print("allData");
      print(allData);

      MetaHiveConfig().putHive(StringConstants.keepLoggedIn, true);
      MetaHiveConfig().putHive(StringConstants.userData, allData);
      UserData model = UserData.fromJson(allData);
      globalContext.read<LoginCubit>().setLoginResponse(model);
      Navigator.pushNamed(globalContext, RouteConstants.homePath);
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
