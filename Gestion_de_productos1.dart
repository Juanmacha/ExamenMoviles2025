import 'dart:io';

List<List<dynamic>> productos = [];

void main() {
  int opcion = 0;

  do {
    print("\n-- Bienvenido a la gestión de productos --");
    print("1. Listar productos");
    print("2. Registrar producto");
    print("3. Actualizar producto");
    print("4. Eliminar producto");
    print("5. Salir");
    print("Seleccione una opción: ");

    try {
      opcion = int.parse(stdin.readLineSync()!);
    } catch (e) {
      print("Error: Debe ingresar un número del 1 al 5.");
      continue;
    }

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
      print(
          "${i + 1}. Nombre: ${productos[i][0]} | Precio: \$${productos[i][1]} | Cantidad: ${productos[i][2]}");
    }
  }
}

void registrar() {
  try {
    print("Ingrese el nombre del producto: ");
    String nombre = stdin.readLineSync()!.trim();
    if (nombre.isEmpty) {
      print("El nombre no puede estar vacío.");
    }

    print("Ingrese el precio del producto: ");
    double precio = double.parse(stdin.readLineSync()!);
    if (precio <= 0) {
      print("El precio debe ser mayor a cero.");
    }

    print("Ingrese la cantidad del producto: ");
    int cantidad = int.parse(stdin.readLineSync()!);
    if (cantidad <= 0) {
      print("La cantidad debe ser mayor a cero.");
    }

    productos.add([nombre, precio, cantidad]);
    print("Producto registrado con éxito.");
  } catch (e) {
    print(" Error al registrar producto: $e");
  }
}

void actualizar() {
  if (productos.isEmpty) {
    print("No hay productos para actualizar.");
    return;
  }

  listar();

  try {
    print("Ingrese el número del producto a actualizar: ");
    int index = int.parse(stdin.readLineSync()!);

    if (index <= 0 || index > productos.length) {
      print("Número inválido. El producto no existe.");
    }

    print("Nuevo nombre (dejar vacío para mantener actual): ");
    String nombre = stdin.readLineSync()!.trim();
    if (nombre.isEmpty) {
      nombre = productos[index - 1][0];
    }

    print("Nuevo precio (dejar vacío para mantener actual): ");
    String precioInput = stdin.readLineSync()!.trim();
    double precio = precioInput.isEmpty
        ? productos[index - 1][1]
        : double.parse(precioInput);
    if (precio <= 0) {
      print("El precio debe ser mayor a cero.");
    }

    print("Nueva cantidad (dejar vacío para mantener actual): ");
    String cantidadInput = stdin.readLineSync()!.trim();
    int cantidad = cantidadInput.isEmpty
        ? productos[index - 1][2]
        : int.parse(cantidadInput);
    if (cantidad <= 0) {
      print("La cantidad debe ser mayor a cero.");
    }

    productos[index - 1] = [nombre, precio, cantidad];
    print("Producto actualizado correctamente.");
  } catch (e) {
    print("Error al actualizar producto: $e");
  }
}


void eliminar() {
  if (productos.isEmpty) {
    print("No hay productos para eliminar.");
    return;
  }

  listar();

  try {
    print("Ingrese el número del producto a eliminar: ");
    int index = int.parse(stdin.readLineSync()!);

    if (index <= 0 || index > productos.length) {
      throw FormatException("Número inválido. El producto no existe.");
    }

    productos.removeAt(index - 1);
    print(" Producto eliminado con éxito.");
  } catch (e) {
    print(" Error al eliminar producto: $e");
  }
}
