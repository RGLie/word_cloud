# Word Cloud
Generate and Visualize Word Cloud in Flutter  
**Show your interest in this project through ***Likes*** and ***Stars***!**  
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
#### mapcolor
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
#### colorlist
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
#### fontWeight