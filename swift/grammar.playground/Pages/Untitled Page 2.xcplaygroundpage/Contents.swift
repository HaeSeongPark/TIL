
var asdf = Array(repeating: Array(repeating: false, count: 2), count: 5)
for row in asdf {
    print("|", terminator: "")
    for col in row {
        if col == true {
            print("-", terminator: "")
        } else {
            print("+|", terminator: "")
        }
    }
}
