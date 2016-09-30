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

### Fabric

In order to use [Fabric](https://fabric.io), change the dummy keys present in the `Fabric` run script in both project's target with your keys.

### R.swift

[R.swift](https://github.com/mac-cain13/R.swift) is added to the project dependencies.
Use it to get stronged type access to the project's resources.

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

## Development

### Code-Style
Follow the [Swift Style Guide](https://github.com/xmartlabs/Swift-Style-Guide) when working on the project.

### Testing

[Nimble](https://github.com/Quick/Nimble) and [Quick](https://github.com/Quick/Quick) are added as dependencies to the tests targets.
Prefer using them instead of the native test suite provided by Xcode.

Check out the sanity specs located in `Tests` and `UITests` folders to see the simplest example using these libraries.
