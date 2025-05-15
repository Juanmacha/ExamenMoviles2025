import 'dart:io';

List<List<dynamic>> productos = [];

void main() {
  int opcion;

  do {
    print("\n-- Bienvenido a la gestión de productos --");
    print("1. Listar productos");
    print("2. Registrar producto");
    print("3. Actualizar producto");
    print("4. Eliminar producto");
    print("5. Salir");
    print("Seleccione una opción: ");
    
    opcion = int.parse(stdin.readLineSync()!);

    switch (opcion) {
      case 1:
        listar();
        break;
      case 2:
        registrar();
        break;
      case 3:
        actualizar();
        break;
      case 4:
        eliminar();
        break;
      case 5:
        print("Saliendo...");
        break;
      default:
        print("Opción no válida. Intente de nuevo.");
    }
  } while (opcion != 5);
}


void listar() {
  if (productos.isEmpty) {
    print("No hay productos registrados.");
  } else {
    print("\n-- Lista de productos --");
    for (int i = 0; i < productos.length; i++) {
      print("${i + 1}. Nombre: ${productos[i][0]} | Precio: \$${productos[i][1]} | Cantidad: ${productos[i][2]}");
    }
  }
}

void registrar() {
  print("Ingrese el nombre del producto: ");
  String nombre = stdin.readLineSync()!;

  print("Ingrese el precio del producto: ");
  double precio = double.parse(stdin.readLineSync()!);
  if (precio <= 0) {
    print("Producto no registrado");
    print("El precio debe ser mayor a cero.");
    return;
  }
  print("Ingrese la cantidad del producto: ");
  int cantidad = int.parse(stdin.readLineSync()!);
  if (cantidad <= 0) {
    print("Producto no registrado");
    print("La cantidad debe ser mayor a cero.");
    return;
  }

  productos.add([nombre, precio, cantidad]);
  print("Producto registrado con éxito.");
}


void actualizar() {
  listar();
  print("Ingrese el número del producto a actualizar: ");
  int index = int.parse(stdin.readLineSync()!);

  if (index > 0 && index <= productos.length) {
    print("Nuevo nombre: ");
    String nombre = stdin.readLineSync()!;

    print("Nuevo precio: ");
    double precio = double.tryParse(stdin.readLineSync()!) ?? productos[index - 1][1];
    if (precio <= 0) {
      print("El precio debe ser mayor a cero.");
      return;
    }

    print("Nueva cantidad: ");
    int cantidad = int.tryParse(stdin.readLineSync()!) ?? productos[index - 1][2];
    if (cantidad <= 0) {
      print("La cantidad debe ser mayor a cero.");
      return;
    }

    productos[index - 1] = [nombre, precio, cantidad];
    print("Producto actualizado correctamente.");
  } else {
    print("Número inválido.");
    print("El producto no existe.");
  }
}


void eliminar() {
  listar();
  print("Ingrese el número del producto a eliminar: ");
  int index = int.parse(stdin.readLineSync()!);

  if (index > 0 && index <= productos.length) {
    productos.removeAt(index - 1);
    print("Producto eliminado con éxito.");
  } else {
    print("Número inválido.");
    print("El producto no existe.");
  }
}
