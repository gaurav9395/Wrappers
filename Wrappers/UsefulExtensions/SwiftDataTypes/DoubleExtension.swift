import Foundation

extension Double {
    /**
     Round the double to number of places wished.
     - parameter value: number of places needed after decimal
     - returns: Double value rounded to passed number of places after decimal
     */
    func rounded(toPlaces value: Int) -> Double {
        let multiplier = pow(10, Double(value))
        return Darwin.round(self * multiplier) / multiplier
    }
}
