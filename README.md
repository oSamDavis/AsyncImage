# AsyncImage ⛱
A mini app that demonstrates the use of swiftUI's AsyncImage



## What I learned

- From iOS15, No third party is needed to load remote images from the internet.
- To load an remote image, provide its url to the AsyncImage url paramater.
- By default, the image is assumed to have a scale of 1, change by modifying the value of the scale parameter.
- You can't apply image specific modifiers to AsyncImage. Instead, apply them to the specific image instance.
- You can replace the default grey view placeholder to your own custom image.
- You can return a view that is appropraite view for each phase by using the phase closure ctor.
- Phases include : SUCCESS, FAILURE and EMPTY
- To animate the remote image, we need to specify a transaction parameter of AsyncImage and add a transition modifier to the image

## App on iPhone 14 Simulator

[![ezgif-com-gif-maker.gif](https://i.postimg.cc/mkpkJM69/ezgif-com-gif-maker.gif)](https://postimg.cc/gLRG6wpc)
