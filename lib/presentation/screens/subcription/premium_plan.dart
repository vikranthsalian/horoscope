import 'dart:math';

import 'package:adithya_horoscope/core/app/navigator_key.dart';
import 'package:adithya_horoscope/core/config/hive_config.dart';
import 'package:adithya_horoscope/core/constants/asset_constants.dart';
import 'package:adithya_horoscope/core/constants/color_constants.dart';
import 'package:adithya_horoscope/core/constants/flavour_constants.dart';
import 'package:adithya_horoscope/core/constants/route_constants.dart';
import 'package:adithya_horoscope/core/constants/string_constants.dart';
import 'package:adithya_horoscope/core/utils/show_alert.dart';
import 'package:adithya_horoscope/data/cubits/login/login_cubit.dart';
import 'package:adithya_horoscope/data/datasources/user.dart';
import 'package:adithya_horoscope/presentation/components/app_bar.dart';
import 'package:adithya_horoscope/presentation/screens/profile/profile_form_bloc.dart';
import 'package:adithya_horoscope/presentation/widgets/button.dart';
import 'package:adithya_horoscope/presentation/widgets/row_view.dart';
import 'package:adithya_horoscope/presentation/widgets/style.dart';
import 'package:adithya_horoscope/presentation/widgets/svg_view.dart';
import 'package:adithya_horoscope/presentation/widgets/text_view.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

