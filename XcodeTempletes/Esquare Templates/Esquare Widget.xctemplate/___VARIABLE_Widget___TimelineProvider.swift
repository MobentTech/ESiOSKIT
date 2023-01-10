//___FILEHEADER___

import WidgetKit
import SwiftUI
import Intents

struct ___VARIABLE_Widget___TimelineProvider: IntentTimelineProvider {
  func placeholder(in context: Context) -> ___VARIABLE_Widget___TimelineEntry {
    ___VARIABLE_Widget___TimelineEntry(date: Date(),
                       configuration: ConfigurationIntent(),
                       isPremium: true)
  }

  func getSnapshot(for configuration: ConfigurationIntent, in context: Context, completion: @escaping (___VARIABLE_Widget___TimelineEntry) -> ()) {

    let entry = ___VARIABLE_Widget___TimelineEntry(date: Date(),
                                                   configuration: configuration,
                                                   isPremium: true)
    completion(entry)
  }

  func getTimeline(for configuration: ConfigurationIntent, in context: Context, completion: @escaping (Timeline<___VARIABLE_Widget___TimelineEntry>) -> ()) {
    
  
    //Get the data (If you are fetching it, put the downbelow code block into the success condition
    
    //7200 Second later it updates
    let nextUpdate = Date().addingTimeInterval(7200)
    let entry = ___VARIABLE_Widget___TimelineEntry(date: nextUpdate,
                                   configuration: configuration,
                                   isPremium: UserDefaults.isPremium)
    
    let timeline = Timeline(entries: [entry], policy: .atEnd)
    completion(timeline)
  }
}                              
