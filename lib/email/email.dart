import 'dart:math';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:sendgrid_mailer/sendgrid_mailer.dart';

Future<int> sendEmail (String username, String email) async {
  final random = Random();
  final randomNumber = random.nextInt(900000) + 100000;


  final ref = FirebaseDatabase.instance.ref();
  final result = await ref.child("tokens").get();
  final keys = result.value is List ? [] : (result.value as Map).keys.cast<String>();

  final maxNumber = keys == [] ? 0 : (keys as List).map<int>((key) => int.tryParse(key) ?? 0).reduce(max);

  DatabaseReference tokenRef = FirebaseDatabase.instance.ref("tokens/${maxNumber + 1}");

  await tokenRef.set({
    "token": randomNumber.toString(),
  });

  final mailer = Mailer('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');
  final toAddress = Address(email);
  final fromAddress = Address('beholdercompanion@gmail.com');
  final content = Content('text/plain', 'Olá ${username}, aqui está o token para validar sua conta Beholder :3\nToken: ${randomNumber}');
  final subject = 'Token do Beholder Companion';
  final personalization = Personalization([toAddress]);

  final emailSended =
  Email([personalization], fromAddress, subject, content: [content]);
  mailer.send(emailSended).then((result) {
    // ...
  });

  return maxNumber+1;
}


