import 'dart:io';

class Library {
  String bookTitle;
  int bookId;
  String authorName;
  int quantity;
  num price;
  String category;

  Library(
      {required this.bookTitle,
      required this.bookId,
      required this.authorName,
      required this.quantity,
      required this.price,
      required this.category});
}

class Book extends Library {
  Book(
      {required String bookTitle,
      required int bookId,
      required String authorName,
      required int quantity,
      required num price,
      required String category})
      : super(
            bookTitle: bookTitle,
            bookId: bookId,
            authorName: authorName,
            quantity: quantity,
            price: price,
            category: category);

   printDetails() {
    print("ID: ${super.bookId} \nTitle: ${super.bookTitle} \n Author ${super.authorName} \nPrice: ${super.price} \n Category ${super.category} \n Quantity:${quantity} }");
   }         


  void buy({required int quantity, required Sala sala}) {
    if (this.quantity >= quantity) {
      this.quantity -= quantity;
      num total = quantity * price;
      sala.total_price += total;
      print(
          "$quantity copies of '$bookTitle' purchased for a total of $total\$Thank you!");
    } else if (this.quantity > 0) {
      print(
          "Sorry, there are only ${this.quantity} copies of '$bookTitle' in stock.");
    } else {
      print("Sorry,'$bookTitle' is out of stock.");
    }
  }
}


class Sala {
  List<Book> books = [];
  num total_price = 0.0;
  Sala();
}


