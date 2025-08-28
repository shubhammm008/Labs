//
//  AddRegistrationTableViewController.swift
//  HotelCodable
//
//  Created by Shubham Singh on 27/08/25.
//

import UIKit

class AddRegistrationTableViewController: UITableViewController,SelectRoomTypeTableViewControllerDelegate {
    var roomType:RoomType?
    var registeration:Registeration?{
        guard let roomType = roomType else {return nil}
        let firstName = firstNameTextField.text ?? ""
        let lastName = lastNameTextField.text ?? ""
        let email = emailTextField.text ?? ""
        let checkInDate = checkInDatePicker.date
        let checkOutDate = checkOutDatePicker.date
        let numberOfAdults = Int(adultStepper.value)
        let numberOfChildren = Int(childStepper.value)
        let wifi = wifiSwitch.isOn
        return(Registeration(firstName: firstName, lastName: lastName, emailAddress: email, checkInDate: checkInDate, checkOutDate: checkOutDate, numberOfAdults: numberOfAdults, numberOfChildren: numberOfChildren, wifi: wifi, roomType: roomType))
    }
    
    
    @IBAction func cancelButtonTapped(_ sender: Any) {
        dismiss(animated: true,completion: nil)
    }
    
    @IBOutlet weak var roomTypeLabel: UILabel!
    
    @IBOutlet weak var wifiSwitch: UISwitch!
    
    @IBOutlet weak var childStepper: UIStepper!
    @IBOutlet weak var adultStepper: UIStepper!
    @IBOutlet weak var childLabel: UILabel!
    @IBOutlet weak var adultsLabel: UILabel!
    
    @IBOutlet weak var checkOutDatePicker: UIDatePicker!
    @IBOutlet weak var checkOutDateLabel: UILabel!
    @IBOutlet weak var checkInDateLabel: UILabel!
    @IBOutlet weak var checkInDatePicker: UIDatePicker!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!
    @IBOutlet weak var firstNameTextField: UITextField!
    
    let checkInDatePickerCellIndexPath = IndexPath(row: 1, section: 1)
    let checkOutDatePickerCellIndexPath = IndexPath(row: 3, section: 1)
   
    let checkInDateLabelIndexPath=IndexPath(row: 0, section: 1)
    let checkOutDateLabelIndexPath=IndexPath(row: 2, section: 1)
    
    @IBSegueAction func selectRoomType(_ coder: NSCoder) -> SelectRoomTypeTableViewController? {
        let dest = SelectRoomTypeTableViewController(coder: coder)
        dest?.delegate=self
        dest?.roomType=roomType
        return dest
    }
    
    func selectRoomTypeTableViewController(_ controller:SelectRoomTypeTableViewController,didSelect roomType:RoomType)
    {
        self.roomType=roomType
        updateRoomType()
    }
    func updateNumberOfGuests(){
        adultsLabel.text = "\(Int(adultStepper.value))"
        childLabel.text="\(Int(childStepper.value))"
    }
    
    @IBAction func stepperValueChanged(_ sender: Any) {
        updateNumberOfGuests()
    }
    var isCheckInDatePickerVisible:Bool = false{
        didSet{
            checkInDatePicker.isHidden = !isCheckInDatePickerVisible
        }
    }
    var isCheckOutDatePickerVisible:Bool = false {
        didSet{
            checkOutDatePicker.isHidden = !isCheckOutDatePickerVisible
        }
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        if indexPath == checkInDateLabelIndexPath && isCheckOutDatePickerVisible == false{
            isCheckInDatePickerVisible.toggle()
        }
        else if indexPath == checkOutDateLabelIndexPath && isCheckInDatePickerVisible==false {
            isCheckOutDatePickerVisible.toggle()
        }
        else if indexPath == checkInDateLabelIndexPath || indexPath==checkOutDateLabelIndexPath{
            isCheckInDatePickerVisible.toggle()
            isCheckOutDatePickerVisible.toggle()
        }
        else{
            return
        }
        tableView.beginUpdates()
        tableView.endUpdates()
    }
    
    
    @IBAction func wifiSwitchChanged(_ sender: Any){
        
    }
    func updateRoomType(){
        if let roomType =  roomType{
            roomTypeLabel.text = roomType.name
        }
        else{
            roomTypeLabel.text =  "not set "
        }
    }
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath{
        case checkInDatePickerCellIndexPath where isCheckInDatePickerVisible == false:
            return 0
        case checkOutDatePickerCellIndexPath where isCheckOutDatePickerVisible ==  false:
            return 0
        default:
            return UITableView.automaticDimension
        }
    }
    override func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath{
        case checkInDatePickerCellIndexPath:
            return 190
        case checkOutDatePickerCellIndexPath:
            return 190
        default:
            return UITableView.automaticDimension
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        let midnightToday = Calendar.current.startOfDay(for: Date())
        checkInDatePicker.minimumDate = midnightToday
        checkInDatePicker.date = midnightToday
        updateDateViews()
        updateRoomType()
        updateNumberOfGuests()
    }
    
    @IBAction func datePickerValueChanged(_ sender: UIDatePicker) {
        updateDateViews()
    }
    func updateDateViews(){
        checkOutDatePicker.minimumDate =  Calendar.current.date(byAdding: .day , value: 1, to: checkInDatePicker.date)
        checkInDateLabel.text = checkInDatePicker.date.formatted(date: .abbreviated, time: .omitted)
        checkOutDateLabel.text =  checkOutDatePicker.date.formatted(date: .abbreviated, time: .omitted)
    }
}
