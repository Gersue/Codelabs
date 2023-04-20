String stringify(int x, int y) {
  return '$x $y';
}
String? upperCaseIt(String? str) {
  return str?.toUpperCase();
  // Try conditionally accessing the `toUpperCase` method here.
}

void updateSomeVars() {
  String? bar; // = null

  // Use the null coalescing assignment operator to assign 'a string' to bar.
  bar ??= 'a string';
}

//sintaxis flechas
class MyClass {
  int value1 = 2;
  int value2 = 3;
  int value3 = 5;

  // Returns the product of the above values:
  int get product => value1 * value2 * value3;

  // Adds 1 to value1:
  void incrementValue1() => value1++;

  // Returns a string containing each item in the
  // list, separated by commas (e.g. 'a,b,c'):
  String joinWithCommas(List<String> strings) =>  strings.join(',');
}
//Ejemplo cascada
class BigObject {
  int anInt = 0;
  String aString = '';
  List<double> aList = [];
  bool _done = false;

  void allDone() {
    _done = true;
  }
}

BigObject fillBigObject(BigObject obj) {
  return obj
    ..anInt = 1
    ..aString = 'String!'
    ..aList.add(3)
    ..allDone();
}
//get y set
class InvalidPriceException {}

class ShoppingCart {
  List<double> _prices = [];

  double get total => _prices.fold(0, (e, t) => e + t);

  set prices(List<double> value) {
    if (value.any((p) => p < 0)) {
      throw InvalidPriceException();
    }

    _prices = value;
  }
}
//Parametros posicionales opcionales
String joinWithCommas(int a, [int? b, int? c, int? d, int? e]) {
  var total = '$a';
  if (b != null) total = '$total,$b';
  if (c != null) total = '$total,$c';
  if (d != null) total = '$total,$d';
  if (e != null) total = '$total,$e';
  return total;
}
//Parametros con nombre
class MyDataObject {
  final int anInt;
  final String aString;
  final double aDouble;

  MyDataObject({
    this.anInt = 1,
    this.aString = 'Old!',
    this.aDouble = 2.0,
  });

  MyDataObject copyWith({int? newInt, String? newString, double? newDouble}) {
    return MyDataObject(
      anInt: newInt ?? this.anInt,
      aString: newString ?? this.aString,
      aDouble: newDouble ?? this.aDouble,
    );
  }
}
//Exceptions
typedef VoidFunction = void Function();

class ExceptionWithMessage {
  final String message;
  const ExceptionWithMessage(this.message);
}

abstract class Logger {
  void logException(Type t, [String? msg]);
  void doneLogging();
} //Agregare esto para dar una mostracion
class ConsoleLogger implements Logger {
  @override
  void logException(Type t, [String? msg]) {
    if (msg != null) {
      print('Exception of type $t with message: $msg');
    } else {
      print('Exception of type $t');
    }
  }

  @override
  void doneLogging() {
    print('Logging done.');
  }
}

void tryFunction(VoidFunction untrustworthy, Logger logger) {
  try {
    untrustworthy();
  } on ExceptionWithMessage catch (e) {
    logger.logException(e.runtimeType, e.message);
  } on Exception {
    logger.logException(Exception);
  } finally {
    logger.doneLogging();
  }
}
//Usar tjis en constructor
class Clase2 {
  final int anInt;
  final String aString;
  final double aDouble;

  Clase2(this.anInt, this.aString, this.aDouble);
}

//Lista de inicializadores
class FirstTwoLetters {
  final String letterOne;
  final String letterTwo;

  FirstTwoLetters(String word)
      : assert(word.length >= 2),
        letterOne = word[0],
        letterTwo = word[1];
}
//Constructores con nombre
class Color {
  int red;
  int green;
  int blue;

  Color(this.red, this.green, this.blue);

  Color.black()
      : red = 0,
        green = 0,
        blue = 0;
}

//Constructores de fabricas
class IntegerHolder {
  IntegerHolder();

  factory IntegerHolder.fromList(List<int> list) {
    if (list.length == 1) {
      return IntegerSingle(list[0]);
    } else if (list.length == 2) {
      return IntegerDouble(list[0], list[1]);
    } else if (list.length == 3) {
      return IntegerTriple(list[0], list[1], list[2]);
    } else {
      throw Error();
    }
  }
}

class IntegerSingle extends IntegerHolder {
  final int a;
  IntegerSingle(this.a);
}

class IntegerDouble extends IntegerHolder {
  final int a;
  final int b;
  IntegerDouble(this.a, this.b);
}

class IntegerTriple extends IntegerHolder {
  final int a;
  final int b;
  final int c;
  IntegerTriple(this.a, this.b, this.c);
}

//Redirigir constructores
class Colors {
  int red;
  int green;
  int blue;

  Colors(this.red, this.green, this.blue);

  Colors.black() : this(0, 50, 0);
}

//Constructores Constante
class Recipe {
  final List<String> ingredients;
  final int calories;
  final double milligramsOfSodium;

  const Recipe(this.ingredients, this.calories, this.milligramsOfSodium);
}

