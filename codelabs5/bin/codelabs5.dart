import 'dart:async';

//uso incorrrecto de asincronomo
//String createOrderMessage() {
 // var order = fetchUserOrder();
//  return 'Your order is: $order';
//}

//Future<String> fetchUserOrder() =>
    // Imagine that this function is more complex and slow.
//Future.delayed(
//  const Duration(seconds: 2),
 //     () => 'Large Latte',
//);

//Introduccion a futurox
//Future<void> fetchUserOrder() {
  // Imagine that this function is fetching user info from another service or database.
 // return Future.delayed(const Duration(seconds: 2), () => print('Large Latte'));
//}

//Completar con un error
/*Future<void> fetchUserOrder() {
// Imagine that this function is fetching user info but encounters a bug
  return Future.delayed(const Duration(seconds: 2),
          () => throw Exception('Logout failed: user ID is invalid'));
}*/
// dentro de funciones asincrona
/*Future<void> printOrderMessage() async {
  print('Awaiting user order...');
  var order = await fetchUserOrder();
  print('Your order is: $order');
}

Future<String> fetchUserOrder() {
  // Imagine that this function is more complex and slow.
  return Future.delayed(const Duration(seconds: 4), () => 'Large Latte');
}*/

//Practica de asyn y await
/*Future<String> fetchRole() {
  // Imagine that this function is fetching user info from another service or database.
  return Future.delayed(const Duration(seconds: 2), () => 'admin');
}
Future<String> reportUserRole() async {
  var username = await fetchRole();
  return 'User role: $username';
}
Future<int> fetchLoginAmount() {
  // Imagine that this function is fetching the number of logins from another service or database.
  return Future.delayed(const Duration(seconds: 1), () => 10);
}

Future<String> reportLogins() async {
  var logins = await fetchLoginAmount();
  return 'Total number of logins: $logins';
}*/

/* //Practicando manejo de errores
Future<String> fetchNewUsername() {
  // Imagine that this function is fetching a new username from another service or database.
  return Future.delayed(const Duration(seconds: 2), () => 'Batman estuvo aqui');
}
Future<String> changeUsername() async {
  try {
    return await fetchNewUsername();
  } catch (err) {
    return err.toString();
  }
}*/

//Practica completa
Future<String> fetchUsername() {
  // Imagine that this function is fetching the username from another service or database.
  return Future.delayed(const Duration(seconds: 2), () => 'John');
}

String addHello(String user) => 'Hello $user';

Future<String> greetUser() async {
  var username = await fetchUsername();
  return addHello(username);
}

Future<String> logoutUser() async {
  return Future.delayed(const Duration(seconds: 2), () => 'User logged out');
}

Future<String> sayGoodbye() async {
  try {
    var result = await logoutUser();
    return '$result Thanks, see you next time';
  } catch (e) {
    return 'Failed to logout user: $e';
  }
}

void main() async{
  //print(createOrderMessage());

  //Introduccion a futuro y podemos ocupar para completar con un error
  /*try {
    await fetchUserOrder(); // Esperamos a que se complete la función fetchUserOrder
    print('Fetching user order...');
  } catch (e) {
    print('Error: $e'); // Imprimimos el error capturado
  }*/

  //Ejecucion dentro de funciones asincronas
  /*countSeconds(4);
  await printOrderMessage();
}

// You can ignore this function - it's here to visualize delay time in this example.
void countSeconds(int s) {
  for (var i = 1; i <= s; i++) {
    Future.delayed(Duration(seconds: i), () => print(i));
  }*/

  /*print('---------------\n Practicando el uso de asyn y await');
  var userRole = await reportUserRole(); // Esperamos a que se complete la función reportUserRole
  var loginReport = await reportLogins(); // Esperamos a que se complete la función reportLogins

  print(userRole); // Imprimimos el resultado de reportUserRole por consola
  print(loginReport);*/

  /*print('---------------\n Practicando Manejo de Errores');
  var result = await changeUsername(); // Esperamos a que se complete la función changeUsername
  print(result);*/

  print('---------------\n Practicando Todo lo aprendido');
  // Llamamos a la función greetUser()
  var greetResult = await greetUser();
  print(greetResult);

  // Llamamos a la función sayGoodbye()
  var goodbyeResult = await sayGoodbye();
  print(goodbyeResult);

}
