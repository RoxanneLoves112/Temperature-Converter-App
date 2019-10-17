//
//  TempConverter.swift
//  TempConverterApp
//
//  Created by Roxanne Zhang on 9/10/19.
//  Copyright © 2019 Roxanne Zhang. All rights reserved.
//

import Foundation

class TempConverter {
  
  public var inputTemp: Int = 0
  public var convertedTemp: Int = 0
  public var convertedTempDisplay: String = "0"
  public var tempUnits: String = "F"
  public var newUnits: String = "C"
  
  private func convertCToF(temp: Int) -> Int {
    return temp * 9/5 + 32
  }
  
  private func convertFToC(temp: Int) -> Int {
    return (temp - 32) * 5/9
  }
  
  private func tempBelowAbsoluteZeroC(temp: Int) -> Bool {
    return (temp < -273)
  }
  
  private func tempBelowAbsoluteZeroF(temp: Int) -> Bool {
    return (temp < -459)
  }
  
  public func toggleUnits() {
    if (tempUnits == "F") {
      tempUnits = "C"
      newUnits = "F"
    } else {
      tempUnits = "F"
      newUnits = "C"
    }
  }
  
  public func convert() {
    if (tempUnits == "F") {
      if tempBelowAbsoluteZeroF(temp: inputTemp) {
        convertedTempDisplay = "N/A"
      } else {
        convertedTempDisplay = String(convertFToC(temp: inputTemp))
      }
    }
    if (tempUnits == "C") {
      if tempBelowAbsoluteZeroC(temp: inputTemp) {
        convertedTempDisplay = "N/A"
      } else {
        convertedTempDisplay = String(convertCToF(temp: inputTemp))
      }
    }
  }
}
