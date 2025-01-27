import UIKit

class ViewController: UIViewController {
    
    // MARK: Outlets
    @IBOutlet weak var resultTextField: UILabel!
    
    // MARK: - Properties
    var isTypingNumber = false
    var firstNumber: Double = 0
    var operation: String?
    var operationWasPressed: Bool = false
    
    // MARK: - Actions
    @IBAction func numberPressed(_ sender: UIButton) {
        
        if let number = sender.titleLabel?.text {
            
            if isTypingNumber {
                resultTextField.text = resultTextField.text! + number
                
            } else {
                resultTextField.text = number
                isTypingNumber = true
            }
            
        }
    }
    
    @IBAction func operationPressed(_ sender: UIButton) {
        
        if let operationSign = sender.titleLabel?.text {
            
            if let number = Double(resultTextField.text!) {
                
                if operationWasPressed {
                    
                    if let currentOperation = operation {
                        
                        switch currentOperation {
                        case "+":
                            firstNumber += number
                        case "-":
                            firstNumber -= number
                        case "×":
                            firstNumber *= number
                        case "÷":
                            firstNumber /= number
                        default:
                            firstNumber = number
                        }
                    }
                }
                
                firstNumber = number
                operation = operationSign
                isTypingNumber = false
                operationWasPressed = true
                
            }
        }
    }
    
    @IBAction func equalPressed(_ sender: UIButton) {
        
        if let number = Double(resultTextField.text!) {
            
            if let currentOperation = operation {
                
                switch currentOperation {
                case "+":
                    resultTextField.text = String(firstNumber + number)
                case "-":
                    resultTextField.text = String(firstNumber - number)
                case "×":
                    resultTextField.text = String(firstNumber * number)
                case "÷":
                    resultTextField.text = String(firstNumber / number)
                default:
                    resultTextField.text = String(number)
                }
                
                isTypingNumber = false
                operationWasPressed = false
                
            } }
    }
    
    @IBAction func clearPressed(_ sender: UIButton) {
        resultTextField.text = "0"
        firstNumber = 0
        operation = nil
        isTypingNumber = false
        operationWasPressed = false
    }
}
