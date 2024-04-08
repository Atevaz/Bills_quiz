import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quiz/core/constants/assets_manager.dart';
import 'package:quiz/core/router/app_router_names.dart';
import 'package:quiz/core/styles/colors.dart';
import 'package:quiz/core/widgets/custom_button.dart';
import 'package:quiz/core/widgets/custom_svg_image_provider.dart';
import 'package:quiz/core/widgets/default_text_form_field.dart';
import 'package:quiz/core/widgets/headline_text.dart';
import 'package:quiz/core/widgets/regular_text.dart';
import 'package:quiz/feature/auth/data_source/models/request/customer/login_request_model.dart';
import 'package:quiz/feature/auth/manager/auth_cubit.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is LoginSuccessState) {
          AuthCubit.get(context).getBills();
          Navigator.pushReplacementNamed(
              context, AppRouterNames.rHomeLayoutRoute);
        }
      },
      builder: (context, state) {
        return Scaffold(
          body: Padding(
            padding: EdgeInsets.fromLTRB(16.w, 70.h, 16.w, 0),
            child: SizedBox(
              width: double.infinity,
              child: Form(
                key: formKey,
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 100.h,
                      ),
                      const HeadLineText(
                        text: 'Welcome',
                        color: AppColor.primaryColor,
                      ),
                      SizedBox(
                        height: 15.h,
                      ),
                      const RegularText(
                          text:
                              'Please enter your number to verify '),
                      SizedBox(
                        height: 25.h,
                      ),
                      MyFormField(
                        controller: nameController,
                        validateText: 'cna\'t be empty',
                        inputType: TextInputType.text,
                        hintText: 'user name',
                        prefix: CustomSVGImageProvider(
                          imagePath: AssetsManager.userIcon,
                          width: 15.w,
                        ),
                      ),
                      SizedBox(
                        height: 15.h,
                      ),
                      MyFormField(
                        controller: passwordController,
                        validateText: 'cna\'t be empty',
                        inputType: TextInputType.text,
                        hintText: 'password',
                        prefix: CustomSVGImageProvider(
                          imagePath: AssetsManager.settingIcon,
                          width: 15.w,
                        ),
                      ),
                      SizedBox(
                        height: 30.h,
                      ),
                      BlocConsumer<AuthCubit, AuthState>(
                        listener: (context, state) {
                          // TODO: implement listener
                        },
                        builder: (context, state) {
                          return Center(
                            child: MyButton(
                              onPressed:state is LoginLoadingState ? (){} : () {
                                if (formKey.currentState!.validate()) {

                                    AuthCubit.get(context).customerLogin(
                                        loginRequestModel: LoginRequestModel(
                                      userName: nameController.text,
                                      password: passwordController.text,
                                    ));

                                }
                              },
                              text: 'Login',
                              borderRadius: 40.r,
                              isLoading:
                                  state is LoginLoadingState ? true : false,
                              width: 242.w,
                              height: 50.h,
                            ),
                          );
                        },
                      ),
                      SizedBox(
                        height: 250.h,
                      ),
                      const Center(
                        child: RegularText(text: 'رقم الإصدار: 1.30.0 (921)'),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
