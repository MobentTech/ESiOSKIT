//___FILEHEADER___

import WidgetKit
import SwiftUI
import Intents

@main
struct ___PRODUCT_MODULE_NAME___WidgetBundle: WidgetBundle {
  
  var body: some Widget {
    widgets()
  }
  
  func widgets() -> some Widget {
    if #available(iOS 16.0, *) {
      return WidgetBundleBuilder.buildBlock(
      //Add Widgets.( Example: TestWidget()
      )
    }
    else {
      return WidgetBundleBuilder.buildBlock(
        //Add Widgets.( Example: TestWidget()
      )
    }
  }
}