void main() {
  Sala my_sala = Sala();
  // Initialize some books
  List<Book> books = [
    Book(
        bookTitle: "The Great Gatsby",
        bookId: 1,
        authorName: "F. Scott Fitzgerald",
        quantity: 5,
        price: 23,
        category: "Drama"),
    Book(
        bookTitle: "To Kill a Mockingbird",
        bookId: 2,
        authorName: "Harper Lee",
        quantity: 3,
        price: 13,
        category: "Drama"),
    Book(
        bookTitle: "1984",
        bookId: 3,
        authorName: "George Orwell",
        quantity: 2,
        price: 23,
        category: "Drama"),
     Book(
        bookTitle: "The blue Elephant",
        bookId: 4,
        authorName: "Ahmed Mourad",
        quantity: 5,
        price: 10,
        category: "Mystery"),
      Book(
        bookTitle: "The Handmaid tale",
        bookId: 5,
        authorName: "Margaret Atwood",
        quantity: 3,
        price: 8,
        category: "Dysopian"),
        Book(
        bookTitle: "The Invisible Man",
        bookId: 6,
        authorName: "Mohamed Reda",
        quantity: 8,
        price: 12,
        category: "Fiction"),
        Book(
        bookTitle: "Memory of the Body",
        bookId:7 ,
        authorName: "Mohamed Reda",
        quantity: 9,
        price: 7,
        category: "Romance"),
        Book(
        bookTitle: "The Alchemist",
        bookId:8 ,
        authorName: "Paulo Coelho",
        quantity: 6,
        price: 15,
        category: "Romance"),
  ];
  print("\n\n     WELCOME TO THE BOOKSTORE       \n\n ");
  print("\n\n Choose From The Menu");
  // Print the available choices
  print("1. Display all books");
  print("2. Add a book");
  print("3. Remove a book");
  print("4. Update a book");
  print("5. Search for a book");
  print("6. Purchase");
  print("7. The Bill");
  print("8. Exit");
  

  
  while (true) {
    print("Enter your choice:");
    String choice = stdin.readLineSync()!;

    switch (choice) {
      case "1": // Display all books
        for (Book book in books) {
          print(
              "ID: ${book.bookId}, Title: ${book.bookTitle}, Author: ${book.authorName}, Quantity: ${book.quantity},Price:${book.price},Category: ${book.category}");
        }
        break;
      case "2": // Add a book
        print("Enter Book ID:");
        int bookId = int.parse(stdin.readLineSync()!);
        print("Enter Book Title:");
        String bookTitle = stdin.readLineSync()!;
        print("Enter Author Name:");
        String authorName = stdin.readLineSync()!;
        print("Enter Quantity:");
        int quantity = int.parse(stdin.readLineSync()!);
        print("Enter Price");
        num price = num.parse(stdin.readLineSync()!);
        print("Enter Category");
        String category = stdin.readLineSync()!;

        
        Book newBook = Book(
            bookTitle: bookTitle,
            bookId: bookId,
            authorName: authorName,
            quantity: quantity,
            price: price,
            category: category);
        books.add(newBook);
        print("Book added successfully.");
        break;
        
      case "3": // Remove a book
        print("Enter Book ID:");
        int bookId = int.parse(stdin.readLineSync()!);
        bool removed = false;
        for (int i = 0; i < books.length; i++) {
          if (books[i].bookId == bookId) {
            books.removeAt(i);
            removed = true;
            break;
          }
        }

        if (removed) {
          print("Book removed successfully.");
        } else {
          print("Book not found.");
        }
        break;

      case "4": // Update a book
        print("Enter Book ID:");
        int bookId = int.parse(stdin.readLineSync()!);

        Book bookToUpdate = books.firstWhere((book) => book.bookId == bookId,
            orElse: () => Book(
                bookTitle: '',
                bookId: 0,
                authorName: '',
                quantity: 0,
                price: 0,
                category: ""));

        if (bookToUpdate.bookId != 0) {
          print(
              "Enter new Book Title (current title is '${bookToUpdate.bookTitle}'): ");
          String? newTitle = stdin.readLineSync();
          print(
              "Enter new Author Name (current author is '${bookToUpdate.authorName}'): ");
          String? newAuthor = stdin.readLineSync();
          print(
              "Enter new Quantity (current quantity is '${bookToUpdate.quantity}'): ");
          int? newQuantity = int.tryParse(stdin.readLineSync()!);
          print("Enter new Pricr (current title is '${bookToUpdate.price}'): ");
          num? newPrice = num.tryParse(stdin.readLineSync()!);
          print(
              "Enter new Category (current title is '${bookToUpdate.bookTitle}'): ");
          String? newCategory = stdin.readLineSync();

          if (newTitle != null && newTitle.isNotEmpty) {
            bookToUpdate.bookTitle = newTitle;
          }
          if (newAuthor != null && newAuthor.isNotEmpty) {
            bookToUpdate.authorName = newAuthor;
          }
          if (newQuantity != null && newQuantity >= 0) {
            bookToUpdate.quantity = newQuantity;
          }
          if (newPrice != null && newPrice >= 0) {
            bookToUpdate.price = newPrice;
          }
          if (newCategory != null && newCategory.isNotEmpty) {
            bookToUpdate.category = newCategory;
          }

          print("Book updated successfully.");
        } else {
          print("Book not found.");
        }
        break;

     case "5": // Search for a book

  print("Search by:");
  print("1. Title");
  print("2. Author");
  print("3. Category");
  String searchChoice = stdin.readLineSync()!;
  print("Enter search query:");
  String searchQuery = stdin.readLineSync()!;

  List<Book> searchResults = [];
  switch (searchChoice) {
    case "1": // Search by title
      searchResults = books.where((book) => book.bookTitle.toLowerCase().contains(searchQuery.toLowerCase())).toList();
      break;
    case "2": // Search by author
      searchResults = books.where((book) => book.authorName.toLowerCase().contains(searchQuery.toLowerCase())).toList();
      break;
    case "3": // Search by category
      searchResults = books.where((book) => book.category.toLowerCase().contains(searchQuery.toLowerCase())).toList();
      break;
    default:
      print("Invalid search choice.");
      break;
  }

  if (searchResults.isNotEmpty) {
    for (Book book in searchResults) {
      book.printDetails();
    }
  } else {
    print("No books found matching the search query.");
  }

  break;

      case "6": // Purchase
        print("Enter Book ID:");
        int bookId = int.parse(stdin.readLineSync()!);
        print("Enter number of copies to purchase:");
        int quantity = int.parse(stdin.readLineSync()!);

        // Find the book with the specified ID and buy the requested quantity
        Book bookToPurchase = books.firstWhere((book) => book.bookId == bookId,
            orElse: () => Book(
                bookTitle: '',
                bookId: 0,
                authorName: '',
                quantity: 0,
                price: 0,
                category: ""));
        if (bookToPurchase.bookId != 0) {
          bookToPurchase.buy(quantity: quantity, sala: my_sala);
          my_sala.books.add(bookToPurchase);
        } else {
          print("Book not found.");
        }
        break;

         case "7": // The Bill
        print("${my_sala.total_price} \$"); 
        break;

      case "8" :
       exit(0);

      default: // Invalid choice
        print("Invalid choice. Please enter a number from 1 to 8.");
        break;
    }
}
      
  }





 


  





