
import UIKit

class ViewController: UIViewController {

    @IBOutlet var winnerChosenLabel: UILabel!
    @IBOutlet var teamOneTextField: UITextField!
    @IBOutlet var teamTwoTextField: UITextField!
    @IBOutlet var chooseTeamButton: UIButton!
    var teamOneCheck: Bool = false
    var teamTwoCheck: Bool = false
    
    @IBAction func chooseTeamButton(_ sender: UIButton) {
        let choices = [teamOneTextField.text, teamTwoTextField.text]
        let teamChosen = choices.randomElement()!
        winnerChosenLabel.text = "Team \(teamChosen!) goes first!"
    }
    
    @IBAction func teamOneTextChange(_ textField: UITextField) {
        if let text = textField.text, !text.isEmpty {
            teamOneCheck = true
        } else {
            teamOneCheck = false
        }
        checkIfBothTeamsEntered()
    }
    
    @IBAction func teamTwoTextChange(_ textField: UITextField) {
        if let text = textField.text, !text.isEmpty {
            teamTwoCheck = true
        } else {
            teamTwoCheck = false
        }
        checkIfBothTeamsEntered()
    }
    
    func checkIfBothTeamsEntered() {
        if teamOneCheck && teamTwoCheck {
            chooseTeamButton.isEnabled = true
            chooseTeamButton.setTitle("Randomly choose team", for: .normal)
        } else {
            chooseTeamButton.isEnabled = false
            chooseTeamButton.setTitle("Enter both team names", for: .normal)
            winnerChosenLabel.text = "Who goes first?"
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        chooseTeamButton.isEnabled = false
        chooseTeamButton.setTitle("Enter both team names", for: .normal)
        winnerChosenLabel.text = "Who goes first?"
    }


}

