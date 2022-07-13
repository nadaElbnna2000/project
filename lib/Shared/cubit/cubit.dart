import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/Shared/remote/dio_helper.dart';
import 'package:untitled/Shared/cubit/states.dart';

import '../remote/end_points.dart';

class ShopLoginCubit extends Cubit<ShopLoginStates>{

  ShopLoginCubit() : super(ShopLoginIntialState());


   static ShopLoginCubit get(context) => BlocProvider.of(context);

   void userLogin({
     required String email,
     required String password,
   })
   {
     emit(ShopLoginLoadingState());

     dioHelper.postData(
         url: Categories,
         data: {
           'email':email,
           'password':password,
         }
     ).then((value){
       print(value);
       emit(ShopLoginSuccessState());
     }).catchError((error){
       print(error);
       emit(ShopLoginIErrorState(error.toString()));
     });
}



    IconData suffix = Icons.visibility_outlined;
    bool isPassword = true;

    void ChangePasswordVisibility(){
      isPassword = !isPassword ;
      suffix = isPassword ? Icons.visibility_outlined:Icons.visibility_off_outlined;
      emit(ShopChangePasswordVisibilityState());

    }
   }