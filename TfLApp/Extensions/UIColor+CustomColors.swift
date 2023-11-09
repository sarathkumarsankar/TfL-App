import Foundation
import UIKit

enum TfLLine: String, CaseIterable {
    case overground = "overground"
    case londonOverground = "london-overground"
    case piccadilly = "piccadilly"
    case bakerloo = "bakerloo"
    case central = "central"
    case circle = "circle"
    case district = "district"
    case hammersmith = "hammersmith"
    case hammersmithCity = "hammersmithcity"
    case hammersmithAndCity = "hammersmithandcity"
    case jubilee = "jubilee"
    case metropolitan = "metropolitan"
    case northern = "northern"
    case victoria = "victoria"
    case waterlooAndCity = "waterlooandcity"
    case tflRail = "tflrail"
    case dlr = "dlr"
    case tram = "tram"
    case londonTrams = "londontrams"
}

extension UIColor {
    private struct LineColors {
        static let overgroundColor = UIColor(red: 239/255, green: 123/255, blue: 16/255, alpha: 1)
        static let piccadillyColor = UIColor(red: 0, green: 25/255, blue: 168/255, alpha: 1)
        static let bakerlooColor = UIColor(red: 178/255, green: 99/255, blue: 19/255, alpha: 1)
        static let centralColor = UIColor(red: 220/255, green: 36/255, blue: 31/255, alpha: 1)
        static let circleColor = UIColor(red: 255/255, green: 211/255, blue: 41/255, alpha: 1)
        static let districtColor = UIColor(red: 0, green: 125/255, blue: 50/255, alpha: 1)
        static let hammersmithColor = UIColor(red: 244/255, green: 169/255, blue: 190/255, alpha: 1)
        static let jubileeColor = UIColor(red: 161/255, green: 165/255, blue: 167/255, alpha: 1)
        static let metropolitanColor = UIColor(red: 155/255, green: 0, blue: 88/255, alpha: 1)
        static let northernColor = UIColor.black
        static let victoriaColor = UIColor(red: 0, green: 152/255, blue: 216/255, alpha: 1)
        static let waterlooAndCityColor = UIColor(red: 147/255, green: 206/255, blue: 186/255, alpha: 1)
        static let tflRailColor = UIColor(red: 0, green: 25/255, blue: 168/255, alpha: 1)
        static let dlrColor = UIColor(red: 0, green: 175/255, blue: 173/255, alpha: 1)
        static let tramColor = UIColor(red: 0, green: 189/255, blue: 25/255, alpha: 1)
    }

    static func color(for line: String) -> UIColor? {
        let id = line.replacingOccurrences(of: " ", with: "").replacingOccurrences(of: "-", with: "")
        
        guard let tflLine = TfLLine(rawValue: id) else {
            // providing default color blue
            return UIColor.blue
        }

        switch tflLine {
        case .overground, .londonOverground:
            return LineColors.overgroundColor
        case .piccadilly:
            return LineColors.piccadillyColor
        case .bakerloo:
            return LineColors.bakerlooColor
        case .central:
            return LineColors.centralColor
        case .circle:
            return LineColors.circleColor
        case .district:
            return LineColors.districtColor
        case .hammersmith, .hammersmithCity, .hammersmithAndCity:
            return LineColors.hammersmithColor
        case .jubilee:
            return LineColors.jubileeColor
        case .metropolitan:
            return LineColors.metropolitanColor
        case .northern:
            return LineColors.northernColor
        case .victoria:
            return LineColors.victoriaColor
        case .waterlooAndCity:
            return LineColors.waterlooAndCityColor
        case .tflRail:
            return LineColors.tflRailColor
        case .dlr:
            return LineColors.dlrColor
        case .tram, .londonTrams:
            return LineColors.tramColor
        }
    }
}
