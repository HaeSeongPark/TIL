import Foundation

struct HugeLadderGame{
    struct LadderPlayer{
        var name = ""
    }
    
    struct InputView {
        static func readHeight() -> Int {
            print("사다리 높이를 입력해주세요.")
            let height = readLine() ?? ""
            return Int(height) ?? 0
        }
        
        static func readPlayerNames() -> [String] {
            print("참여할 사람 이름을 입력하세요")
            let players = readLine() ?? ""
            return players.split(separator:",").map{String($0)}
        }
    }
    
    var height = 0
    var players = [LadderPlayer]()
    var ladders = [[Int]]()
    
    mutating func run(){
        self.height = InputView.readHeight()
        let names = InputView.readPlayerNames()
        self.players = names.map({LadderPlayer(name:$0)})
        generateLaddrs()
        printLadders()
    }
    
    mutating func generateLaddrs(){
        for row in 0..<height{
            ladders.append([Int]())
            for _ in 0..<players.count{
                let hasStep = Int(arc4random_uniform(2))
                ladders[row].append(hasStep)
            }
        }
    }
    
    func printLadders(){
        for row in ladders {
            print("|", terminator:"")
            for step in row {
                if step==1 {
                    print("---", "|", separator:"", terminator:"")
                }
                else {
                    print("---", "|", separator:"", terminator:"")
                }
            }
            print()
        }
    }
}

var game = HugeLadderGame()
game.run()

