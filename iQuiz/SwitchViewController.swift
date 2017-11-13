//
//  SwitchViewController.swift
//  iQuiz
//
//  Created by Andrew Liu on 11/12/17.
//  Copyright © 2017 Andrew Liu. All rights reserved.
//

import UIKit

class SwitchViewController: UIViewController {
    public var data: QuestionList?
    public var isAnswer:Bool = false
    public var current = 0;
    
    @IBAction func nextBtnClicked(_ sender: Any) {
        switchViewsNext()
    }
    
    // {{## BEGIN fields ##}}
    fileprivate var questionViewController : QuestionViewController!
    fileprivate var answerViewController : AnswerViewController!
    // {{## END fields ##}}
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NSLog("loaded")
        // Do any additional setup after loading the view.
        questionBuilder()
        switchViewController(nil, to: questionViewController)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    // {{## BEGIN builders ##}}
    fileprivate func questionBuilder() {
        NSLog("Question Loaded")
        if questionViewController == nil {
            questionViewController =
                storyboard?
                    .instantiateViewController(withIdentifier: "Question")
                as! QuestionViewController
        }
        questionViewController.Prompt.text = data?.list[current].prompt
        questionViewController.question = data?.list[current]
    }
    fileprivate func answerBuilder() {
        NSLog("Answer Loaded")
        if answerViewController == nil {
            answerViewController =
                storyboard?
                    .instantiateViewController(withIdentifier: "Answer")
                as! AnswerViewController
        }
    }
    // {{## END builders ##}}
    
    // {{## BEGIN switchViewController ##}}
    fileprivate func switchViewController(_ from: UIViewController?, to: UIViewController?) {
        NSLog("called")
        if from != nil {
            from!.willMove(toParentViewController: nil)
            from!.view.removeFromSuperview()
            from!.removeFromParentViewController()
        }
        
        if to != nil {
            self.addChildViewController(to!)
            self.view.insertSubview(to!.view, at: 0)
            to!.didMove(toParentViewController: self)
        }
    }
    // {{## END switchViewController ##}}
    
    // {{## BEGIN switch-with-animation ##}}
    fileprivate func switchViewsNext() {
        UIView.beginAnimations("View Flip", context: nil)
        UIView.setAnimationDuration(0.4)
        UIView.setAnimationCurve(.easeInOut)
        
        if questionViewController != nil &&
            questionViewController?.view.superview != nil {
            answerBuilder()
            UIView.setAnimationTransition(.flipFromLeft, for: view, cache: true)
            answerViewController.view.frame = view.frame
            switchViewController(questionViewController, to: answerViewController)
        }
        else {
            questionBuilder()
            UIView.setAnimationTransition(.flipFromLeft, for: view, cache: true)
            questionViewController.view.frame = view.frame
            switchViewController(answerViewController, to: questionViewController)
        }
        UIView.commitAnimations()
    }
    // {{## END switch-with-animation ##}}

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
