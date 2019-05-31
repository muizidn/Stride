//
//  Formatter.swift
//  StrideLib
//
//  Created by pmacro on 13/03/2019.
//

import Foundation

public class SwiftFormatter {
  static public func format(file: URL,
                            languageConfiguration: LanguageConfiguration) {
    let process = Process()

    guard let swiftFormat = languageConfiguration.compilerHomeDirectory?.appendingPathComponent("/usr/bin/swift-format") else {
      return
    }

    process.executableURL = swiftFormat
    process.arguments = [file.path,
                         "-in-place",
                         "-indent-switch-case",
                         "-indent-width",
                         "2"]
    process.launch()
    process.waitUntilExit()
  }
  
  ///
  /// Formats the specified line inside `file`, returning the result.  This does not modify the file.
  ///  This function blocks.
  ///
  static func printFormat(file: URL,
                          line: Int,
                          languageConfiguration: LanguageConfiguration) -> String? {
    let process = Process()
    
    guard let swiftFormat = languageConfiguration.compilerHomeDirectory?.appendingPathComponent("/usr/bin/swift-format") else {
      return nil
    }
    
    process.executableURL = swiftFormat
    process.arguments = [file.path,
                         "-indent-switch-case",
                         "-indent-width",
                         "2"]
    
    let output = Pipe()
    process.standardOutput = output
    process.launch()
    
    let data = output.fileHandleForReading.readDataToEndOfFile()
    let fullContent = String(data: data, encoding: .utf8)
    
    let lines = fullContent?.split(separator: "\n", omittingEmptySubsequences: false)
    
    if let formattedLine = lines?[safe: line - 1] {
      return String(formattedLine)
    }
    
    return nil
  }
}
