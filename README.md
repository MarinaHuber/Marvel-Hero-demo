# Marvel-Hero-demo
iOS/Swift 5 small app with develeoper.marvel API
deployment: iOS13, xcode 11

📍 Getting Started : on develop branch


This project requires deployment target iOS13, Xcode 11, Mojave & Catalina

The following commands will download the repository, and open the desired Xcode project.
```
git clone git@github.com/MarinaHuber/Marvel-Hero-demo.git
cd Marvel-Hero-demo
open Marvel-Hero-demo.xcodeproj
pod install
```
Technologies and patterns
* Architecture flow
    * MVC+ Coordinator
* Framework added
    * CocoPods- AlamofireImage
    
    AlamofireImage - An image library including image response serializers, UIImage and UIImageView extensions, custom image filters, an auto-purging in-memory cache and a priority-based image downloading system.
* Other stuff
    * Async request .getComics
    * Generic network
    * Programatic UI in cells
    * Diffable Data Source & TableView
    * Dark/Ligt mode for iOS13
*  To FIX
    * functions that are expensive in performace
    * coordinator pattern fully impemented
    * UITableView automatic resizing cell
    * error handeling
