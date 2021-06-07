import AVFoundation

let BgSound = "bgsound.mp3"
let EffectSound = "effect.mp3"
let ChartSound = "chartEffect.mp3"
let AudioFiles = [BgSound, EffectSound, ChartSound]

class AudioController{
    private var audio = [String: AVAudioPlayer]()
    
    var player: AVAudioPlayer?
    
    func preloadAudioEffects(audioFileNames: [String]){
        for effect in AudioFiles{
            let soundPath = Bundle.main.path(forResource: effect, ofType: nil)
            let soundURL = NSURL.fileURL(withPath: soundPath!)
            
            do{
                player = try AVAudioPlayer(contentsOf: soundURL)
                guard let player = player else{
                    return
                }
                player.numberOfLoops = 0
                player.prepareToPlay()
                audio[effect] = player
            }
            catch let error{
                print(error.localizedDescription)
            }
        }
    }
    
    func preloadAudioBg(audioFileNames: [String]){
        for effect in AudioFiles{
            let soundPath = Bundle.main.path(forResource: effect, ofType: nil)
            let soundURL = NSURL.fileURL(withPath: soundPath!)
            
            do{
                player = try AVAudioPlayer(contentsOf: soundURL)
                guard let player = player else{
                    return
                }
                player.numberOfLoops = -1
                player.prepareToPlay()
                audio[effect] = player
            }
            catch let error{
                print(error.localizedDescription)
            }
        }
    }
    
    func playerBg(name: String){
        if let player = audio[name]{
            if OptionTableViewController.sound == true {
                if player.isPlaying{
                    player.currentTime = 0
                }
                else{
                    player.currentTime = 0
                    player.play()
                }
            }
            else{
                player.stop()
            }
        }
    }
    
    func playerEffect(name: String){
        if let player = audio[name]{
            if player.isPlaying{
                player.currentTime = 0
            }
            else{
                player.currentTime = 0
                player.play()
            }
        }
    }
}
