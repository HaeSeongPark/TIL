import AVFoundation
import UIKit

final class ViewController: UIViewController {
    @IBOutlet private(set) var timerLabel: UILabel!
    @IBOutlet private(set) var resetButton: UIButton!
    @IBOutlet private(set) var startStopButton: UIButton!
    
    private(set) var isTimerRunning = false
    
    private(set) var timer: Timer?
    var timerProvider:Timer.Type = Timer.self
    
    private let secondsInCycle = 120
    
    var elapsedSeconds = 0
    
    var makeSoundPlayer: (String) -> AVAudioPlayerAble = { resource in
        let warningSoundPath = Bundle.main.path(forResource: resource, ofType: "wav")!
        return try! AVAudioPlayer(contentsOf: URL(fileURLWithPath: warningSoundPath))
    }
    
    private(set) var warningSoundPlayer: AVAudioPlayerAble!
    private(set) var failureSoundPlayer: AVAudioPlayerAble!

    override func viewDidLoad() {
        super.viewDidLoad()
        timerLabel.text = remainingTime(elapsedSeconds: 0)
        resetButton.isEnabled = false
        
        warningSoundPlayer = makeSoundPlayer(SoundEffect.warning.rawValue)
        warningSoundPlayer.prepareToPlay()
                
        failureSoundPlayer = makeSoundPlayer(SoundEffect.failure.rawValue)
        failureSoundPlayer.prepareToPlay()
    }
    
    enum SoundEffect:String {
        case warning = "2166__suburban-grilla__bowl-struck"
        case failure = "32304__acclivity__shipsbell"
    }
    
    @IBAction private func startStop() {
        if !isTimerRunning {
            start()
        } else {
            stop()
        }
    }
    
    private func start() {
        isTimerRunning = true
        startStopButton.setTitle("Stop", for: .normal)
        resetButton.isEnabled = true
        startTimer()
        view.backgroundColor = .white
    }
    
    private func stop() {
        isTimerRunning = false
        startStopButton.setTitle("Start", for: .normal)
        resetButton.isEnabled = false
        
        timer?.invalidate()
        warningSoundPlayer.pause()
        warningSoundPlayer.currentTime = 0
        failureSoundPlayer.pause()
        failureSoundPlayer.currentTime = 0
    }

    @IBAction private func reset() {
        timerLabel.text = remainingTime(elapsedSeconds: 0)
        
        timer?.invalidate()
        warningSoundPlayer.pause()
        warningSoundPlayer.currentTime = 0
        failureSoundPlayer.pause()
        failureSoundPlayer.currentTime = 0
        
        startTimer()
        view.backgroundColor = .green
    }

    private func startTimer() {
        timerLabel.text = remainingTime(elapsedSeconds: 0)
        elapsedSeconds = 0
        
        timer = timerProvider.scheduledTimer(withTimeInterval: 1, repeats: true) { _ in
            self.elapsedSeconds += 1
            let remainingTime = self.remainingTime(elapsedSeconds: self.elapsedSeconds)
            if remainingTime == "0:10" {
                self.warningSoundPlayer.play()
            } else if remainingTime == "0:00" {
                self.failureSoundPlayer.play()
                self.view.backgroundColor = .red
            } else if remainingTime.first != "-" {
                self.view.backgroundColor = .white
            }
            self.timerLabel.text = remainingTime
        }
    }

    private func remainingTime(elapsedSeconds: Int) -> String {
        let remainingSeconds = self.secondsInCycle - elapsedSeconds
        let remainingMinutes = remainingSeconds / 60
        var displayMinutes = "\(remainingMinutes)"
        var displaySeconds = "\(remainingSeconds - remainingMinutes * 60)"
        var isNegative = false
        if displaySeconds.first == "-" {
            isNegative = true
            displaySeconds.removeFirst()
        }
        if isNegative {
            displayMinutes = "-" + displayMinutes
        }
        if displaySeconds.count == 1 {
            displaySeconds = "0" + displaySeconds
        }
        return "\(displayMinutes):\(displaySeconds)"
    }
}
