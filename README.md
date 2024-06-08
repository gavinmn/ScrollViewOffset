# ScrollViewOffset

ScrollViewOffset is a Swift package that provides a ScrollView with an offset callback.

## Installation

You can add ScrollViewOffset to an Xcode project by adding it as a package dependency.

1. From the **File** menu, select **Add Packages**.
2. Enter the package repository URL: `https://github.com/gavinmn/ScrollViewOffset`

Sample usage:
```swift
struct ScrollViewOffsetTest: View {
  var body: some View {
    ScrollViewWithOffset() {  //ScrollViewWithOffset(axes: .horizontal) for horizontal scrolling
      ForEach(0..<40) { _ in
        Circle()
          .frame(width: 64, height: 64)
        }
    } onScroll: { offset in
      print(offset)
    }
  }
}
```
