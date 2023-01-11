//___FILEHEADER___

import WidgetKit
import SwiftUI

struct FreeMemberView: View {

  var body: some View {

      VStack(alignment: .center, spacing: 4) {
        //Add an image here
        Image("")
          .resizable()
          .scaledToFit()
          .frame(maxWidth: 80)
        //Add an localization here - Title
        Text("add.localization".localized)
          .font(.system(size: 16, weight: .regular, design: .default))
          .foregroundColor(Color("add color"))
          .minimumScaleFactor(0.4)
          .multilineTextAlignment(.center)
        //Add an localization here - Subtitle
        Text("add.localization".localized)
          .font(.system(size: 8, weight: .thin, design: .default))
          .foregroundColor(Color("add color"))
          .minimumScaleFactor(0.2)
          .multilineTextAlignment(.center)
      }
      .frame(maxWidth: .infinity, maxHeight: .infinity)
  }
}

// MARK: Previews

struct FreeMemberView_Previews: PreviewProvider {

  static var previews: some View {
//    __WidgetEntryView(entry: PrecipitationTimelineEntry(date: Date(), configuration: ConfigurationIntent())
//      .previewContext(WidgetPreviewContext(family: .systemMedium))
  }
}
