# XLProjectName

## Configuration

### Dependency libraries

Dependencies are managed with [CocoaPods](https://cocoapods.org/). 
You can see all the project's dependencies in the file `Podfile`.
Before starting working on the project, install the dependencies by running next command:

```shell
cd <project-dir>
pod install
```

### Swift lint

The project is configured to run [swiftlint](https://github.com/realm/SwiftLint) on each build.
Ensure to have installed swiftlint before continue.

## Project's Structure

The project folder structure follows the commonly used for MVC pattern.
Follow this structure when creating new documents:

```
XLProjectName
  ├ XLProjectName
  │   ├ Assets.xcassets
  │   │   ⌊ /* Xcode's Assets catalog */ 
  │   ├ Base.lproj
  │   │   ⌊ /* Xcode's storyboard folder */
  │   ├ Controllers
  │   │   ⌊ /* View controllers folder */
  │   ├ Helpers
  │   │   ⌊ /* Generic helper code goes here (base class extensions, view helpers, constants, etc.) */
  │   ├ Models
  │   │   ⌊ /* Add your business models here */
  │   ├ Networking
  │   │   ⌊ /* Networking related code goes here (network manager, routes definitions, token handlers, etc.) */
  │   ├ Supporting Files
  │   │   ⌊ /* Configuration files (*.plist) */ 
  │   ├ Views
  │   │   ⌊ /* UI/UX related code (view source code, xib files, etc.) */
  │   ⌊ AppDelegate.swift /* App entry point, the only file that can be in here */
  ├ Tests
  │   ⌊ /* Add unit tests here */
  ├ UITests
  │   ⌊ /* Add user interface tests here */
  ⌊ Podfile /* Specify project's dependencies here */
```
