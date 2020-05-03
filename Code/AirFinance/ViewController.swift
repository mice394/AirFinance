//
//  ViewController.swift
//  AirFinance
//
//  Created by Emily Shao on 2020-04-09.
//  Copyright © 2020 InnovationChallenge. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let screenRect = CGRect(x: 0.0, y: 0.0, width: 414.5, height: 896.0)
    
    //MARK: SIGN IN PAGE VARIABLES
    let username = "janedoe123"
    let password = "password"
    var usernameField = UITextField(frame: CGRect(origin: CGPoint.zero, size: CGSize.zero))
    var passwordField = UITextField(frame: CGRect(origin: CGPoint.zero, size: CGSize.zero))
    var errorMSGField = UITextField(frame: CGRect(origin: CGPoint.zero, size: CGSize.zero))
    var signInScreenView = UIImageView(frame: CGRect(origin: CGPoint.zero, size: CGSize.zero))
    
    //MARK: ACCOUNTS PAGE VARIABLES
    let jakeTRONViewSize = CGRect(x: 0.0, y: 589.0, width: 414.0, height: 174.0)
    var jakeTRONField = UITextField(frame: CGRect(origin: CGPoint.zero, size: CGSize.zero))
    var initMSGView = UIImageView(frame: CGRect(origin: CGPoint.zero, size: CGSize.zero))
    var firstMSGView = UIImageView(frame: CGRect(origin: CGPoint.zero, size: CGSize.zero))
    var typingMSGView = UIImageView(frame: CGRect(origin: CGPoint.zero, size: CGSize.zero))
    var typingGifView = UIImageView(frame: CGRect(origin: CGPoint.zero, size: CGSize.zero))
    var finalMSGView = UIImageView(frame: CGRect(origin: CGPoint.zero, size: CGSize.zero))
    
    //MARK: BUDGET PAGE VARIABLES
    var amountRemaining = UITextField(frame: CGRect(origin: CGPoint.zero, size: CGSize.zero))
    var budgetGraph = UIImage(named: "OG CHART.png")
    var dollarAmountField = UITextField(frame: CGRect(origin: CGPoint.zero, size: CGSize.zero))
    var categoryField = UITextField(frame: CGRect(origin: CGPoint.zero, size: CGSize.zero))
    
    //MARK: LOADING SCREEN FUNCTIONS
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.isNavigationBarHidden = true
        
        let loadingScreen = UIImage(named: "loadingScreen.png")
        let loadingScreenView = UIImageView(image: loadingScreen)
        loadingScreenView.frame = screenRect
        
        let spinnerGif = UIImage.gifImageWithName("spinner")
        let spinnerGifView = UIImageView(image: spinnerGif)
        spinnerGifView.frame = CGRect(x: 160.0, y: 730.0, width: 80.0, height: 80.0)
        
        view.addSubview(loadingScreenView)
        view.addSubview(spinnerGifView)
        
        _ = Timer.scheduledTimer(withTimeInterval: 5.0, repeats: false) {
            [weak self] timer in
            self?.viewWillDisappear(false)
            self?.loadSignInScreen()
        }
    }
    
    //MARK: SIGN IN PAGE FUNCTIONS
    func loadSignInScreen() {
        let signInScreen = UIImage(named: "SignInScreen.png")
        signInScreenView = UIImageView(image: signInScreen)
        signInScreenView.frame = screenRect
        
        view.addSubview(signInScreenView)
        
        loadTextfields()
        loadSignInButton()
    }
    
    func loadSignInButton() {
        let signInButton = UIButton()
        signInButton.frame = CGRect(x: 113, y: 666, width: 185, height: 48)
        signInButton.addTarget(self, action: #selector(self.pressedSignIn), for: .touchUpInside)
        self.view.addSubview(signInButton)
    }
    
    func loadTextfields() {
        let usernameFieldSize = CGRect(x: 57, y: 470, width: 300, height: 34)
        usernameField = UITextField(frame: usernameFieldSize)
        usernameField.placeholder = "Username"
        usernameField.autocorrectionType = .no
        usernameField.autocapitalizationType = .none
        
        let passwordFieldSize = CGRect(x: 57, y: 579, width: 300, height: 34)
        passwordField = UITextField(frame: passwordFieldSize)
        passwordField.placeholder = "Password"
        passwordField.autocorrectionType = .no
        passwordField.autocapitalizationType = .none
        passwordField.isSecureTextEntry = true
        
        let errorMSGSize = CGRect(x: 57, y: 630, width: 300, height: 34)
        errorMSGField = UITextField(frame: errorMSGSize)
        errorMSGField.text = "Username/Password is incorrect"
        errorMSGField.textColor = UIColor.red
        errorMSGField.isHidden = true
        
        self.view.addSubview(usernameField)
        self.view.addSubview(passwordField)
        self.view.addSubview(errorMSGField)
    }
    
    @objc func pressedSignIn(send: UIButton!){
        if usernameField.text == username && passwordField.text == password {
            loadSpinner()
            _ = Timer.scheduledTimer(withTimeInterval: 2.0, repeats: false) {
                [weak self] timer in
                self?.viewWillDisappear(false)
                self?.loadHomePage()
            }
        } else {
            errorMSGField.isHidden = false
        }
    }
    
    //MARK: HOME PAGE SCREEN FUNCTIONS
    func loadHomePage() {
        let homepageScreen = UIImage(named: "homepageScreen.png")
        let homepageScreenView = UIImageView(image: homepageScreen)
        homepageScreenView.frame = screenRect
        
        view.addSubview(homepageScreenView)
        loadTabBarButtons()
    }
    
    //MARK: ACCOUNTS PAGE SCREEN FUNCTIONS
    func loadAccountsPage() {
        let accountspageScreen = UIImage(named: "accountsScreen.png")
        let accountspageScreenView = UIImageView(image: accountspageScreen)
        accountspageScreenView.frame = screenRect
        accountspageScreenView.contentMode = .scaleToFill
        
        view.addSubview(accountspageScreenView)
        
        loadTabBarButtons()
        loadBudgetButton()
        
        //loading Jake-TRON
        loadJakeTRONTextfield()
        loadJakeTRONSendButton()
        loadJakeTRONBubbles()
    }
    
    func loadBudgetButton() {
        let budgetButton = UIButton()
        budgetButton.frame = CGRect(x: 0, y: 391, width: 414, height: 159)
        budgetButton.addTarget(self, action: #selector(self.pressedBudget), for: .touchUpInside)
        
        self.view.addSubview(budgetButton)
    }
    
    @objc func pressedBudget(send: UIButton!){
        loadSpinner()
        _ = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: false) {
            [weak self] timer in
            self?.viewWillDisappear(false)
            self?.loadBudgetPage()
        }
    }
    
    func loadJakeTRONTextfield() {
        let jakeTRONFieldSize = CGRect(x: 20, y: 764, width: 340, height: 34)
        jakeTRONField = UITextField(frame: jakeTRONFieldSize)
        jakeTRONField.placeholder = "Ask Jake-TRON a question"
        
        self.view.addSubview(jakeTRONField)
    }
    
    func loadJakeTRONBubbles() {
        let initMSG = UIImage(named: "message0.png")
        initMSGView = UIImageView(image: initMSG)
        initMSGView.frame = jakeTRONViewSize
        initMSGView.isHidden = false
        
        let firstMSG = UIImage(named: "message1.png")
        firstMSGView = UIImageView(image: firstMSG)
        firstMSGView.frame = jakeTRONViewSize
        firstMSGView.isHidden = true
        
        let typingMSG = UIImage(named: "message2.png")
        typingMSGView = UIImageView(image: typingMSG)
        typingMSGView.frame = jakeTRONViewSize
        typingMSGView.isHidden = true
        
        let typingGif = UIImage.gifImageWithName("typing")
        typingGifView = UIImageView(image: typingGif)
        typingGifView.frame = CGRect(x: 15.0, y: 700.0, width: 83.0, height: 56.0)
        typingGifView.isHidden = true
        
        let finalMSG = UIImage(named: "message3.png")
        finalMSGView = UIImageView(image: finalMSG)
        finalMSGView.frame = jakeTRONViewSize
        finalMSGView.isHidden = true
        
        view.addSubview(initMSGView)
        view.addSubview(firstMSGView)
        view.addSubview(typingMSGView)
        view.addSubview(typingGifView)
        view.addSubview(finalMSGView)
    }
    
    func loadJakeTRONSendButton() {
        let JTsendButton = UIButton()
        JTsendButton.frame = CGRect(x: 365, y: 757, width: 46, height: 46)
        JTsendButton.addTarget(self, action: #selector(self.pressedSend), for: .touchUpInside)
        
        self.view.addSubview(JTsendButton)
    }
    
    @objc func pressedSend(send: UIButton!){
        initMSGView.isHidden = true
        firstMSGView.isHidden = false
        jakeTRONField.text = ""
        _ = Timer.scheduledTimer(withTimeInterval: 1.5, repeats: false) {
            [weak self] timer in
            print("typing")
            self?.firstMSGView.isHidden = true
            self?.typingMSGView.isHidden = false
            self?.typingGifView.isHidden = false
            _ = Timer.scheduledTimer(withTimeInterval: 1.5, repeats: false) {
                [weak self] timer in
                print("typing2")
                self?.typingMSGView.isHidden = false
                self?.typingGifView.isHidden = false
                _ = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: false) {
                    [weak self] timer in
                    print("final")
                    self?.typingMSGView.isHidden = true
                    self?.typingGifView.isHidden = true
                    self?.finalMSGView.isHidden = false
                }
            }
        }
    }
    
    //MARK: BUDGET PAGE SCREEN FUNCTIONS
    func loadBudgetPage() {
        let budgetScreen = UIImage(named: "budgetOverviewScreen.png")
        let budgetScreenView = UIImageView(image: budgetScreen)
        budgetScreenView.frame = screenRect
        budgetScreenView.contentMode = .scaleToFill
        
        view.addSubview(budgetScreenView)
        loadTabBarButtons()
        
        //loading BudgetTracker Content
        loadAmountRemainingField()
        loadAddExpenseButton()
        loadEditExpense()
        loadSetNewBudgetButton()
        loadResetBudgetButton()
        loadGraph(graphName: UIImage(named: "OG CHART.png")!)
        loadExpenseTextFields()
    }
    
    func loadAmountRemainingField() {
        let passwordFieldSize = CGRect(x: 28, y: 269, width: 359, height: 43)
        amountRemaining = UITextField(frame: passwordFieldSize)
        amountRemaining.textAlignment = .center
        amountRemaining.text = "You are $9.00 under budget for May"
        amountRemaining.font = UIFont(name: "System", size: 15.0)
        
        view.addSubview(amountRemaining)
    }

    func loadAddExpenseButton() {
        let addExpenseButton = UIButton()
        addExpenseButton.frame = CGRect(x: 12, y: 676, width: 191, height: 55)
        addExpenseButton.addTarget(self, action: #selector(self.pressedAddExpense), for: .touchUpInside)
        view.addSubview(addExpenseButton)
    }
    
    @objc func pressedAddExpense(send: UIButton!) {
        loadGraph(graphName: UIImage(named: "ADD EXP.png")!)
        amountRemaining.text = "You are at your budget for May"
        dollarAmountField.text = ""
    }
    
    func loadSetNewBudgetButton() {
        let setNewBudgetButton = UIButton()
        setNewBudgetButton.frame = CGRect(x: 215, y: 676, width: 191, height: 55)
        setNewBudgetButton.addTarget(self, action: #selector(self.pressedSetNewBudget), for: .touchUpInside)
        view.addSubview(setNewBudgetButton)
    }
    
    @objc func pressedSetNewBudget(send: UIButton!) {
        amountRemaining.text = "You are $2.00 over budget for May"
        categoryField.text = ""
    }
    
    func loadEditExpense() {
        let editExpensetButton = UIButton()
        editExpensetButton.frame = CGRect(x: 12, y: 739, width: 191, height: 55)
        editExpensetButton.addTarget(self, action: #selector(self.pressedEditExpense), for: .touchUpInside)
        view.addSubview(editExpensetButton)
    }
    
    @objc func pressedEditExpense(send: UIButton!) {
        loadGraph(graphName: UIImage(named: "EDIT EXP.png")!)
        amountRemaining.text = "You are $8.00 under budget for May"
        dollarAmountField.text = ""
    }
    
    func loadResetBudgetButton() {
        let resetBudgetButton = UIButton()
        resetBudgetButton.frame = CGRect(x: 215, y: 739, width: 191, height: 55)
        resetBudgetButton.addTarget(self, action: #selector(self.pressedResetBudget), for: .touchUpInside)
        view.addSubview(resetBudgetButton)
    }
    
    @objc func pressedResetBudget(send: UIButton!) {
        amountRemaining.text = "You are $40.00 under budget for May"
        loadGraph(graphName: UIImage(named: "RESET BUD.png")!)
    }
    
    func loadGraph(graphName: UIImage) {
        let budgetGraphView = UIImageView(image: graphName)
        budgetGraphView.frame = CGRect(x: 16, y: 397, width: 378, height: 252)
        
        view.addSubview(budgetGraphView)
    }
    
    func loadExpenseTextFields() {
        let dollarAmountFieldSize = CGRect(x: 35, y: 646, width: 137, height: 34)
        dollarAmountField = UITextField(frame: dollarAmountFieldSize)
        dollarAmountField.placeholder = "Add/Edit Expense"
        dollarAmountField.autocorrectionType = .no
        dollarAmountField.autocapitalizationType = .none
        
        let categoryFieldSize = CGRect(x: 241, y: 646, width: 137, height: 34)
        categoryField = UITextField(frame: categoryFieldSize)
        categoryField.placeholder = "Edit Budget"
        categoryField.autocorrectionType = .no
        categoryField.autocapitalizationType = .none
        
        view.addSubview(dollarAmountField)
        view.addSubview(categoryField)
    }
    
    //MARK: RESOURCES PAGE SCREEN FUNCTIONS
    func loadResourcesPage() {
        let resourcesScreen = UIImage(named: "resourcesScreen.png")
        let resourcesScreenView = UIImageView(image: resourcesScreen)
        resourcesScreenView.frame = screenRect
        resourcesScreenView.contentMode = .scaleToFill
        
        view.addSubview(resourcesScreenView)
        loadTabBarButtons()
        loadNewsArticleButton()
    }
    
    func loadNewsArticleButton() {
        let newsArticleButton = UIButton()
        newsArticleButton.frame = CGRect(x: 0.0, y: 620, width: 414, height: 84)
        newsArticleButton.addTarget(self, action: #selector(self.pressedArticle), for: .touchUpInside)
        view.addSubview(newsArticleButton)
    }
    
    @objc func pressedArticle(send: UIButton!){
        if let url = URL(string: "https://newsinteractives.cbc.ca/coronavirusbenefits/"){
            UIApplication.shared.open(url, options: [:])
        }
    }
    
    //MARK: COMMON FUNCTIONS
    func loadTabBarButtons() {
        let homeButton = UIButton()
        homeButton.frame = CGRect(x: 20, y: 806, width: 73, height: 73)
        homeButton.addTarget(self, action: #selector(self.pressedHome), for: .touchUpInside)
        
        let accountsButton = UIButton()
        accountsButton.frame = CGRect(x: 117, y: 806, width: 73, height: 73)
        accountsButton.addTarget(self, action: #selector(self.pressedAccounts), for: .touchUpInside)
        
        let resourcesButton = UIButton()
        resourcesButton.frame = CGRect(x: 221, y: 806, width: 73, height: 73)
        resourcesButton.addTarget(self, action: #selector(self.pressedResources), for: .touchUpInside)
        
        //network button not necessary
        
        self.view.addSubview(homeButton)
        self.view.addSubview(accountsButton)
        self.view.addSubview(resourcesButton)
    }
    
    @objc func pressedHome(send: UIButton!){
        loadSpinner()
        _ = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: false) {
            [weak self] timer in
            self?.viewWillDisappear(false)
            self?.loadHomePage()
        }
    }
    
    @objc func pressedAccounts(send: UIButton!){
        loadSpinner()
        _ = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: false) {
            [weak self] timer in
            self?.viewWillDisappear(false)
            self?.loadAccountsPage()
        }
    }
    
    @objc func pressedResources(send: UIButton!){
         loadSpinner()
         _ = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: false) {
             [weak self] timer in
             self?.viewWillDisappear(false)
             self?.loadResourcesPage()
         }
    }
    
    func loadSpinner() {
        let spinner = UIActivityIndicatorView(style: .large)
        spinner.color = UIColor.darkGray
        spinner.center = self.view.center
        spinner.startAnimating()
        view.addSubview(spinner)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        for view in self.view.subviews {
            view.removeFromSuperview()
        }
    }
}

