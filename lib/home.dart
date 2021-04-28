import 'package:flutter/material.dart';
import 'details_page.dart';
List <ImageDetails> _images=[ImageDetails(
  imagePath: 'images/1.jpg',
  location: 'Ajmer',
  title: 'Party',
  date:  '1 January,2021'
),
  ImageDetails(
    imagePath: 'images/2.jpg',
      location: 'Ajmer',
      title: 'New Year',
      date:  '1 January,2021'
  ),
  ImageDetails(
    imagePath: 'images/3.jpg',
      location: 'Ajmer',
      title: 'New Year',
      date:  '1 January,2021'
  ),
  ImageDetails(
    imagePath: 'images/4.jpg',
      location: 'Mesra',
      title: 'Party',
      date:  '1 January,2021'
  ),
  ImageDetails(
    imagePath: 'images/5.jpg',
      location: 'Mesra',
      title: 'New Year',
      date:  '1 January,2021'
  ),
  ImageDetails(
    imagePath: 'images/6.jpg',
      location: 'Mesra',
      title: 'Movie',
      date:  '1 January,2021'
  ),
  ImageDetails(
    imagePath: 'images/7.jpg',
      location: 'Mesra',
      title: 'New Year',
      date:  '1 January,2021'
  ),
  ImageDetails(
    imagePath: 'images/8.jpg',
    location: 'New Delhi',
    title: 'Party',
    date:  '1 January,2021'
  ),
  ImageDetails(
    imagePath: 'images/9.jpg',
      location: 'New Delhi',
      title: 'Lunch',
      date:  '1 January,2021'
  ),
  ImageDetails(
    imagePath: 'images/10.jpg',
      location: 'New Delhi',
      title: 'Movie',
      date:  '1 January,2021'
  ),
  ImageDetails(
    imagePath: 'images/11.jpg',
      location: 'Mumbai',
      title: 'New Year',
      date:  '1 January,2021'
  ),
  ImageDetails(
    imagePath: 'images/12.jpg',
      location: 'Mumbai',
      title: 'Lunch',
      date:  '1 January,2021'
  ),
  ImageDetails(
    imagePath: 'images/13.jpg',
      location: 'Mumbai',
      title: 'New Year',
      date:  '1 January,2021'
  ),
  ImageDetails(
    imagePath: 'images/14.jpg',
      location: 'Singapore',
      title: 'Lunch',
      date:  '1 January,2021'
  ),
  ImageDetails(
    imagePath: 'images/15.jpg',
      location: 'Singapore',
      title: 'Movie',
      date:  '1 January,2021'
  ),
  ImageDetails(
    imagePath: 'images/16.jpg',
      location: 'Singapore',
      title: 'New Year',
      date:  '1 January,2021'
  ),];

List<ImageDetails> searchLocation = [];

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override

  @override
  void initState() {
    print('HELOO');
    searchLocation=_images;
    super.initState();
  }


  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[850],
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children:<Widget>[
            SizedBox(height: 40.0,),
            Text('ente Gallery',style:TextStyle(
            fontSize:24,
            fontWeight:FontWeight.bold,
            color: Colors.black,
            ),
            textAlign: TextAlign.center,
            ),
            SizedBox(height: 20.0,),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10,vertical: 0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                ),
              ),
             child: _searchBar(),
            ),

            Expanded(
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 20,vertical: 30),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                    ),
                  ),

                  child:  GridView.builder(gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3,crossAxisSpacing: 10),
                      itemBuilder: (context,index){
                        return searchLocation.length == 0 ? _emptyBar() : _listItem(index);
                      },itemCount: searchLocation.length),
                ),
              ),

          ]
        )
      )
    );
  }
 _emptyBar(){
   print('No data');
  return Padding(
     padding: const EdgeInsets.all(8.0),
     child: Text('No Photos found...',style:TextStyle(
      fontSize:24,
      fontWeight:FontWeight.w600,
      color: Colors.white,
    ),
      textAlign: TextAlign.center,
    ),
   );

 }


  _searchBar() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        decoration: InputDecoration(
            hintText: 'Search Location'
        ),
        onChanged: (text) {
          text = text.toLowerCase();
          setState(() {
             searchLocation = _images.where((image) {
              var noteTitle = image.location.toLowerCase();
              return noteTitle.contains(text);
            }).toList();
          });
        },
      ),
    );
  }

  _listItem(index) {
    return RawMaterialButton(onPressed: (){Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => DetailsPage(
          imagePath: searchLocation[index].imagePath,
          title: searchLocation[index].title,
          location: searchLocation[index].location,
          date: searchLocation[index].date,
          index: index,
        ),
      ),
    );},
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              image: DecorationImage(
                image: AssetImage(searchLocation[index].imagePath),
                fit: BoxFit.cover,
              )
          ),
        )
    );
  }

  


}




class ImageDetails{
  final String imagePath;
  final String location;
  final String title;
  final String date;
  ImageDetails({
    required this.imagePath,
    required this.location,
    required this.title,
     required this.date,
  });

}