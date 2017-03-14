# WWDC17Apply

![](https://img.shields.io/badge/iOS-10-brightgreen.svg) ![](https://img.shields.io/badge/Swift%20Playgrounds-1.0%20or%20later-orange.svg)

a Swift Playgrounds Project applying for WWDC17

[WWDC Scholarships](https://developer.apple.com/wwdc/scholarships/)

- Submissions will be accepted from Monday, March 27, 2017 at 10:00 a.m. PDT until Sunday, April 2, 2017 at 5:00 p.m. PDT. 
- All applicants will be notified of their status by Friday, April 21, 2017.



## Applying

- Tell us about yourself.
- Provide school / membership information.
- Upload your Swift playground.
  - Create a visually interactive scene in a Swift playground that can be experienced within three minutes. Be creative. You can use [Swift Playgrounds](https://itunes.apple.com/us/app/swift-playgrounds/id908519492?mt=8) on iPad or [Xcode](https://itunes.apple.com/us/app/xcode/id497799835?ls=1&mt=12) on macOS. If you need inspiration, start with templates in Swift Playgrounds for a head start on more advanced creations. Get inventive and make them your own by adding graphics, audio, and more.
- Describe your Swift playground.
- Provide optional information.



## Judging

- Technical accomplishment
- Creativity of ideas
- Content of written responses


## Reference

[Playground Book](https://developer.apple.com/library/prerelease/content/documentation/Xcode/Conceptual/swift_playgrounds_doc_format/index.html#//apple_ref/doc/uid/TP40017343-CH47-SW4)

[WWDC Video](https://developer.apple.com/videos/play/wwdc2016/408/)


## Project

The primary idea is to build a PlaygroundBook.

to teach the student learn something.

must with a game.

- 具体想法：
  - 力的平衡
    - User 写代码，给出合力大小和方向，否则小球移动
  - 匀加速直线运动
    - User 自定义加速度，通过模拟动画，验证不同运动方程
  - 圆周运动
    - User 自定义速度，探究满足匀速圆周运动的公式
    - 增加一个竖直加速度，探索小球在最低点的最小速度

------

- 进一步想法
  - 合力的计算，控制小球的运动，使其打中目标
  - 引力的计算
  - 圆周运动 向心力的计算
  - 黑洞

## Issues

- What's **live view**

## Notes

- Playground Book Package
  - Content Hierarchy
  - Folder Name Extensions
    - .playgroundbook
    - .playgroundchapter
    - .playgroundpage
    - .cutscenepage
  - Folders in the Package Structure
    - Contents
    - Chapters
    - Pages
  - Shared Folders
    - Resources
    - Sources
  - Specially Named Files
    - Manifest.plist
    - Contents.swift
    - LiveView.swift
- Manifest Files
  - Book Manifest
    - Chapters Key
    - ContentIdenrifier Key
    - ContentVersion Key
    - DeploymentTarget Key
    - ImageReference Key
      - .png file and in *Resources* folder
      - 4:3 image & 400*300 pixels image size
    - Name Key
    - Version Key
    - SwiftVersion Key
  - Chapter Manifest
    - Name Key
    - Page Key
  - Cutscene Page Manifest
    - CotsceneReference
    - Name
  - Playground Page Manifest
    - Hints
    - LiveViewEdgeToEdge
    - LiveViewMode
    - Name
    - PlaygroundLoggingMode
    - PosterReference
    - CodeCopySetup
- Playground Page Delimiters
  - About Page Markup Delimiters
  - Editable Areas
  - Placeholder Tokens
  - Hidden Code
  - Customized Code Completion
- Glossary
  - Glossary Property List
    - Terms
    - Term Name
  - Linking to Terms
- PlaygroundSupportModule
  - Access a playground page and manage its execution
  - Display and dismiss live views
  - Share and access persistent data
  - Send and receive messages between playgrounds and live views
  - Set and get the learning progress of the user, update hints, and show success text.
- Available Frameworks
  - math(Accelerate)
  - audio
  - video
  - image
  - Network
  - Bluetooth
  - CoreData
  - CoreFoundation
  - CoreGraphic
  - Foundation
- Revision History

### Content Hierarchy

- Yang Li's WWDC17 Apply.playgroundbook
  - Contents
    - Manifest.plist
    - Resources
      - Ball.png
    - Sources
      - PlaygroundAPI
        - .swift
      - PlaygroundInternal
        - Setup.swift
    - Chapters
      - Mechanics.playgroundchapter
        - Manifest.plist
        - Resources
        - Sources
        - Contents.swift
        - LiveView.swift
      - Mechanics.cutscenepage
        - .html
        - .hyperesources(css/js)