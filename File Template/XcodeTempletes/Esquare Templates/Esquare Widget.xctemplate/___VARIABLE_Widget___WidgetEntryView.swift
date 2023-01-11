//___FILEHEADER___

import WidgetKit
import SwiftUI
import Intents

struct ___VARIABLE_Widget___WidgetEntryView : View {
  var entry: ___VARIABLE_Widget___TimelineProvider.Entry

  @Environment(\.widgetFamily) var widgetFamily
  var body: some View {
      switch widgetFamily {
      case .accessoryRectangular:
        if !entry.isPremium {
          FreeMemberView()
        }
        else {
        }
        
      case .systemMedium:
        if !entry.isPremium  {
          ZStack {
            Color("cr-white")
            FreeMemberView()
          }
        }
        else {
        }
      default:
        Text("Default")
      }
  }
}
