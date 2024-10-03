import Foundation

extension Date {
    func convertDateToString() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyy-MM-dd"
        return dateFormatter.string(from: self)
    }
}
