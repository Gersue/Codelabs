bool predicate (String item){
  return item.length > 5;
}
//Ejercicio de any y very
bool anyUserUnder18(Iterable<User> users) {
  return users.any((user) => user.age < 18);
}

bool everyUserOver13(Iterable<User> users) {
  return users.every((user) => user.age > 13);
}

class User {
  String name;
  int age;

  User(
  this.name,
  this.age,
  );
}
//filtrado de un elemento de una lista
Iterable<User> filterOutUnder21(Iterable<User> users) {
  return users.where((user) => user.age >= 21);
}

Iterable<User> findShortNamed(Iterable<User> users) {
  return users.where((user) => user.name.length <= 3);
}

class Person {
  String name;
  int age;

  Person(
      this.name,
      this.age,
      );
}

//Ejercicio completo
Iterable<EmailAddress> parseEmailAddresses(Iterable<String> strings) {
  return strings.map((s) => EmailAddress(s));
}

bool anyInvalidEmailAddress(Iterable<EmailAddress> emails) {
  return emails.any((email) => !isValidEmailAddress(email));
}

Iterable<EmailAddress> validEmailAddresses(Iterable<EmailAddress> emails) {
  return emails.where((email) => isValidEmailAddress(email));
}

class EmailAddress {
  final String address;

  EmailAddress(this.address);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is EmailAddress &&
              runtimeType == other.runtimeType &&
              address == other.address;

  @override
  int get hashCode => address.hashCode;

  @override
  String toString() {
    return 'EmailAddress{address: $address}';
  }
}

void main() {
  print("-------------------------\nColleccion Iterable");
const iterable =['Salad', 'Popcorn', 'Toast'];
for(final element in iterable){
  print(element);
}
  print("-------------------------\nUsing el primer y ultimo elemento");
Iterable<String> iterar = const ['Salad', 'Popcorn', 'Toast'];
print("The first element is ${iterar.first}");
  print("The last element is ${iterar.last}");

  print("-------------------------\nUsing de firstwhere");
  const items = ['Salad', 'Popcorn', 'Toast', 'Lasagne'];

  //you can find with a simple expression
  var foundItem1 = items.firstWhere((item) => item.length > 5);
  print(foundItem1);
  // Or try using a function block:
  var foundItem2 = items.firstWhere((item) {
    return item.length > 5;
  });
  print(foundItem2);

  // Or even pass in a function reference:
  var foundItem3 = items.firstWhere(predicate);
  print(foundItem3);

  // You can also use an `orElse` function in case no value is found!
  var foundItem4 = items.firstWhere(
        (item) => item.length > 10,
    orElse: () => 'None!',
  );
  print(foundItem4);

  print("-----------------------\nEjemplo de predicado");

  Iterable<String> itemss = ['Mango', 'Papaya', 'Manzana'];
  Iterable<String> filteredItems = itemss.where(
          (element) => element.startsWith('M') && element.contains('a'));
  for (String item in filteredItems) {
    print(item);
  }

  print("-----------------------\nEjemplo comprobacion de condicion");
  const contenido = ['Salad', 'Popcorn', 'Toast'];

  if (contenido.any((item) => item.contains('a'))) {
    print('At least one item contains "a"');
  }

  if (contenido.every((item) => item.length >= 5)) {
    print('All items have length >= 5');
  }

  print("-----------------------\nEjemplo Ejercicio usando every and any");
  List<User> users = [
    User("Juan", 12),
    User("Maria", 13),
    User("Pedro", 22)
  ];

  if (anyUserUnder18(users)) {
    print("Hay usuarios menores de 18 años en la lista.");
  } else {
    print("No hay usuarios menores de 18 años en la lista.");
  }

  if (everyUserOver13(users)) {
    print("Todos los usuarios en la lista son mayores de 13 años.");
  } else {
    print("Hay usuarios en la lista que son menores de 14 años.");
  }

  print("-----------------------\nEjemplo Filtracion, Usando Where");
  var evenNumbers = const [1, -2, 3, 42].where((number) => number.isEven);

  for (final number in evenNumbers) {
    print('$number is even.');
  }

  if (evenNumbers.any((number) => number.isNegative)) {
    print('evenNumbers contains negative numbers.');
  }

  // If no element satisfies the predicate, the output is empty.
  var largeNumbers = evenNumbers.where((number) => number > 1000);
  if (largeNumbers.isEmpty) {
    print('largeNumbers is empty!');
  }
  //Usando TakeWhile
  const numbers = [1, 3, -2, 0, 4, 5];

  var numbersUntilZero = numbers.takeWhile((number) => number != 0);
  print('Numbers until 0: $numbersUntilZero');

  var numbersStartingAtZero = numbers.skipWhile((number) => number != 0);
  print('Numbers starting at 0: $numbersStartingAtZero');

  print("\nEste si es el ejercicio filtrado de elemento en una lista\n");
  List<User> People = [    User("Juan", 25),    User("Maria", 21),    User("Pedro", 22),    User("Ana", 25),    User("Luis", 22),    User("Eva", 19),  ];

  Iterable<User> filteredUsers = filterOutUnder21(People);
  print("Usuarios mayores o iguales a 21 años:");
  for (User user in filteredUsers) {
    print("${user.name}, ${user.age} años");
  }

  Iterable<User> shortNamedUsers = findShortNamed(People);
  print("\nUsuarios con nombres de 3 letras o menos:");
  for (User user in shortNamedUsers) {
    print(user.name);
  }

print("--------------------\nCartografia");
  //Uso de map para cambiar elemento
  var numbersByTwo = const [1, -2, 3, 42].map((number) => number * 2);
  print('Numbers: $numbersByTwo');
  //Asignacion a tipo diferente
  print("------\Asignacion de un tipo diferente");
  List<User> people = [    User("Juan", 20),    User("Maria", 21),    User("Pedro", 22),    User("Ana", 25)  ];

  Iterable<String> nameAndAges = getNameAndAges(people);
  for (String result in nameAndAges) {
    print(result);
  }

  //Ejercicio Completo
  // Definir la lista de direcciones de correo electrónico como una lista de cadenas
  List<String> emailsString = [
    'user1@example.com',
    'user2@domain.com',
    'invalid email',
    'user3@example.com'
  ];

  // Llamar al método parseEmailAddresses y guardar los resultados en una lista de EmailAddress
  Iterable<EmailAddress> emails = parseEmailAddresses(emailsString);

  // Llamar al método anyInvalidEmailAddress para verificar si hay alguna dirección de correo electrónico inválida
  bool hasInvalidEmail = anyInvalidEmailAddress(emails);

  if (hasInvalidEmail) {
    print('Se encontraron direcciones de correo electrónico inválidas.');
  } else {
    print('Todas las direcciones de correo electrónico son válidas.');
  }

  // Llamar al método validEmailAddresses para obtener una lista de direcciones de correo electrónico válidas
  Iterable<EmailAddress> validEmails = validEmailAddresses(emails);

  print('Direcciones de correo electrónico válidas:');
  validEmails.forEach((email) => print(email));

}



//Asignacion a tipo diferente
Iterable<String> getNameAndAges(Iterable<User> users) {
  return users.map((user) => '${user.name} is ${user.age}');
}

class People {
  String name;
  int age;

  People(
      this.name,
      this.age,
      );
}

