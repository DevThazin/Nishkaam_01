import 'package:flutter/material.dart';

class Profile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0, // Remove app bar shadow
        centerTitle: true,
        title: Text(
          'Profile',
          style: TextStyle(color: Colors.black), // Text color
        ),
        leading: IconButton(
          icon: Icon(Icons.menu), // Three dot icon
          onPressed: () {
            // Add onPressed functionality
          },
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.more_vert), // Three line icon
            onPressed: () {
              // Add onPressed functionality
            },
          ),
        ],
      ),
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color(0xFF98F5E1),
                Color(0xFFE2A9F6),
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            )
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 20),
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black,width: 2),
                borderRadius: BorderRadius.circular(20)
              ),

              child: Image.asset("assets/images/user.png",
                width: 200,
                height: 200,


              ),
            ),
            SizedBox(height: 20),
            Text(
              'John Doe', // Username
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Text(
              'john@example.com', // User email
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
            SizedBox(height: 20),
            Card(
              margin: EdgeInsets.symmetric(horizontal: 50),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              color: Color(0xFFE2A9F6), // Use the provided color for the card background
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                        child:Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0), // Adjust the value as needed
                            color: Colors.transparent, // Text field background color
                          ),
                          child: TextField(
                            decoration: InputDecoration(
                              hintText: 'Enter amount',
                              border: InputBorder.none,
                            ),
                          ),
                        )

                    ),
                    Text(
                        'Top Up',
                        style: TextStyle(color: Colors.white),
                      ),

                    Icon(Icons.chevron_right, color: Colors.white), // Arrow icon
                  ],
                ),
              ),
            ),
            SizedBox(height: 20),


          ],
        ),
      ),
    );
  }
}
