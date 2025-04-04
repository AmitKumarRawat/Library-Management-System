import 'package:flutter/material.dart';

class Addbooksinlibrary extends StatefulWidget {
  const Addbooksinlibrary({super.key});

  @override
  State<Addbooksinlibrary> createState() => _AddbooksinlibraryState();
}

class _AddbooksinlibraryState extends State<Addbooksinlibrary> {
  TextEditingController controllerBookName = new TextEditingController();
  TextEditingController controllerAuthorName = new TextEditingController();
  TextEditingController controllerAccessionNum = new TextEditingController();
  TextEditingController controllerQuantity = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.green.shade400,
          iconTheme: IconThemeData(
            color: Colors.white,
            size: 30,
          ),
          title: Row(
            children: [
              Text(
                'Add Books in Library',
                style: TextStyle(
                    color: Colors.white, fontFamily: 'serif', fontSize: 21),
              ),
              SizedBox(
                width: 3,
              ),
              Icon(
                Icons.bookmark_add,
                color: Colors.white,
              )
            ],
          ),
        ),
        body: Center(
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  decoration: BoxDecoration(
                      color: Colors.pinkAccent.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(21)),
                  margin: EdgeInsets.all(11),
                  child: Column(
                    children: [
                      bookElementsforAdd("Enter Book Name", Icon(Icons.book),
                          "Book-Name", TextInputType.text, controllerBookName),
                      bookElementsforAdd("Enter author Name", Icon(Icons.person),
                          "Author Name", TextInputType.name, controllerAuthorName),
                      bookElementsforAdd(
                          "Enter accession number",
                          Icon(Icons.numbers),
                          "Accession-Num",
                          TextInputType.number,
                          controllerAccessionNum),
                      bookElementsforAdd("Enter book units", Icon(Icons.numbers),
                          "Quantity", TextInputType.number, controllerQuantity),
                    ],
                  ),
                ),
                InkWell(
                  onTap: () {
                    addedSrccessfully();
                  },
                  child: Container(
                    width: MediaQuery.sizeOf(context).width,
                    padding: EdgeInsets.all(7),
                    margin: EdgeInsets.all(11),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(21),
                        color: Colors.green.shade400,
                        boxShadow: [
                          new BoxShadow(
                            color: Colors.blue.withOpacity(0.33),
                            offset: Offset(3, 3),
                            blurRadius: 0.2,
                          ),
                        ]),
                    child: Text(
                      "Add book in Library",
                      style: TextStyle(
                          fontSize: 16, color: Colors.white, fontFamily: 'serif'),
                      textAlign: TextAlign.center,
                    ),
                  ),
                )
              ],
            ),
          ),
        ));
  }

  bookElementsforAdd(String hintT, Icon icon_name, String label,
      TextInputType keyboard, TextEditingController controller) {
    return Padding(
      padding: const EdgeInsets.all(11.0),
      child: Card(
        elevation: 7,
        shadowColor: Colors.white,
        child: SizedBox(
          width: MediaQuery.sizeOf(context).width * 0.9,
          child: TextField(
            controller: controller,
            decoration: InputDecoration(
              prefixIcon: icon_name,
              filled: true,
              fillColor: Colors.blue.withOpacity(0.17),
              prefixIconColor: Colors.black,
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.0),
                  borderSide: BorderSide.none),
              hintText: hintT,
              labelText: label,
              labelStyle: const TextStyle(
                  fontSize: 16, color: Colors.black, fontFamily: 'serif'),
              hintStyle: const TextStyle(
                fontSize: 16,
                color: Colors.black,
                fontFamily: 'serif',
              ),
            ),
            keyboardType: keyboard,
            style: const TextStyle(
                fontSize: 16, color: Colors.black, fontFamily: 'serif'),
          ),
        ),
      ),
    );
  }

  void addedSrccessfully() {
    String bookName = controllerBookName.text.toLowerCase().toString().trim();
    String author = controllerAuthorName.text.toLowerCase().toString().trim();
    String accession =
        controllerAccessionNum.text.toLowerCase().toString().trim();
    String quntityBooks =
        controllerQuantity.text.toLowerCase().toString().trim();
    if (bookName == "") {
      showAlertForAnyContext(context, "Book Name can't be empty");
    } else if (author == "") {
      showAlertForAnyContext(context, "Author Name can't be empty");
    } else if (accession == "") {
      showAlertForAnyContext(context, "Accession Number can't be empty");
      ;
    } else if (quntityBooks == "") {
      showAlertForAnyContext(context, "Quantity can't be empty");
    }else{
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        behavior: SnackBarBehavior.floating,
        margin: EdgeInsets.only(bottom: 11, left: 11, right: 11),
        content: Text(
          "Added Successfully in library",
          textAlign: TextAlign.center,
        )));

        // initialize fields 
        
        
      
    }

    
  }
   void showAlertForAnyContext(BuildContext context, var message) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Center(
              child: Text(
            '  \n \n  $message \n \n ',
            style: TextStyle(
                fontSize: 16, fontFamily: 'serif', color: Colors.black),
          )),
          icon: Icon(
            Icons.info,
            size: 51,
          ),
          iconColor: Colors.lightBlue,
          actions: [
            Center(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text(
                  ' Ok ',
                  style: TextStyle(color: Colors.white),
                ),
                style: ElevatedButton.styleFrom(
                    alignment: Alignment.center, backgroundColor: Colors.blue),
              ),
            ),
           
          ],
        );
      },
    );
  }
}
