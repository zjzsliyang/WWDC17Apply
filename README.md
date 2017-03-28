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


## Idea

- build a PlaygroundBook to teach students some physical knowledge
- better within games


- Implements
  - 重力(比萨斜塔实验)
  - 万有引力(火箭、月球绕地运动)
  - 最速降线
  - 单摆(傅科摆)
  - 弹性碰撞

## Project

- Chapters 
  - Physical.playgroundchapter
    - Pages
      - [ ] Freefall(自由落体)
      - [x] Brachistochrone(最速降线)
      - [x] CircularMotion(圆周运动)
      - [ ] Pendulum(单摆)
      - [ ] ElasticCollision(弹性碰撞)
- Tutorial
  - cosmic velocity
    - V = 7.9km/s
  - brachistochrone






术语表：

- 宇宙速度cosmic velocity
  - First cosmic velocity
  - 开普勒行星运动三定律
  - 牛顿大炮Newton's cannonball
  - https://zh.wikipedia.org/wiki/%E7%89%9B%E9%A1%BF%E5%A4%A7%E7%82%AE
- 最速降线问题Brachistochrone Problem
  - 即[希腊语](https://zh.wikipedia.org/wiki/%E5%B8%8C%E8%87%98%E8%AA%9E)中的“最短”（brochistos）和“[时间](https://zh.wikipedia.org/wiki/%E6%99%82%E9%96%93)”（chronos）。这条线段就是[摆线](https://zh.wikipedia.org/wiki/%E6%91%86%E7%BA%BF)，可以用[变分学](https://zh.wikipedia.org/wiki/%E8%AE%8A%E5%88%86%E5%AD%B8)证明
  - 在[重力作用](https://zh.wikipedia.org/wiki/%E4%B8%87%E6%9C%89%E5%BC%95%E5%8A%9B)且忽略[摩擦力](https://zh.wikipedia.org/wiki/%E6%91%A9%E6%93%A6%E5%8A%9B)的情况下，一个[质点](https://zh.wikipedia.org/wiki/%E8%B3%AA%E9%BB%9E)在一点*A*以[速率](https://zh.wikipedia.org/wiki/%E9%80%9F%E7%8E%87)为零开始，沿某条[曲线](https://zh.wikipedia.org/wiki/%E6%9B%B2%E7%BA%BF)，去到一点不高于*A*的*B*，怎样的曲线能令所需的时间最短呢？这就是**最速降线问题**，又称**最短时间问题**、**最速落径问题**
  - 历史：1638年，[伽利略](https://zh.wikipedia.org/wiki/%E4%BC%BD%E5%88%A9%E7%95%A5)在《论两种新科学》中以为此线是圆弧。[约翰·伯努利](https://zh.wikipedia.org/wiki/%E7%BA%A6%E7%BF%B0%C2%B7%E4%BC%AF%E5%8A%AA%E5%88%A9)参考之前分析过的[等时降落轨迹](https://zh.wikipedia.org/wiki/%E7%AD%89%E6%97%B6%E9%99%8D%E8%90%BD%E9%97%AE%E9%A2%98)，证明了此线是[摆线](https://zh.wikipedia.org/wiki/%E6%91%86%E7%BA%BF)，并在1696年6月的《[博学通报](https://zh.wikipedia.org/w/index.php?title=%E5%8D%9A%E5%AD%B8%E9%80%9A%E5%A0%B1&action=edit&redlink=1)》发表。[艾萨克·牛顿](https://zh.wikipedia.org/wiki/%E8%89%BE%E8%96%A9%E5%85%8B%C2%B7%E7%89%9B%E9%A0%93)、[雅各布·伯努利](https://zh.wikipedia.org/wiki/%E9%9B%85%E5%90%84%E5%B8%83%C2%B7%E4%BC%AF%E5%8A%AA%E5%88%A9)、[莱布尼兹](https://zh.wikipedia.org/wiki/%E8%90%8A%E5%B8%83%E5%B0%BC%E8%8C%B2)和[洛必达](https://zh.wikipedia.org/wiki/%E6%B4%9B%E5%BF%85%E9%81%94)都得出同一结论，即正确的答案应该是摆线的一段。事实上，[约翰·伯努利](https://zh.wikipedia.org/wiki/%E7%BA%A6%E7%BF%B0%C2%B7%E4%BC%AF%E5%8A%AA%E5%88%A9)当时找到的证明方法是错误的。而正确的证法是由他的哥哥[雅各布](https://zh.wikipedia.org/wiki/%E9%9B%85%E5%90%84%E5%B8%83%C2%B7%E4%BC%AF%E5%8A%AA%E5%88%A9)发现的，在他发现以后，[伯努利](https://zh.wikipedia.org/wiki/%E4%BC%AF%E5%8A%AA%E5%88%A9)则将其据为己有。除了洛必达的解外，其他人的解都在1697年5月的《[博学通报](https://zh.wikipedia.org/w/index.php?title=%E5%8D%9A%E5%AD%B8%E9%80%9A%E5%A0%B1&action=edit&redlink=1)》出现。
  - Snell折射定律
  - https://www.zhihu.com/question/39494645


Todo:

CM

- 火箭默认不转
- 速度错误的提示
- 手势识别 更改视图