import Foundation

protocol LadderRunnable {
    func ladderHeight() -> Int
    func playerNames() -> [String]
}

struct InputView{
    static func readHeight() -> Int {
        print("사다리 높이를 입력해주세요.")
        let height = readLine() ?? ""
        return Int(height) ?? 0
    }
    
    static func readPlayerNames() -> [String] {
        print("참여할 사람 이름을 입력하세요")
        let players = readLine() ?? ""
        return players.split(separator: ",").map{String($0)}
    }
}

struct GameInfo : LadderRunnable {
    private var height : Int
    private var names : [String]
    
    init(height: Int, names: [String]) {
        self.height = height
        self.names = names
    }
    
    func ladderHeight() -> Int {
        return height
    }
    
    func playerNames() -> [String] {
        return names
    }
}

struct LadderPlayer{
    var name = ""
}

struct LadderGenerater {
    static func generateLadders(runner: LadderRunnable) -> [[Int]]{
        var ladders = [[Int]]()
        let names = runner.playerNames()
        let players = names.map({LadderPlayer(name:$0)})
        
        for row in 0..<runner.ladderHeight(){
            ladders.append([Int]())
            for _ in 0..<players.count{
                let hasStep = Int(arc4random_uniform(4))
                ladders[row].append(hasStep)
            }
        }
        
        return ladders
    }
}

struct SmallLadderGame {
    static func run(runner : LadderRunnable) {
        let ladders = LadderGenerater.generateLadders(runner:runner)
        let ladderInfo = LadderInfo(steps:ladders)
        OutputView().printLadders(printable: ladderInfo)
    }
}


protocol LadderPrintable {
    func ladders() -> [[Int]]
}
struct LadderInfo : LadderPrintable {
    private var ladderSteps: [[Int]]
    
    func ladders() -> [[Int]] {
        return ladderSteps
    }
    
    init(steps: [[Int]]) {
        self.ladderSteps = steps
    }
}

struct OutputView {
    func printLadders(printable: LadderPrintable) {
        for row in printable.ladders() {
            print("|", terminator:"")
            for step in row {
                switch step {
                case 1:
                    print("---", "|", separator:"", terminator:"")
                case 2:
                    print("--\\", "|", separator:"", terminator:"")
                case 3:
                    print("/--", "|", separator:"", terminator:"")
                default:
                    print("   ", "|", separator:"", terminator:"")
                }
            }
            print()
        }
    }
}

let gameInfo = GameInfo(height: InputView.readHeight(),
                        names: InputView.readPlayerNames())

struct GameInfoMock : LadderRunnable {
    func ladderHeight() -> Int {
        return 0
    }
    
    func playerNames() -> [String] {
        return ["aaaaaaaaaaaaaaaaaa"]
    }
}
SmallLadderGame.run(runner:GameInfoMock())