class PremiumPlanScreen extends StatelessWidget {
  var padding = EdgeInsets.symmetric(horizontal: 26.w);
  double amount = 499;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: MetaColors.whiteColor,
          appBar: MetaAppBar(title: MetaFlavourConstants.appTitle),
          bottomNavigationBar: Container(
            margin: EdgeInsets.only(bottom: 20.h),
            height: 40.h,
            padding: padding,
            child: MetaButton(
              radius: 12,
              bgColor: MetaColors().primaryColor,
              textStyle: const MetaStyle(
                  fontColor: MetaColors.whiteColor,
                  fontWeight: FontWeight.w100,
                  fontSize: 16),
              onTap: () async {
                makePayment();
              },
              text: "${"annual".tr()} $amount / ${"year".tr()}",
            ),
          ),
          body: Container(
            child: BlocProvider(
              create: (context) => ProfileFormBloc(),
              child: Builder(builder: (context) {
                ProfileFormBloc formBloc =
                    BlocProvider.of<ProfileFormBloc>(context);

                return FormBlocListener<ProfileFormBloc, String, String>(
                    onSubmissionFailed: (context, state) {
                      print("Error is.......$state");
                    },
                    onSuccess: (context, state) {
                      formBloc.clear();
                      // SignUpResponse? modelResponse = formBloc.dataModel.value;
                      //  Navigator.pop(context,(true,modelResponse!.email));
                    },
                    onFailure: (context, state) {
                      MetaAlert.showSnackbar(
                        error: true,
                        message: state.hasFailureResponse.toString(),
                      );
                    },
                    child: Stack(
                      children: [
                        Opacity(
                          opacity: 0.1,
                          child: Container(
                            height: MediaQuery.sizeOf(context).height,
                            child: MetaSVGView(
                                svgName: AssetConstants.logoOnySVG,
                                basePath: MetaFlavourConstants.flavorPath),
                          ),
                        ),
                        SingleChildScrollView(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(height: 10.h),
                              Container(
                                padding: padding,
                                alignment: Alignment.center,
                                child: MetaTextView(
                                  text: "premium_plan",
                                  textStyle: MetaStyle(
                                      fontSize: 20,
                                      fontColor: MetaColors().primaryColor,
                                      fontWeight: FontWeight.w100),
                                ),
                              ),
                              SizedBox(height: 20.h),
                              Container(
                                padding: padding,
                                alignment: Alignment.centerLeft,
                                child: MetaTextView(
                                  text:
                                      "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod",
                                  textAlign: TextAlign.start,
                                  textStyle: MetaStyle(
                                      fontSize: 12,
                                      fontColor: MetaColors.color3F3F3F,
                                      fontWeight: FontWeight.w100),
                                ),
                              ),
                              SizedBox(
                                height: 20.h,
                              ),
                              Container(
                                padding: padding,
                                alignment: Alignment.centerLeft,
                                child: MetaTextView(
                                  text: "whats_included",
                                  textStyle: MetaStyle(
                                      fontSize: 14,
                                      fontColor: MetaColors().primaryColor,
                                      fontWeight: FontWeight.w100),
                                ),
                              ),
                              SizedBox(
                                height: 5.h,
                              ),
                              ListView(
                                padding: padding,
                                shrinkWrap: true,
                                children: MetaFlavourConstants.premiumPlansList
                                    .map((e) {
                                  return Container(
                                    alignment: Alignment.centerLeft,
                                    padding:
                                        EdgeInsets.symmetric(vertical: 10.h),
                                    child: MetaRowView(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Container(
                                          width: 15.w,
                                          height: 15.w,
                                          child: MetaSVGView(
                                              activeColor:
                                                  MetaColors.color3F3F3F,
                                              svgName:
                                                  AssetConstants.premiumIcon,
                                              basePath: MetaFlavourConstants
                                                  .flavorPath),
                                        ),
                                        SizedBox(width: 10.w),
                                        MetaTextView(
                                          text: e,
                                          textStyle: MetaStyle(
                                              fontSize: 14,
                                              fontColor: MetaColors.color3F3F3F,
                                              fontWeight: FontWeight.w100),
                                        ),
                                      ],
                                    ),
                                  );
                                }).toList(),
                              )
                            ],
                          ),
                        ),
                      ],
                    ));
              }),
            ),
          )),
    );
  }

  makePayment() async {
    Razorpay razorpay = Razorpay();
    var options = {
      'key': 'rzp_test_1DP5mmOlF5G5ag',
      'amount': MetaFlavourConstants.planPrice * 100,
      'name': MetaFlavourConstants.appTitle,
      'description': 'Subscription Plan',
      'retry': {'enabled': true, 'max_count': 1},
      'send_sms_hash': true,
      'prefill': {'contact': '8888888888', 'email': 'test@razorpay.com'},
      'external': {
        'wallets': ['paytm']
      }
    };
    razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, handlePaymentErrorResponse);
    razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, handlePaymentSuccessResponse);
    razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, handleExternalWalletSelected);
    razorpay.open(options);
  }

  void handlePaymentErrorResponse(PaymentFailureResponse response) {
    print(
        "${response.code}\nDescription: ${response.message}\nMetadata:${response.error.toString()}");
    /*
    * PaymentFailureResponse contains three values:
    * 1. Error Code
    * 2. Error Description
    * 3. Metadata
    * */
    // showAlertDialog(context, "Payment Failed",
    //     "Code: ${response.code}\nDescription: ${response.message}\nMetadata:${response.error.toString()}");
  }

  void handlePaymentSuccessResponse(PaymentSuccessResponse response) async {
    /*
    * Payment Success Response contains three values:
    * 1. Order ID
    * 2. Payment ID
    * 3. Signature
    * */

    UserData userData = globalContext.read<LoginCubit>().getLoginResponse();
    DatabaseReference ref =
        FirebaseDatabase.instance.ref("users/${userData.id}");

    String startDate = DateFormat('dd-MM-yyyy').format(DateTime.now());
    String id = "$startDate-${generateRandom()}";

    String endDate = DateFormat('dd-MM-yyyy')
        .format(DateTime.now().add(Duration(days: 365)));

    DatabaseReference refPayment =
        FirebaseDatabase.instance.ref("payment_details/$id");

    Map<String, dynamic> planData = {
      "user_id": userData.id,
      "order_id": response.orderId,
      "plan_id": id,
      "plan_price": MetaFlavourConstants.planPrice,
      "payment_id": response.paymentId,
      "signature": response.signature,
      "start_date": startDate,
      "end_date": endDate,
    };
    print(planData);

    await refPayment.set(planData).then((_) {
      print(" Data saved successfully!");
    }).catchError((error) {
      print(error);
    });

    Map<String, dynamic> data = {
      "plan_details": "premium",
      "plan_id": id,
    };

    await ref.update(data).then((_) {
      print(" Data saved successfully!");
    }).catchError((error) {
      print(error);
    });

    userData.planDetails = "premium";
    userData.planID = id;

    MetaHiveConfig().putHive(StringConstants.userData, userData.toJson());

    UserData model = UserData.fromJson(userData.toJson());
    globalContext.read<LoginCubit>().setLoginResponse(model);

    Navigator.of(globalContext).pushNamed(RouteConstants.successPath);
    print(response.data.toString());
  }

  void handleExternalWalletSelected(ExternalWalletResponse response) {
    print(response.walletName);
    // showAlertDialog(
    //     context, "External Wallet Selected", "${response.walletName}");
  }

  generateRandom() {
    Random random = Random();
    String number = '';
    for (int i = 0; i < 10; i++) {
      number = number + random.nextInt(9).toString();
    }
    return number;
  }
}
