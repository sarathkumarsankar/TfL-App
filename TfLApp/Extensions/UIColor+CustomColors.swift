import Foundation
import UIKit

enum TfLLine: String {
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
    static func color(for line: String) -> UIColor? {
        let id = line.replacingOccurrences(of: " ", with: "").replacingOccurrences(of: "-", with: "")
        if let tflLine = TfLLine(rawValue: id) {
            switch tflLine {
            case .overground, .londonOverground:
                return UIColor(red: 239/255, green: 123/255, blue: 16/255, alpha: 1)
            case .piccadilly:
                return UIColor(red: 0, green: 25/255, blue: 168/255, alpha: 1)
            case .bakerloo:
                return UIColor(red: 178/255, green: 99/255, blue: 19/255, alpha: 1)
            case .central:
                return UIColor(red: 220/255, green: 36/255, blue: 31/255, alpha: 1)
            case .circle:
                return UIColor(red: 255/255, green: 211/255, blue: 41/255, alpha: 1)
            case .district:
                return UIColor(red: 0, green: 125/255, blue: 50/255, alpha: 1)
            case .hammersmith, .hammersmithCity, .hammersmithAndCity:
                return UIColor(red: 244/255, green: 169/255, blue: 190/255, alpha: 1)
            case .jubilee:
                return UIColor(red: 161/255, green: 165/255, blue: 167/255, alpha: 1)
            case .metropolitan:
                return UIColor(red: 155/255, green: 0, blue: 88/255, alpha: 1)
            case .northern:
                return UIColor(red: 0, green: 0, blue: 0, alpha: 1)
            case .victoria:
                return UIColor(red: 0, green: 152/255, blue: 216/255, alpha: 1)
            case .waterlooAndCity:
                return UIColor(red: 147/255, green: 206/255, blue: 186/255, alpha: 1)
            case .tflRail:
                return UIColor(red: 0, green: 25/255, blue: 168/255, alpha: 1)
            case .dlr:
                return UIColor(red: 0, green: 175/255, blue: 173/255, alpha: 1)
            case .tram, .londonTrams:
                return UIColor(red: 0, green: 189/255, blue: 25/255, alpha: 1)
            }
        }
        
        return nil
    }
}
