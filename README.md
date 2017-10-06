# unifyID

How to build the project:  
Since I used CocoaPods to get SwiftKeychanWrapper, you first need to run "pod install" on the terminal in your project directory (assuming you already have CocoaPods). Once installed, you would need to open the ".xcworkspace" file. Once open, you would need to connect your iPhone (as the app will not work correctly on the simulator) and run the app on your phone. 

Further Considerations:
1. I would definitely add (if given more information) is the naming conventions of the photos. I wasn't too sure if we wanted to store the each photo with a unique key, or if we could replace them every time we pressed the button. I assumed that we could replace them.
2. The biggest issue I had with this project was that I was new to the components that were used in the app. I've never created an app that used AVFoundation or keychain wrappers before, so I definitely had to do a lot of research. I found lots of great resources (I posted the link to one that I used extensively on the top of Camera.swift)

