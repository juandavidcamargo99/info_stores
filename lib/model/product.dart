class Product{
  late int id;
  late int idtienda;
  late String nombre;
  late String unidad;
  late double precio;
  late int cantidad;

  Product(
    this.id,
    this.idtienda,
    this.nombre,
    this.unidad,
    this.precio,
    this.cantidad,
  );

  Product.fromString(String texto){
    var list_pr = texto.split(";");
    id = int.parse(list_pr[1]);
    idtienda = int.parse(list_pr[0]);
    nombre = list_pr[2];
    unidad = list_pr[3];
    precio = double.parse(list_pr[4]);
    cantidad = 0;
  }

  Product.fromJson(Map<String, dynamic> json)
      : id = int.parse(json['id']),
        idtienda = int.parse(json['idtienda']),
        nombre = json['nombre'],
        unidad = json['unidad'],
        precio = double.parse(json['precio']),
        cantidad = int.parse(json['cantidad']);

  Map<String, dynamic> toJson(int cantidad) => {
    "id": id,
    "idtienda": idtienda,
    "nombre": nombre,
    "unidad": unidad,
    "precio": precio,
    "cantidad": cantidad
  };
}
