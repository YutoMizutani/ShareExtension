# ShareExtension

## Dependencies

- Xcode 11
- Swift 5.1

## Installation

```sh
$ brew install mint
$ mint bootstrap -m Mintfile
$ mint run xcodegen xcodegen generate
```

## The problem

The problem has occurred using iOS Share Extension. This project has two Schemes App (iOS target) and Share (iOS Share Extension).

<img width="188" alt="screenshot 555" src="https://user-images.githubusercontent.com/22558921/72701228-eebecd80-3b91-11ea-9360-e8dc3069136f.png">

The current settings for [yonaskolb/xcodegen@2.11.0](https://github.com/yonaskolb/XcodeGen/releases/tag/2.11.0), The target was specified first target forcibly and it will be fail.

<img width="1512" alt="screenshot 558" src="https://user-images.githubusercontent.com/22558921/72701224-ee263700-3b91-11ea-91cf-ee6ed3bfa618.png">
<img width="1512" alt="screenshot 559" src="https://user-images.githubusercontent.com/22558921/72701223-ee263700-3b91-11ea-833d-b083bfc53317.png">

The expectancy, the correctly work on Share Extension that is enabled to `askForAppToLaunch = "Yes"` property on `App.xcodeproj/xcshareddata/xcschemes/Share.xcscheme`. It will display "Ask on Launch" on "Excutable" section and it worked.

<img width="280" alt="screenshot 560" src="https://user-images.githubusercontent.com/22558921/72701222-ee263700-3b91-11ea-839d-f28d773bc068.png">
<img width="1920" alt="screenshot 554" src="https://user-images.githubusercontent.com/22558921/72701229-eebecd80-3b91-11ea-95ab-1f2a99e05967.png">
<img width="1512" alt="screenshot 562" src="https://user-images.githubusercontent.com/22558921/72701220-ed8da080-3b91-11ea-95f6-ff0a2a7a738b.png">

## Solution

Replace on `Mintfile` to own fixed branch and reinstalled, the project work correctly.

```
yutomizutani/xcodegen@add-ask-on-launch-with-specified-own-package
```