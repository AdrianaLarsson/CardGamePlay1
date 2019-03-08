//
//  ViewController.swift
//  CardGamePlay
//
//  Created by Adriana Pedroza Larsson on 2019-03-08.
//  Copyright © 2019 Adriana Pedroza Larsson. All rights reserved.
//

import UIKit
import AVFoundation

var audioPlayer : AVAudioPlayer!

let cardArray = ["questionmark.png","2heart.png","3heart.png","4heart.png","5heart.png","6heart.png","7heart.png","8heart.png","9heart.png","10heart.png"]

 var cardIndex = 0

var points = 0
var higher = 9
var lower = 0
var userguess : Int = 0

class ViewController: UIViewController {
    
    @IBOutlet weak var cardImageView: UIImageView!
    
    @IBOutlet weak var labelPoints: UILabel!
    
    @IBOutlet weak var guessTextField: UITextField!
    
    @IBOutlet weak var outletHigherbutton: UIButton!
    
    @IBOutlet weak var outletLowerButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
       
        showQuestionImage()
        bordershadow()
        
    }

    
    @IBAction func lowerButton(_ sender: UIButton) {
        
        flipCardChange()
        flipCardleftLower()
        countPoints()
    }
    
    
    
    @IBAction func higherButton(_ sender: UIButton) {
        
        flipCardChange()
        flipCardRightHigher()
        countPoints()
        
    }
    
    
    //this function radomize the images fom the array, card images who shows in the ImageView

    @IBAction func flipCardButoon(_ sender: UIButton) {
        
        
        buttonFlipcardTop()
        flipCardChange()
       
      showQuestionImage()
        countPoints()
         playSound("Swish")
        userGuess()
    }
    
    func flipCardChange(){
        
        
        cardIndex = Int.random(in: 0 ... 9)
        
        
        cardImageView.image = UIImage(named: cardArray[cardIndex])
        
    }
    
    //functions who shows index image questionmark
    func showQuestionImage(){
        
        if cardIndex == 8
        {
            //  cardViewOutlet.setImage(#imageLiteral(resourceName: "questionmark"), for: .normal)
            
            
            
            cardImageView.image = UIImage(named: cardArray[0])
            
            
            
        }
        
        
        
    }
    
    
    //function who rotate the card when the user cliks on button flip card. and flip the card from top
    func buttonFlipcardTop()
    {
        UIView.animate(withDuration: 6.9) {
            self.cardImageView.transform = CGAffineTransform(rotationAngle: 110)
            
        }
        
        UIView.transition(with: cardImageView, duration: 0.8, options: .transitionFlipFromTop, animations: nil, completion: nil)
        
    }
    
    //this function and sound when user cliks on flipbutton a swish sound comes on
    func playSound(_ sound: String)
    {
        let soundURL = Bundle.main.url(forResource: sound, withExtension: "mp3")
        do {
            
            audioPlayer = try AVAudioPlayer(contentsOf: soundURL!)
            
        }
            
        catch{
            print(error)
            
        }
        audioPlayer.play()
    }
    
    //this function add shadow, border, radius(more rounded corners, add colors)
    func bordershadow(){
        
        
        
        
        cardImageView.layer.borderWidth = 5
        cardImageView.layer.borderColor = UIColor(white: 0.8, alpha: 0.4).cgColor
        cardImageView.layer.cornerRadius = 20.0
        cardImageView.layer.masksToBounds = true
        
        cardImageView.layer.shadowColor = UIColor.black.cgColor
        cardImageView.layer.shadowOffset = CGSize(width: 5, height: 5)
        cardImageView.layer.shadowOpacity = 1
        cardImageView.layer.shadowRadius = 20
        
        outletHigherbutton.layer.borderWidth = 1
        outletHigherbutton.layer.cornerRadius = 20.0
        outletHigherbutton.layer.masksToBounds = true
 outletHigherbutton.layer.shadowRadius = 20
        
        outletLowerButton.layer.borderWidth = 1
        outletLowerButton.layer.cornerRadius = 20.0
        outletLowerButton.layer.masksToBounds = true
    }
    
    //function who flip the card from left when the user cliks on lower button
    func flipCardleftLower(){
        
        UIView.transition(with: cardImageView, duration: 0.8, options: .transitionFlipFromLeft, animations: nil, completion: nil)
        
    }
    //function who flip the card from rigt when the user cliks on higherbutton
    func flipCardRightHigher(){
        
        UIView.transition(with: cardImageView, duration: 0.8, options: .transitionFlipFromRight, animations: nil, completion: nil)
        
    }
    
    
    //function who counts the points when the user cliks on highter and lower
    //if the user gets higher card efter the first card and cliks on higher, the user gets pionts, if not the user get minus points, and the same goes with the lower. the function do also write out the points user have
    
    func countPoints()
    {
        cardIndex += 1
        print("CardIndex \(cardIndex)")
        
        
        
        
        
        
        
        
        
        
        
        labelPoints.text = "Din poäng \(points)"
        
        
        
    }
    
    //this function add the points when the user guess in textfiled a number and guess same number as cardindex, its add 10 points to the userpoints everytime. and alert action cames up to let the user know he gets points and guess the same number
    func userGuess(){
        
        let userguess = Int(guessTextField.text!)
        
        print("Du gissa \(userguess)")
        
        if userguess == cardIndex
        {
            
            
            var samenumber =  10
            
            let alert = UIAlertController(title: "HÄRLIGT! Du gissa rätt", message: "Du fick \(samenumber) extra poäng", preferredStyle: .alert)
            
            let restartAction = UIAlertAction(title: "OK", style: .default, handler:  { (UIAlertAction) in
                
                
            })
            
            alert.addAction(restartAction)
            
            present(alert, animated: true, completion: nil)
            
            
            print("Härligt!!! Du fick  \(samenumber)")
            points += samenumber
            print(" din poäng \(points)")
            labelPoints.text = "Din poäng \(points)"
            
        }
        
        
        
    }
    
}

