// This is a generated file, do not edit!
// Generated by R.swift, see https://github.com/mac-cain13/R.swift

import Foundation
import Rswift
import UIKit

struct R {
  struct file {
    
  }
  
  struct font {
    
  }
  
  struct image {
    
  }
  
  struct nib {
    
  }
  
  struct reuseIdentifier {
    
  }
  
  struct segue {
    struct loginController {
      static let pushToRepoController: StoryboardSegueIdentifier<UIStoryboardSegue, LoginController, RepositoryController> = StoryboardSegueIdentifier(identifier: "PushToRepoController")
      static let pushToUserController: StoryboardSegueIdentifier<UIStoryboardSegue, LoginController, UserController> = StoryboardSegueIdentifier(identifier: "PushToUserController")
      
      static func pushToRepoController(segue segue: UIStoryboardSegue) -> TypedStoryboardSegueInfo<UIStoryboardSegue, LoginController, RepositoryController>? {
        return TypedStoryboardSegueInfo(segueIdentifier: R.segue.loginController.pushToRepoController, segue: segue)
      }
      
      static func pushToUserController(segue segue: UIStoryboardSegue) -> TypedStoryboardSegueInfo<UIStoryboardSegue, LoginController, UserController>? {
        return TypedStoryboardSegueInfo(segueIdentifier: R.segue.loginController.pushToUserController, segue: segue)
      }
    }
  }
  
  struct storyboard {
    static let launchScreen = _R.storyboard.launchScreen()
    static let main = _R.storyboard.main()
    
    static func launchScreen(_: Void) -> UIStoryboard {
      return UIStoryboard(resource: R.storyboard.launchScreen)
    }
    
    static func main(_: Void) -> UIStoryboard {
      return UIStoryboard(resource: R.storyboard.main)
    }
  }
}

struct _R {
  static let hostingBundle = NSBundle(identifier: "XLOrganizationIdentifier.XLProjectName")
  
  struct nib {
    
  }
  
  struct storyboard {
    struct launchScreen: StoryboardResourceWithInitialControllerType {
      typealias InitialController = UIViewController
      
      let bundle = _R.hostingBundle
      let name = "LaunchScreen"
    }
    
    struct main: StoryboardResourceWithInitialControllerType {
      typealias InitialController = UINavigationController
      
      let bundle = _R.hostingBundle
      let name = "Main"
    }
  }
}