# TakeHome-iOS-challenge
<img src= "iphone-x.png" width = 250 height = 500></img>
<img src= "iphone-8.png" width = 250 height = 500></img>
<img src= "iphone-5s.png" width = 250 height = 500></img>

### Overview 

This repository contains the challenge code for Jetfuel iOS Engineer position. Repo's contains should only be used by managers and engineers from @Jetfuel for assessment purposes.

### Time

- 13 to 14 accumulated hours

### Getting Started

Run these commands to have the full project ready on your local machine.

* `` git clone https://github.com/MediBoss/TakeHome-iOS-challenge``

* `` cd TakeHome-iOS-challenge/JetfuelTakeHome``

* `` pod install `` or ``pod update`` if you don't have the latest version.

* Open the ``JetfuelTakeHome.xcworkspace`` file to run on Xcode

### Debugging Note

If you get a "The sandobox is not in sync with the podfile.lock...", follow these simple steps:

* On Xcode's navigation pane, click on "JetfuelTakeHome" project(with the blue xcode logo)
* Go under the info tab, you will see a configurations dropdown.
* Click on the debug dropdown -> You will see a dart target symbol next to JetfuelTakeHome.
* change the value from ``none`` to ``Pods-JetfuelTakeHome.debug``.

### Built with

* Swift 5.0 - Main language
* Xcode 10.0 - Main IDE
* SDWebImage - Image downloading & caching


### File/Folder Architecture

I followed the MVC architecure for this project. 
```
root/
|
|
|-- JetfuelTakeHome/
        |-- JetfuelTakeHome
                |-- Model              
                |-- View                    
                |-- Controller             
                |-- Networking  
                |-- Supporting Files
                |-- Extensions               
                |-- Info.plist          
        |-- Podfile
        |-- .gitignore
        |-- Podfile.lock  
|
|-- Screenshots/                                                   
|-- README.md                          

```

### Challenges

* Playing video of selected media since the URL had tokens in it
* Laying out the two buttons(link & cell) with proper assets and right resolution
