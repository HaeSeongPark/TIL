//extension Double{
//    var cm:Double { return self }
//    var cmSymbole:String { return "cm"}
//
//}
//print("\(1.cm)\(1.cmSymbole)", terminator:"")
//
//protocol LengthProtocol{
//    var cm: Double { get }
//    var m: Double { get }
//}
//
//struct Length:LengthProtocol{
//    var  cm:Double { return self }
//    var m:Double { return self }
//}


/*
 extension Double {
 var km: Double { return self * 1_000.0 }
 var m: Double { return self }
 var cm: Double { return self / 100.0 }
 var mm: Double { return self / 1_000.0 }
 var ft: Double { return self / 3.28084 }
 }
 */
struct Matrix {
    let rows: Int, columns: Int
    var grid: [Double]
    init(rows: Int, columns: Int) {
        self.rows = rows
        self.columns = columns
        grid = Array(repeating: 0.0, count: rows * columns)
    }
    func indexIsValidForRow(row: Int, column: Int) -> Bool {
        return row >= 0 && row < rows && column >= 0 && column < columns
    }
    subscript(row: Int, column: Int) -> Double {
        get {
            assert(indexIsValidForRow(row: row, column: column), "Index out of range")
            return grid[(row * columns) + column]
        }
        set {
            assert(indexIsValidForRow(row: row, column: column), "Index out of range")
            grid[(row * columns) + column] = newValue
        }
    }
}


var matrix = Matrix(rows: 2, columns: 2)
print(matrix)
//matrix[2,2] = 1.5
matrix[1,0] = 3.2
print(matrix)
