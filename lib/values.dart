class MenuItem {
  final String name;
  int quantity;

  MenuItem(this.name, this.quantity);
}

List<MenuItem> items = [
  MenuItem('Oreo',1),
  MenuItem('Galleta Maria',0),
  MenuItem('Nutella',10),
  MenuItem('Pay de Limón',7),
  MenuItem('Chocobanana',0),
  MenuItem('Mazapan',8),
  MenuItem('Bubulubu',2),
  MenuItem('Gansito',9),
  MenuItem('Fresas con crema',2)
];

List<MenuItem> itemsA = [
  MenuItem('Tamarindo',1),
  MenuItem('Pulparindo',0),
  MenuItem('Mango',10),
  MenuItem('Mangoneada',7),
  MenuItem('Limón',0),
  MenuItem('Piña',8),
  MenuItem('Piña Loca',2),
  MenuItem('Jamaica',2),
  MenuItem('Coco',4),
];

List<String> menu = [];
List<String> menuA = [];
String imageMenu = '';
