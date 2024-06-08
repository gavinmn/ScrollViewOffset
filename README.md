# ScrollViewOffset

A Scroll View that reports its offset value while scrolling.

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
