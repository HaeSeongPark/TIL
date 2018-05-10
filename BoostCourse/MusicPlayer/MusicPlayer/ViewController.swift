 //
//  ViewController.swift
//  MusicPlayer
//
//  Created by rhino Q on 2018. 3. 30..
//  Copyright © 2018년 rhino Q. All rights reserved.
//

import UIKit
import AVFoundation
 
class ViewController: UIViewController, AVAudioPlayerDelegate {
    
    //MARK:- Properties
    var player: AVAudioPlayer!
    var timer: Timer!
    
    // MARK:- IBOutlets
    @IBOutlet weak var playPauseButton: UIButton!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var progressSlider: UISlider!
    
    // MARK: - Life Cycle functions
    override func viewDidLoad() {
        super.viewDidLoad()
        self.addViewsWithCode()
        self.initializePlayer()
    }
    
    // MARK: - custom functions
    func addViewsWithCode() {
        self.addPlayPauseButton()
        self.addTimeLabel()
        self.addProgressSlider()
    }

    func addPlayPauseButton() {
        let button: UIButton = UIButton(type: UIButtonType.custom)
        
        // 코드로 오토레이웃을 하려면 자동제야조건을 fale로 해줘야 한다.
        button.translatesAutoresizingMaskIntoConstraints = false
        
        // 현재 뷰에 버튼을 추가한다.
        self.view.addSubview(button)
        
        // 버튼이 평상시에는 play로
        button.setImage(UIImage(named: "button_play"), for: UIControlState.normal)
        
        // 선택 됐을 때는 pause로
        button.setImage(UIImage(named: "button_pause"), for: UIControlState.selected)
        
        // 버튼이 touchUpInside 됐을 때 touchUpPlayPauseButton함수를 호출한다.
        button.addTarget(self, action: #selector(self.touchUpPlayPauseButton(_:)), for: UIControlEvents.touchUpInside)
        
        // 오토레이아웃
        button.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        NSLayoutConstraint(item: button, attribute: NSLayoutAttribute.centerY, relatedBy: NSLayoutRelation.equal, toItem: self.view, attribute: NSLayoutAttribute.centerY, multiplier: 0.8, constant: 0).isActive = true
//        button.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.5).isActive = true
//        button.heightAnchor.constraint(equalTo: button.widthAnchor, multiplier: 1).isActive = true
        button.widthAnchor.constraint(equalToConstant: 200)
        button.heightAnchor.constraint(equalToConstant: 200)
        self.playPauseButton = button
    }
    
    func addTimeLabel() {
        let timeLabel: UILabel = UILabel()
        timeLabel.translatesAutoresizingMaskIntoConstraints = false
        
        self.view.addSubview(timeLabel)
        
        timeLabel.textColor = UIColor.black
        timeLabel.textAlignment = NSTextAlignment.center
        timeLabel.font = UIFont.preferredFont(forTextStyle: UIFontTextStyle.headline)
        
        timeLabel.centerXAnchor.constraint(equalTo: self.playPauseButton.centerXAnchor).isActive = true
        timeLabel.topAnchor.constraint(equalTo: self.playPauseButton.bottomAnchor, constant: 8).isActive = true

        self.timeLabel = timeLabel
        self.updateTimeLabelText(time: 0)
    }
    
    func addProgressSlider() {
        let slider: UISlider = UISlider()
        slider.translatesAutoresizingMaskIntoConstraints = false
        
        self.view.addSubview(slider)
        
        slider.minimumTrackTintColor = UIColor.red
        
        slider.addTarget(self, action: #selector(self.sliderValueChanged(_:)), for: UIControlEvents.valueChanged)
        
        let safeAreaGuide: UILayoutGuide = self.view.safeAreaLayoutGuide

        slider.centerXAnchor.constraint(equalTo: self.timeLabel.centerXAnchor).isActive = true
        slider.topAnchor.constraint(equalTo: self.timeLabel.bottomAnchor, constant: 8).isActive = true
        slider.leadingAnchor.constraint(equalTo: safeAreaGuide.leadingAnchor, constant: 16).isActive = true
        slider.trailingAnchor.constraint(equalTo: safeAreaGuide.trailingAnchor, constant: -16).isActive = true

        self.progressSlider = slider
    }
    
    // 플레이어 초기화
    func initializePlayer() {
        guard let soundAsset: NSDataAsset = NSDataAsset(name: "sound") else {
            print("음원 파일 에셋을 가져올 수 없습니다.")
            return
        }
        
        do {
            try self.player = AVAudioPlayer(data: soundAsset.data)
            self.player.delegate = self
        } catch let error as NSError {
            print("플레이어 초기화 실패")
            print("코드 : \(error.code), 메세지 : \(error.localizedDescription)")
        }
        
        
        self.progressSlider.maximumValue = Float(self.player.duration)
        self.progressSlider.minimumValue = 0
        self.progressSlider.value = Float(self.player.currentTime)
    }
    
    
    func updateTimeLabelText(time: TimeInterval) {
        let minute: Int = Int(time / 60)
        let second: Int = Int(time.truncatingRemainder(dividingBy: 60))
        let milisecond: Int = Int(time.truncatingRemainder(dividingBy: 1) * 100)
        
        let timeText : String = String(format: "%02ld:%02ld:%02ld", minute, second, milisecond)
        
        self.timeLabel.text = timeText
    }
    
    func makeAndFireTimer() {
        self.timer = Timer.scheduledTimer(withTimeInterval: 0.01, repeats: true, block: { [unowned self] (timer: Timer) in

            if self.progressSlider.isTracking { return }

            self.updateTimeLabelText(time: self.player.currentTime)
            self.progressSlider.value = Float(self.player.currentTime)
        })
        // 타이머 즉시 시작
        self.timer.fire()
    }
    
    func invalidateTimer() {
        self.timer.invalidate()
        self.timer = nil
    }
    
    // MARK:- IBActions
    @IBAction func touchUpPlayPauseButton(_ sender: UIButton) {
        sender.isSelected = !sender.isSelected
        
        if sender.isSelected {
            self.player.play()
            self.makeAndFireTimer()
        } else {
            self.player.pause()
            self.invalidateTimer()
        }
    }
    
    @IBAction func sliderValueChanged(_ sender: UISlider) {
       self.updateTimeLabelText(time: TimeInterval(sender.value))
        if sender.isTracking { return }
        self.player.currentTime = TimeInterval(sender.value)
    }
    
    
    // MARK: - AVAudioPlayerDelegate
    func audioPlayerDecodeErrorDidOccur(_ player: AVAudioPlayer, error: Error?) {
        guard let error: Error = error else {
            print("오디오 플레이어 디코드 오류발생")
            return
        }
        
        let message: String
        message = "오디오 플레이어 오류 발생 \(error.localizedDescription)"
        
        let alert: UIAlertController = UIAlertController(title: "알림", message: message, preferredStyle: UIAlertControllerStyle.alert)
        
        let okAction: UIAlertAction = UIAlertAction(title: "확인", style: UIAlertActionStyle.default) { (action: UIAlertAction) -> Void in
            
            self.dismiss(animated: true, completion: nil)
        }
        
        alert.addAction(okAction)
        self.present(alert, animated: true, completion: nil)
    }
    
    func audioPlayerDidFinishPlaying(_ player: AVAudioPlayer, successfully flag: Bool) {
        self.playPauseButton.isSelected = false
        self.progressSlider.value = 0
        self.updateTimeLabelText(time: 0)
        self.invalidateTimer()
    }
 }

