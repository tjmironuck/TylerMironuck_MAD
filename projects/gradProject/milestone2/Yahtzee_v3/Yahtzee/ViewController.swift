//
//  ViewController.swift
//  Yahtzee
//
//  Created by Gabriel Chapel on 11/14/17.
//  Copyright © 2017 Gabriel Chapel. All rights reserved.
//

import UIKit
var i : Int = 0

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    @IBOutlet weak var oneImage: UIButton!
    @IBOutlet weak var twoImage: UIButton!
    @IBOutlet weak var threeImage: UIButton!
    @IBOutlet weak var fourImage: UIButton!
    @IBOutlet weak var fiveImage: UIButton!
    @IBOutlet weak var selectDiceLabel: UILabel!
    @IBOutlet weak var rollDice: UIButton!
    @IBOutlet weak var rollsLeft: UILabel!
    @IBOutlet weak var turnsLeft: UILabel!
    @IBOutlet weak var scorePicker: UIPickerView!
    @IBOutlet weak var addPoints: UIButton!
    @IBOutlet weak var totalPointsLabel: UILabel!
    
    var num : Int = 0
    var num1 : Int = 1
    var num2 : Int = 2
    var num3 : Int = 3
    var num4 : Int = 4
    var num5 : Int = 5
    var select1: Bool = true
    var select2: Bool = true
    var select3: Bool = true
    var select4: Bool = true
    var select5: Bool = true
    var rolls: Int = 3
    var turns: Int = 13
    var pickerData:[String] = [String]()
    var points:[Int] = [Int]()
    var upperSec:[Int] = [0, 0, 0, 0, 0, 0]
    var lowerSec:[Int] = [0, 0, 0, 0, 0, 0, 0]
    var points2scorecard:[Int] = [Int]()
    var choices:[Int] = [Int]()
    var points2add:Int = 0
    var totalPoints:Int = 0
    var bonus:Int = 0
    
    var scoresArray: [Int] = []
    
    @IBAction func scorecardButton(_ sender: UIButton) {
        let myVC = storyboard?.instantiateViewController(withIdentifier: "SecondVC") as! SecondVC
        myVC.intArrayPassed = points2scorecard
        //myVC.intArrayPassed = scoresArray
        navigationController?.pushViewController(myVC, animated: true)
    }
    
    @IBAction func rollDiceButton(_ sender: UIButton) {
        if [select1, select2, select3, select4, select5].contains(true){ // Check that at least one die is selected
            if rolls > 0{
                rolls = rolls-1
                rollsLeft.text = String(rolls)
                if self.select1 == true{
                    rollDie(die: 1, imageName: oneImage)
                    DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                        self.num1 = self.num
                    }
                    self.select1 = false
                }
                if self.select2 == true{
                    rollDie(die: 2, imageName: twoImage)
                    DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                        self.num2 = self.num
                    }
                    self.select2 = false
                }
                if self.select3 == true{
                    rollDie(die: 3, imageName: threeImage)
                    DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                        self.num3 = self.num
                    }
                    self.select3 = false
                }
                if self.select4 == true{
                    rollDie(die: 4, imageName: fourImage)
                    DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                        self.num4 = self.num
                    }
                    self.select4 = false
                }
                if self.select5 == true{
                    rollDie(die: 5, imageName: fiveImage)
                    DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                        self.num5 = self.num
                    }
                    self.select5 = false
                }
                DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                    self.updateScores()
                    if self.rolls < 3{
                        self.selectDiceLabel.text = "Select Dice to Roll"
                    }
                }
            }else{
                let alert = UIAlertController(title: "Warning", message: "You have no rolls remaining for this turn. Please choose a score to record.", preferredStyle: UIAlertControllerStyle.alert)
                let okAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.cancel, handler: nil)
                alert.addAction(okAction)
                present(alert, animated: true, completion: nil)
            }
        }
    }
    
    func rollDie(die:Int, imageName:UIButton!){
        for i in 0 ... 10 {
            DispatchQueue.main.asyncAfter(deadline: .now() + Double(i) / 10.0) {
                self.num = Int(arc4random_uniform(6)) + 1
                imageName.setImage(UIImage(named: String(self.num)+"dark"), for: .normal)
            }
        }
    }
    
    func updateScores(){
        var dice:[Int] = [0,0,0,0,0,0]
        dice[self.num1-1] += 1
        dice[self.num2-1] += 1
        dice[self.num3-1] += 1
        dice[self.num4-1] += 1
        dice[self.num5-1] += 1
        let ones:Int = dice[0]*1
        let twos:Int = dice[1]*2
        let threes:Int = dice[2]*3
        let fours:Int = dice[3]*4
        let fives:Int = dice[4]*5
        let sixes:Int = dice[5]*6
        var threeOfAKind:Int = 0
        var fourOfAKind:Int = 0
        var fullHouse:Int = 0
        var smStrt:Int = 0
        var lgStrt:Int = 0
        var yahtzee:Int = 0
        var yahtzeeBonus:Int = 0
        let chance:Int = self.num1+self.num2+self.num3+self.num4+self.num5
        let zeroIndex1:Int = dice.index(of: 0)!
        // Large and Small Straights
        dice.remove(at: zeroIndex1)
        if dice.contains(0){
            lgStrt = 0
            let zeroIndex2:Int = dice.index(of: 0)!
            dice.remove(at: zeroIndex2)
            if dice.contains(0){
                smStrt = 0
            }else{
                if (zeroIndex1 == 0 && (zeroIndex2 == 0 || zeroIndex2 == 4)) || (zeroIndex1 == 4 && zeroIndex2 == 4){
                    smStrt = 30
                }
            }
        }else{
            if zeroIndex1 == 0 || zeroIndex1 == 5{
                lgStrt = 40
            }else if zeroIndex1 == 1 || zeroIndex1 == 4{
                smStrt = 30
            }
        }
        // Three of a kind
        if dice.contains(3){
            threeOfAKind = self.num1+self.num2+self.num3+self.num4+self.num5
            if dice.contains(2){
                fullHouse = 25
            }
        }
        // Four of a kind
        if dice.contains(4){
            threeOfAKind = self.num1+self.num2+self.num3+self.num4+self.num5
            fourOfAKind = self.num1+self.num2+self.num3+self.num4+self.num5
        }
        // Yahtzee
        if dice.contains(5){
            threeOfAKind = self.num1+self.num2+self.num3+self.num4+self.num5
            fourOfAKind = self.num1+self.num2+self.num3+self.num4+self.num5
            if yahtzee == 50{
                yahtzeeBonus += 100
            }else{
              yahtzee = 50
            }
        }
        pickerData = ["Aces (\(ones) points)",
            "Twos (\(twos) points)",
            "Threes (\(threes) points)",
            "Fours (\(fours) points)",
            "Fives (\(fives) points)",
            "Sixes (\(sixes) points)",
            "3 Of A Kind (\(threeOfAKind) points)",
            "4 Of A Kind (\(fourOfAKind) points)",
            "Full House (\(fullHouse) points)",
            "Small Straight (\(smStrt) points)",
            "Large Straight (\(lgStrt) points)",
            "Yahtzee (\(yahtzee) points)",
            "Chance (\(chance) points)"]
        points = [ones, twos, threes, fours, fives, sixes, threeOfAKind, fourOfAKind, fullHouse, smStrt, lgStrt, yahtzee, chance, yahtzeeBonus]
    }
    
    @IBAction func addPointsButton(_ sender: UIButton) {
        if rolls == 3{
            let alert = UIAlertController(title: "Warning", message: "Please roll the dice.", preferredStyle: UIAlertControllerStyle.alert)
            let okAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.cancel, handler: nil)
            alert.addAction(okAction)
            present(alert, animated: true, completion: nil)
        }else{
            let selectedRow:Int = scorePicker.selectedRow(inComponent: 0)
            if choices.contains(selectedRow){
                let alert = UIAlertController(title: "Warning", message: "You have already added this score. Please choose a different score to record.", preferredStyle: UIAlertControllerStyle.alert)
                let okAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.cancel, handler: nil)
                alert.addAction(okAction)
                present(alert, animated: true, completion: nil)
            }else{
                points2add = points[selectedRow]
                totalPoints += points2add
                if totalPoints >= 63{
                    if bonus == 0{
                        bonus = 25
                        totalPoints += bonus
                    }
                }
                if selectedRow < 6{
                    upperSec[selectedRow] = points2add
                }else{
                    lowerSec[selectedRow-6] = points2add
                }
                totalPointsLabel.text = String(totalPoints)
                points2scorecard = upperSec
                points2scorecard.append(bonus)
                points2scorecard.append(contentsOf: lowerSec)
                points2scorecard.append(points[13])
                points2scorecard.append(totalPoints)
                choices.append(selectedRow)
                turns -= 1
                turnsLeft.text = String(turns)
                if turns == 0{
                    let alert = UIAlertController(title: "Game Over", message: "Your Final Score Is \(totalPoints) Points!", preferredStyle: UIAlertControllerStyle.alert)
                    let okAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.cancel, handler: nil)
                    alert.addAction(okAction)
                    present(alert, animated: true, completion: nil)
                }else{
                    rolls = 3
                    rollsLeft.text = String(rolls)
                    oneImage.setImage(UIImage(named: String(self.num1)), for: .normal)
                    self.select1 = true
                    twoImage.setImage(UIImage(named: String(self.num2)), for: .normal)
                    self.select2 = true
                    threeImage.setImage(UIImage(named: String(self.num3)), for: .normal)
                    self.select3 = true
                    fourImage.setImage(UIImage(named: String(self.num4)), for: .normal)
                    self.select4 = true
                    fiveImage.setImage(UIImage(named: String(self.num5)), for: .normal)
                    self.select5 = true
                }
            }
        }
    }
    @IBAction func newGameButton(_ sender: UIButton) {
        num = 0
        num1 = 1
        num2 = 2
        num3 = 3
        num4 = 4
        num5 = 5
        select1 = true
        select2 = true
        select3 = true
        select4 = true
        select5 = true
        rolls = 3
        turns = 13
        pickerData = [String]()
        points = [Int]()
        choices = [Int]()
        points2add = 0
        totalPoints = 0
        bonus = 0
        
        oneImage.setImage(UIImage(named: String(self.num1)), for: .normal)
        twoImage.setImage(UIImage(named: String(self.num2)), for: .normal)
        threeImage.setImage(UIImage(named: String(self.num3)), for: .normal)
        fourImage.setImage(UIImage(named: String(self.num4)), for: .normal)
        fiveImage.setImage(UIImage(named: String(self.num5)), for: .normal)
        
        rollsLeft.text = String(rolls)
        turnsLeft.text = String(turns)
        totalPointsLabel.text = String(totalPoints)
        pickerData = ["Please roll the dice", " "," "," "," "," "," "," "," "," "," "," "," "]
        self.selectDiceLabel.text = " "
    }
    
    
    @IBAction func oneDie(_ sender: UIButton) {
        if self.select1 == true{
            oneImage.setImage(UIImage(named: "\(num1)dark"), for: .normal)
            self.select1 = false
        }else{
            oneImage.setImage(UIImage(named: String(num1)), for: .normal)
            self.select1 = true
        }
    }
    @IBAction func twoDie(_ sender: UIButton) {
        if self.select2 == true{
            twoImage.setImage(UIImage(named: "\(num2)dark"), for: .normal)
            self.select2 = false
        }else{
            twoImage.setImage(UIImage(named: String(num2)), for: .normal)
            self.select2 = true
        }
    }
    @IBAction func threeDie(_ sender: UIButton) {
        if self.select3 == true{
            threeImage.setImage(UIImage(named: "\(num3)dark"), for: .normal)
            self.select3 = false
        }else{
            threeImage.setImage(UIImage(named: String(num3)), for: .normal)
            self.select3 = true
        }
    }
    @IBAction func fourDie(_ sender: UIButton) {
        if self.select4 == true{
            fourImage.setImage(UIImage(named: "\(num4)dark"), for: .normal)
            self.select4 = false
        }else{
            fourImage.setImage(UIImage(named: String(num4)), for: .normal)
            self.select4 = true
        }
    }
    @IBAction func fiveDie(_ sender: UIButton) {
        if self.select5 == true{
            fiveImage.setImage(UIImage(named: "\(num5)dark"), for: .normal)
            self.select5 = false
        }else{
            fiveImage.setImage(UIImage(named: String(num5)), for: .normal)
            self.select5 = true
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        scoresArray = [3, 10, 12, 12, 15, 24, 35, 22, 17, 25, 30, 40, 50, 22, 100, 517]
        points2scorecard = [0, 0, 0, 0, 0, 0 ,0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
        // Do any additional setup after loading the view, typically from a nib.
        self.scorePicker.delegate = self
        self.scorePicker.dataSource = self
        pickerData = ["Please roll the dice", " "," "," "," "," "," "," "," "," "," "," "," "]
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // Picker functions
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerData.count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerData[row]
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
    }


}

