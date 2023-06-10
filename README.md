# MagicText

[![Swift Package Manager compatible](https://img.shields.io/badge/SPM-compatible-brightgreen.svg)](https://github.com/apple/swift-package-manager)

Magic text is the perfect solution when you need to show a small amount of information in a pretty wrapper.

## Gifs
![](./charmed.gif) ![](./charmed-color.gif) ![](./bubble.gif) ![](./fantasy.gif) ![](./charmed-letter.gif) ![](./art-letter.gif)

## Installation
### [Swift Package Manager](https://swift.org/package-manager/)

Going to Xcode `File` > `Add Packages...` and add the repository by giving the URL `https://github.com/bullinnyc/MagicText`
Enjoy!

## Usage

```swift
import MagicText
```

```swift
let singleLineExampleText = "Life is like a box of chocolates, you never know what you’re gonna get."

let multiLineExampleText = """
Life is like a box
of chocolates, you never
know what you’re
gonna get.
"""

// Charmed magic text (default).
MagicView(
    text: singleLineExampleText,
    fontSize: 28
) {
    print("Animation finished")
}

// Charmed magic text with different colors.
MagicView(
    text: multiLineExampleText,
    textColors: [.red, .orange, .yellow, .green, .blue, .black],
    fontSize: 28,
    delayStart: 5
) {
    print("Animation finished")
}

// Art letter magic text.
MagicView(
    text: singleLineExampleText,
    textColors: [.black.opacity(0.7)],
    fontSize: 28,
    magicType: .artLetter
) {
    print("Animation finished")
}

// Bubble magic text.
MagicView(
    text: singleLineExampleText,
    textColors: [.black.opacity(0.7)],
    fontSize: 28,
    magicType: .bubble
) {
    print("Animation finished")
}

// Fantasy magic text.
MagicView(
    text: singleLineExampleText,
    textColors: [.black.opacity(0.7)],
    fontSize: 28,
    magicType: .fantasy
) {
    print("Animation finished")
}

// Charmed letter magic text.
MagicView(
    text: singleLineExampleText,
    textColors: [.black.opacity(0.7)],
    fontSize: 28,
    magicType: .charmedLetter(backgroundColor: .blue)
) {
    print("Animation finished")
}
```

### Sets the type of `MagicText`
**Note:** Default type is set to `charmed`. You can try other types.

```swift
.charmed
.artLetter
.bubble
.fantasy
.charmedLetter
```

## Requirements
- iOS 14.0 +
- [SwiftUI](https://developer.apple.com/xcode/swiftui/)

## License
- MagicText is distributed under the MIT License.
