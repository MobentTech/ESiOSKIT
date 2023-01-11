//___FILEHEADER___

import WidgetKit
import SwiftUI
import Intents

struct ___VARIABLE_Widget___Widget: Widget {
  
  //Modify Here. Add "" to kind text
  let kind: String = ___VARIABLE_Widget___Widget

  private let supportedFamilies:[WidgetFamily] = {
    if #available(iOSApplicationExtension 16.0, *) {
      //Modify Here
      return [.systemMedium, .accessoryRectangular]
    }
    else {
      return [.systemMedium]
    }
  }()

  var body: some WidgetConfiguration {
    IntentConfiguration(kind: kind,
                        intent: ConfigurationIntent.self,
                        provider: ___VARIABLE_Widget___TimelineProvider()) { entry in
      ___VARIABLE_Widget___WidgetEntryView(entry: entry)
    }
    //Modify here. Add Localization
    .configurationDisplayName("add.localization".localized)
    .description("add.localization".localized)
    .supportedFamilies(supportedFamilies)
  }
}

struct ___VARIABLE_Widget___Widget_Previews: PreviewProvider {

  static var previews: some View {
    ___VARIABLE_Widget___WidgetEntryView(entry: ___VARIABLE_Widget___TimelineEntry(date: Date(),
                                                                                 configuration: ConfigurationIntent()))
      .previewContext(WidgetPreviewContext(family: .systemMedium))

    if #available(iOSApplicationExtension 16.0, *) {
      ___VARIABLE_Widget___WidgetEntryView(entry:  ___VARIABLE_Widget___TimelineEntry(date: Date(),
                                                                                      configuration: ConfigurationIntent()))
        .previewContext(WidgetPreviewContext(family: .accessoryRectangular))
    }
  }
}
