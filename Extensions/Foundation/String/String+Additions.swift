//
//  String+Additions.swift
//  E-Commerce
//
//  Created by Rufat Mirza on 9.04.2021.
//  Copyright © 2021 CCI. All rights reserved.
//

import UIKit

public extension String {

  static let comma = ","
  static let dash = "-"
  static let dashWithSpaces = " - "
  static let dot = "."
  static let empty = ""
  static let newline = "\n"
  static let slash = "/"
  static let underscore = "_"
  static let whitespace = " "

  var ns: NSString {
    return self as NSString
  }

  /// Uses same key for font and color
  var localized: String {
    return NSLocalizedString(self, comment: .empty)
  }

  func localized(with argument: CVarArg...) -> String {
    let format = NSLocalizedString(self, comment: .empty)
    return String(format: format, arguments: argument)
  }

  var trimmed: String {
    return trimmingCharacters(in: .whitespacesAndNewlines)
  }

  init(repeating: String, count: Int) {
    let string = Array(repeating: repeating, count: count).joined(separator: .empty)
    self.init(string)
  }

  var isNotEmpty: Bool {
    return isEmpty == false
  }

  var attributed: NSAttributedString {
    return NSAttributedString(string: self)
  }

  var mutableAttributed: NSMutableAttributedString {
    return NSMutableAttributedString(string: self)
  }

  var any: AnyObject {
    return self as AnyObject
  }

  var titled: String {
    return prefix(1).capitalized + dropFirst()
  }

  /// From hex string to UIColor
  ///
  /// - Attention: Please use .color
  var hexColor: UIColor {
    return UIColor(hex: self)
  }

  func date(using formatter: DateFormatter) -> Date? {
    return formatter.date(from: self)
  }

  subscript(_ range: NSRange) -> String {
    let start = index(startIndex, offsetBy: range.lowerBound)
    let end = index(startIndex, offsetBy: range.upperBound)

    return String(self[start..<end])
  }

  func ifEmpty(_ default: @autoclosure () -> String) -> String {
    return isEmpty ? `default`() : self
  }

  func copyTo(clipboard: UIPasteboard) {
    clipboard.string = self
  }

//  func set(font: String, colorString: String) -> AttributedString {
//    return set(style: Style(font: font, color: colorString.color))
//  }

  /// Unique text which generated only with letters
  static func unique() -> String {
    let uuid = UUID().uuidString
    // G is the first character which is not used in UUID
    let unicodeDifference = UnicodeScalar("G").value - UnicodeScalar("0").value

    var unique = ""
    for character in uuid {
      if character.isLetter {
        unique.append(character)
      }
      else if character.isNumber,
              let characterUnicode = UnicodeScalar("\(character)"),
              let unicode = UnicodeScalar(characterUnicode.value + unicodeDifference) {

        unique.append(Character(unicode))
      }
    }

    return unique
  }

  private var dataFromBase64: Data? {
    return Data(base64Encoded: self, options: .ignoreUnknownCharacters)
  }

  func base64Encoded() -> String? {
    return data(using: .utf8)?.base64EncodedString()
  }

  func base64Decoded() -> String? {
    guard let data = dataFromBase64 else { return nil }
    return String(data: data, encoding: .utf8)
  }

  var fromBase64: UIImage? {
    guard let imageData = dataFromBase64 else { return nil }
    return UIImage(data: imageData)
  }

  func replacingOccurrences(of targets: [String], with replacement: String) -> String {
    var text = self
    targets.forEach { text = text.replacingOccurrences(of: $0, with: replacement) }
    return text
  }

  var uriEncoded: String? {
    return addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
  }

  var uriDecoded: String? {
    return removingPercentEncoding
  }

  var separated: [String] {
    return components(separatedBy: CharacterSet.whitespaces)
  }
}

// MARK: - UIKit

public extension String {

  func size(using font: UIFont? = .none) -> CGSize {
    var fontAttributes: [NSAttributedString.Key: Any] = [:]
    if let font = font {
      fontAttributes = [NSAttributedString.Key.font: font]
    }
    return size(withAttributes: fontAttributes).ceiled
  }
}

// MARK: - Regular Expression

public extension String {

  func groups(in regex: NSRegularExpression) -> [String] {
    var results = [String]()

    let range = NSRange(location: 0, length: count)
    let matches = regex.matches(in: self, options: [], range: range)

    guard let match = matches.first else { return results }

    let lastRangeIndex = match.numberOfRanges - 1
    guard lastRangeIndex >= 1 else { return results }

    for i in 1...lastRangeIndex {
      results.append(self[match.range(at: i)])
    }
    return results
  }

  var isBackspaceCharacter: Bool {
    let char = self.cString(using: .utf8)
    return strcmp(char, "\\b") == -92
  }
}

// MARK: - Optionals

public extension Optional where Wrapped == String {

  var emptyIfNil: Wrapped {
    return ifNil(.empty)
  }
}

// MARK: - Promiseable

extension String {

  public var font: UIFont {
    UIFont(name: self, size: 16).ifNil(UIFont())
  }

  public var image: UIImage {
    UIImage(named: self).ifNil(UIImage())
  }

  public var imageView: UIImageView {
    UIImageView(image: image)
  }
}

// MARK: - Conversion

public extension CFString {

  var string: String {
    return self as String
  }
}

// MARK: -

extension String {

  var float: Float {
    return (self as NSString).floatValue
  }

  var cgFloat: CGFloat {
    return CGFloat((self as NSString).floatValue)
  }

  var double: Double {
    return (self as NSString).doubleValue
  }

  func font(size: CGFloat) -> UIFont {
    return UIFont(name: self, size: size)!
  }

  /*
   Subscript to allow for quick String substrings ["Hello"][0...1] = "He"
   */
  subscript (r: CountableClosedRange<Int>) -> String {
    let start = index(startIndex, offsetBy: r.lowerBound)
    let end = index(startIndex, offsetBy: r.upperBound - 1)
    return String(self[start ..< end])
  }
}

// MARK: - OutletNumber_Phone

public extension String {

  func underscored(with arg: String) -> String {
    return self + .underscore + arg
  }
}

public extension String {

  var headConfigured: String {
    // swiftlint:disable line_length
    return "<head><meta name='viewport' content='width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no'></head>" + self
    // swiftlint:enable line_length
  }
}
