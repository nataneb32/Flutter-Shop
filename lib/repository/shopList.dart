class Item{
  final String id;
  final String name;
  final String price;
  final String imageUrl;
  Item({this.id,this.name,this.price,this.imageUrl});
}

final List<Item> mock = <Item>[
  Item(id: "1",name: "Hamburger 1",price: "10.00R\$",imageUrl: "https://www.teclasap.com.br/wp-content/uploads/2011/05/hamburger.jpg"),
  Item(id: "2",name: "Hamburger 2",price: "32.00R\$",imageUrl: "https://www.teclasap.com.br/wp-content/uploads/2011/05/hamburger.jpg"),
  Item(id: "3",name: "Hamburger 3",price: "12.00R\$",imageUrl: "https://www.teclasap.com.br/wp-content/uploads/2011/05/hamburger.jpg"),
  
  ];

class ShopRepo{
  static List<Item> getList(){
    return mock;
  }
  static Item getByID(String id){
    return mock.firstWhere((element) => element.id == id);
  }
}