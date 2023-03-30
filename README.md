# Word Cloud
![ellipse](https://drive.google.com/uc?export=view&id=1EU-mM0aG86_NO7G4seoeARUReDBw4vHQ)
**Generate and Visualize Word Cloud in Flutter**  
Show your interest in this project through ***Likes*** and ***Stars***!  
Welcome pull requests and issues!
<a href="https://www.buymeacoffee.com/rglie" target="_blank"><img src="https://cdn.buymeacoffee.com/buttons/default-orange.png" alt="Buy Me A Coffee" height="41" width="174"></a>  

## Contents
+ WordCloudData
+ WordCloudView
+ WordCloudTap
+ WordCloudTapView

## WordCloudData
To use the word cloud widget, you must set the desired data into the `WordCloudData` .  
```dart
WordCloudData mydata = WordCloudData(data: data_list);
```
Parameter `data` needs list of `Map` that have keys `word` and `value`.  
For example,
```dart
List<Map> data_list= [
  {'word': 'Apple','value': 100},
  {'word': 'Samsung','value': 60},
];
```
Another way to set the data is using instance method `addData`.  
```dart
mydata.addData(String word, Double value);
```

## WordCloudView
After setting the data, you can use the `WordCloudView` widget.
```dart
WordCloudView(
  data: mydata,
  mapwidth: 500,
  mapheight: 500,
)
```
This is the basic usage of the `WordCloudView`.  Below word cloud is result of example data set.    
![white black](https://drive.google.com/uc?export=view&id=1xc0z_mBl0YF94ECMhIkFX7UkJd1PETbW)


---
### mapcolor
```dart
WordCloudView(
  data: mydata,
  mapcolor: Color.fromARGB(255, 174, 183, 235),
  mapwidth: 500,
  mapheight: 500,
)
```
`mapcolor` set the background color of word cloud.
![black](https://drive.google.com/uc?export=view&id=1XOT6A5_G5Y5V9gkOWwYXDPGdYlXmFSbC)

  
---
### colorlist
```dart
WordCloudView(
  data: mydata,
  mapcolor: Color.fromARGB(255, 174, 183, 235),
  mapwidth: 500,
  mapheight: 500,
  colorlist: [Colors.black, Colors.redAccent, Colors.indigoAccent],
)
```
With the `colorlist` parameter, you can change word's font color. You should input list of `Color` . Word cloud will select font color ***Randomly***.  

![캡처](https://drive.google.com/uc?export=view&id=1Br7XiPwr4KRNglr61NmzSW396AGHZ4JR)

---
### shape
It is a parameter that can determine the overall shape of the Word Cloud. You must enter `WordCloudShape` as a factor.  
There are circles and ellipses in the shapes that we support to date.
```dart
WordCloudCircle(radius: <double>),
WordCloudEllipse(majoraxis: <double>, minoraxis: <double>),
```
```dart
WordCloudView(
  data: mydata,
  mapcolor: Color.fromARGB(255, 174, 183, 235),
  mapwidth: 500,
  mapheight: 500,
  shape: WordCloudCircle(radius: 250),
)
```
![Circle](https://drive.google.com/uc?export=view&id=1ICqX_vAUDoDHAHequQFHIykjT3l7UdmE)

![Circle2](https://drive.google.com/uc?export=view&id=1iS8Gm72IBvDbmEzIByHcdE5MPtFUV9j0)
```dart
WordCloudView(
  data: mydata,
  mapcolor: Color.fromARGB(255, 174, 183, 235),
  mapwidth: 500,
  mapheight: 500,
  shape: WordCloudEllipse(majoraxis: 250, minoraxis: 200),
  colorlist: [Colors.black, Colors.redAccent, Colors.indigoAccent],
)
```
![ellipse](https://drive.google.com/uc?export=view&id=1EU-mM0aG86_NO7G4seoeARUReDBw4vHQ)


---
#### fontStyle, fontWeight, fontFamily
You can change the design of the font by `fontStyle`, `fontWeight`, `fontFamily`.

#### mintextsize & maxtextsize
The value you set in `WordCloudData` does not become the font size. For proper visualization, it is necessary to adjust the ratio between value and font size of word cloud. Minimum and maximum values correspond to `mintextsize` and `maxtextsize`, and the remaining words are determined by the size in between. Initial setting of `mintextsize` and `maxtextsize` is 10 and 100.

#### decoration
Set the decoration for the container in the Word Cloud background.

#### attempt
The more this value is increased, the word cloud will try to put all the words into the map as much as possible. But it can slow down. The default value is 30.


## WordCloudTap
`WordCloudTap` and `WordCloudTapView` make the word in word cloud clickable. First, you need to define `WordCloudTap ` and set the words and functions you want to click on in `WordCloudTap`. The method that sets it up is `addWordTap`.
```dart
WordCloudTap wordtaps = WordCloudTap();

wordtaps.addWordtap(String word, Function function);
```
At this time, `word` is included in `WordCloudData`. Below is an example code using `WordCloudTap`.
```dart
WordCloudTap wordtaps = WordCloudTap();
int count = 0;
String wordstring = '';

//WordCloudTap Setting
for (int  i  =  0; i  <  data_list.length; i++) {
  void tap(){
    setState(() {
      count += 1;
      wordstring = data_list[i]['word'];
    });
  }
  wordtaps.addWordtap(data_list[i]['word'], tap);
}
```

## WordCloudTapView
If you're done setting up `WordCloudTap`, you can use it as a factor for `WordCloudTapView`.  The difference between `WordCloudView` and `WordCloudTapView` is that it requires a parameter `wordtap`. You can enter a `WordCloudTap` in `wordtap`.
```dart
WordCloudTapView(
  data:  mydata,
  wordtap:  wordtaps,
  mapcolor:  Color.fromARGB(255, 174, 183, 235),
  mapwidth:  500,
  mapheight:  500,
  colorlist: [Colors.black, Colors.redAccent, Colors.indigoAccent],
),
```
![TapView](https://drive.google.com/uc?export=view&id=1vmRJlSvcu4BxDAUzdaw3CnLlImxU5Auf)