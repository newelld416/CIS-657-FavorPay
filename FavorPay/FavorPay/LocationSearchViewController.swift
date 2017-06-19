//
//  LocationSearchViewController.swift
//  GeoCalculator
//
//  Created by Adam Luckenbaugh on 6/6/17.
//  Copyright © 2017 Adam Luckenbaugh. All rights reserved.
//


import UIKit
import Eureka
import GooglePlacePicker

class LocationSearchViewController: FormViewController {
    var location:GMSPlace?
    var date: Date?
    var selectedPoint: Int = 0
    
    var delegate: LocationSearchViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Describe our beautiful eureka form
        form = Section("Event Location Inputs")
            <<< LabelRow () { row in
                row.title = "Location"
                row.value = "Tap to search"
                row.tag = "eventLocation"
                var rules = RuleSet<String>()
                rules.add(rule: RuleClosure(closure: { (loc) -> ValidationError? in
                    if loc == "Tap to search" {
                        return ValidationError(msg: "You must select a location")
                    } else {
                        return nil
                    } }))
                row.add(ruleSet:rules)
                }.onCellSelection { cell, row in
                    // crank up Google's place picker when row is selected.
                    let autocompleteController = GMSAutocompleteViewController()
                    autocompleteController.delegate = self
                    self.selectedPoint = 0
                    self.present(autocompleteController, animated: true, completion: nil)
            }
            
            +++ Section("Event Date") <<< DateRow() { row in
                row.title = "Date"
                row.value = Date()
                row.tag = "eventDate"
                row.add(rule: RuleRequired())
        }
        let labelRowValidationUpdate : (LabelRow.Cell, LabelRow) -> () = { cell, row in
            if !row.isValid { cell.textLabel?.textColor = .red
            } else {
                cell.textLabel?.textColor = .black
            }
        }
        LabelRow.defaultCellUpdate = labelRowValidationUpdate
        LabelRow.defaultOnRowValidationChanged = labelRowValidationUpdate
        
        let cancelButton : UIBarButtonItem = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(LocationSearchViewController.cancelPressed))
        
        self.navigationItem.leftBarButtonItem = cancelButton
        
        let saveButton : UIBarButtonItem = UIBarButtonItem(title: "Save", style: .plain, target: self, action: #selector(LocationSearchViewController.savePressed))
        
        self.navigationItem.rightBarButtonItem = saveButton
        
    }
    
    func cancelPressed() {
        _ = self.navigationController?.popViewController(animated: true)
    }
    
    func savePressed() {
        let errors = self.form.validate()
        if errors.count > 0 {
            print("fix ur errors!")
        } else {
            let dateRow : DateRow! = form.rowBy(tag: "eventDate")
            self.delegate?.setDateAndLocation(date: dateRow.value! as Date, location: self.location!)
            _ = self.navigationController?.popViewController(animated: true)
        }
    }
}

protocol LocationSearchViewControllerDelegate {
    func setDateAndLocation(date:Date, location:GMSPlace)
}

extension LocationSearchViewController: GMSAutocompleteViewControllerDelegate {
    public func viewController(_ viewController: GMSAutocompleteViewController, didFailAutocompleteWithError error: Error) {
        print(error.localizedDescription)
    }
    
    // Handle the user's selection.
    func viewController(_ viewController: GMSAutocompleteViewController, didAutocompleteWith place: GMSPlace) {
        
        if self.selectedPoint == 0 {
            if let row = form.rowBy(tag: "eventLocation") as? LabelRow {
                row.value = place.name
                row.validate()
                self.location = place
            }
        }
        
        self.dismiss(animated: true, completion: nil)
    }
    
    func viewController(viewController: GMSAutocompleteViewController, didFailAutocompleteWithError error: NSError) {
        // TODO: handle the error.
        print("Error: ", error.description)
    }
    
    // User canceled the operation.
    func wasCancelled(_ viewController: GMSAutocompleteViewController){
        self.dismiss(animated: true, completion: nil)
        let row: LabelRow? = form.rowBy(tag: "Location")
        row?.validate()
    }
    
    // Turn the network activity indicator on and off again.
    func didRequestAutocompletePredictions(_ viewController: GMSAutocompleteViewController) {
        UIApplication.shared.isNetworkActivityIndicatorVisible = true
    }
    
    func didUpdateAutocompletePredictions(_ viewController: GMSAutocompleteViewController) {
        UIApplication.shared.isNetworkActivityIndicatorVisible = false
    }
}