void main() {
  String result = stringify(10, 3);
  print(result);
  print("-----------\nVariables Anulables");
  String name = 'Jane';
  String? address;
  print("Para visualizar esto \n String name = 'Jane';\n String address = Null;\nSi real mente queremos escribir esto seria");
  print(" String name = 'Jane';\n String? address;");

  print("-----------\n Operadores Concientenulos");
  String? foo = 'a string';
  String? bar; // = null

  // Use the null coalescing operator to assign 'a string' to baz.
  String? baz = foo ?? bar;
  print('baz: $baz'); // Output: baz: a string

  updateSomeVars();

  // The value of bar has been updated by updateSomeVars.
  print('bar: $bar'); // Output: bar: a string

  print("-----------\n Acceso condicional a la propiedad");
  print(upperCaseIt('hola mundo')); // muestra 'HOLA MUNDO' en la consola
  print(upperCaseIt(null));

  print("-----------\n Lista de Colecciones");
// Assign this a list containing 'a', 'b', and 'c' in that order:
  final aListOfStrings = ['a', 'b', 'c'];
print(aListOfStrings);
// Assign this a set containing 3, 4, and 5:
  final aSetOfInts = {3, 4, 5};
  print(aSetOfInts);
// Assign this a map of String to int so that aMapOfStringsToInts['myKey'] returns 12:
  final aMapOfStringsToInts = {'myKey': 12};
  print(aMapOfStringsToInts);
// Assign this an empty List<double>:
  final anEmptyListOfDouble = <double>[];
  print(anEmptyListOfDouble);
// Assign this an empty Set<String>:
  final anEmptySetOfString = <String>{};
  print(anEmptySetOfString);
// Assign this an empty Map of double to int:
  final anEmptyMapOfDoublesToInts = <double, int>{};
  print(anEmptyMapOfDoublesToInts);

  print("-----------\n Sintaxis flecha");
  MyClass myClass = MyClass();  //Llamada a nuestra clase

  print('El producto de los valores value1, value2 y value3 es ${myClass.product}');

  myClass.incrementValue1();

  print('El producto actualizado de los valores value1, value2 y value3 es ${myClass.product}');

  List<String> stringList = ['a', 'b', 'c'];

  String joinedString = myClass.joinWithCommas(stringList);

  print('La lista unida con comas es: $joinedString');
  print("-----------\n Ejemplo Cascada");
  // Crear un objeto vacío de la clase BigObject
  BigObject myObject = BigObject();

  // Llenar el objeto con los valores utilizando la función fillBigObject()
  myObject = fillBigObject(myObject);

  // Mostrar el contenido del objeto utilizando la función print()
  print('El valor de anInt es ${myObject.anInt}');
  print('El valor de aString es ${myObject.aString}');
  print('El valor de aList es ${myObject.aList}');
  print('El valor de _done es ${myObject._done}');

  print("\n-----------\n Ejemplo Getters y setters");
  ShoppingCart cart = ShoppingCart();

  cart.prices = [10.0, 20.0, 30.0];

  print('El total de la compra es ${cart.total} dólares.');

  try {
    cart.prices = [10.0, -20.0, 30.0];
  } catch (e) {
    print('Se ha producido un error: ${e.toString()}');
  }
  print("\n-----------\n Ejemplo parametros Posicionales Opcionales");
  print(joinWithCommas(1)); // salida: "1"
  print(joinWithCommas(1, 2)); // salida: "1,2"
  print(joinWithCommas(1, 2, 3)); // salida: "1,2,3"
  print(joinWithCommas(1, 2, 3, 4)); // salida: "1,2,3,4"
  print(joinWithCommas(1, 2, 3, 4, 5)); // salida: "1,2,3,4,5"

  print("\n-----------\n Ejemplo parametros con Nombres");
  final original = MyDataObject(anInt: 1, aString: 'Old!', aDouble: 2.0);
  print(original.anInt); // salida: 1
  print(original.aString); // salida: Old!
  print(original.aDouble); // salida: 2.0

  final updated = original.copyWith(newString: 'New!');
  print(updated.anInt); // salida: 1
  print(updated.aString); // salida: New!
  print(updated.aDouble); // salida: 2.0

  print("\n-----------\n Ejemplo Exceptions");
  var logger = ConsoleLogger();
  tryFunction(() {
    throw ExceptionWithMessage('This is an error message.');
  }, logger);

  print("\n-----------\n Ejemplo Usar this en constructor");
  var prueba = Clase2(42, 'Hello, world!', 3.14);
  print(prueba.anInt);
  print(prueba.aString);
  print(prueba.aDouble);

  print("\n-----------\n Ejemplo Listas de Inicializadores");
  var Prueba2 = FirstTwoLetters('Hello');
  print(Prueba2.letterOne);  // Imprime "H"
  print(Prueba2.letterTwo);  // Imprime "e"

  print("\n-----------\n Ejemplo Constructores con nombre");
  var myColor = Color(255, 0, 0);
  print(myColor.red);
  print(myColor.green);

  print("\n-----------\n Ejemplo Constructores de fabricas");
  final single = IntegerHolder.fromList([42]);
  print(single is IntegerSingle); // true

  final doubleValue = IntegerHolder.fromList([1, 2]);
  print(doubleValue is IntegerDouble); // true

  final tripleValue = IntegerHolder.fromList([1, 2, 3]);
  print(tripleValue is IntegerTriple); // true

  try {
    final invalidValue = IntegerHolder.fromList([1, 2, 3, 4]);
    print(invalidValue);
  } catch (e) {
    print(e); // prints "Error"
  }

  print("\n-----------\n Ejemplo Redirigir Constructores");
  final black = Colors.black();
  print('Red: ${black.red}, Green: ${black.green}, Blue: ${black.blue}');

  print("\n-----------\n Ejemplo Constructores Constante");
  Recipe recipe = Recipe(['flour', 'sugar', 'eggs'], 500, 200.5);
  print('Ingredients: ${recipe.ingredients}');
  print('Calories: ${recipe.calories}');
  print('Milligrams of Sodium: ${recipe.milligramsOfSodium}');

}
