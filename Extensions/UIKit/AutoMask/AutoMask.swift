//
//  AutoMask.swift
//  E-Commerce
//
//  Created by Rufat Mirza on 9.04.2021.
//  Copyright © 2021 CCI. All rights reserved.
//

import Foundation

private struct Constants {
  static let letterMaskCharacter: Character = "A"
  static let numberMaskCharacter: Character = "0"
  static let alphanumericMaskCharacter: Character = "*"
}

public struct AutoMask: Equatable {

  private let mask: String

  public var maskLength: Int {

    return self.mask.replacingOccurrences(
      of: [
        "\(Constants.letterMaskCharacter)",
        "\(Constants.numberMaskCharacter)",
        "\(Constants.alphanumericMaskCharacter)"
      ],
      with: .empty).count
  }

  public init(mask: String) {
    self.mask = mask
  }

  public static func ==(lhs: AutoMask, rhs: AutoMask) -> Bool {
    return lhs.mask == rhs.mask
  }

  public func mask(string: String?) -> String? {

    guard let string = string else { return .none }

    if string.count > mask.count {
      return .none
    }

    var formattedString: String = .empty

    var currentMaskIndex: Int = .zero
    for i in 0..<string.count {
      if currentMaskIndex >= mask.count {
        return .none
      }

      let currentCharacter = string[string.index(string.startIndex, offsetBy: i)]
      var maskCharacter = mask[mask.index(string.startIndex, offsetBy: currentMaskIndex)]

      if currentCharacter == maskCharacter {
        formattedString.append(currentCharacter)
      }
      else {
        while maskCharacter != Constants.letterMaskCharacter
          && maskCharacter != Constants.numberMaskCharacter
          && maskCharacter != Constants.alphanumericMaskCharacter {
            formattedString.append(maskCharacter)

            currentMaskIndex += 1
            maskCharacter = mask[mask.index(string.startIndex, offsetBy: currentMaskIndex)]
        }

        if maskCharacter != Constants.alphanumericMaskCharacter {
          let isValidLetter = maskCharacter == Constants.letterMaskCharacter
            && isValidLetterCharacter(currentCharacter)
          let isValidNumber = maskCharacter == Constants.numberMaskCharacter
            && isValidNumberCharacter(currentCharacter)

          if !isValidLetter && !isValidNumber {
            return .none
          }
        }

        formattedString.append(currentCharacter)
      }

      currentMaskIndex += 1
    }

    return formattedString
  }

  public func unmask(string: String) -> String {

    var unmaskedValue: String = .empty

    for character in string {
      if self.isValidLetterCharacter(character) || self.isValidNumberCharacter(character) {
        unmaskedValue.append(character)
      }
    }

    return unmaskedValue
  }

  private func isValidLetterCharacter(_ character: Character) -> Bool {

    let string = String(character)
    if string.unicodeScalars.count > 1 {
      return false
    }

    let lettersSet = NSCharacterSet.letters
    let unicodeScalars = string.unicodeScalars
    return lettersSet.contains(unicodeScalars[unicodeScalars.startIndex])
  }

  private func isValidNumberCharacter(_ character: Character) -> Bool {

    let string = String(character)
    if string.unicodeScalars.count > 1 {
      return false
    }

    let lettersSet = NSCharacterSet.decimalDigits
    let unicodeScalars = string.unicodeScalars
    return lettersSet.contains(unicodeScalars[unicodeScalars.startIndex])
  }
}
