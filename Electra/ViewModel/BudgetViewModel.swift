//
//  BudgetViewModel.swift
//  Electra
//
//  Created by M Yogi Satriawan on 11/04/23.
//

import Foundation

class BudgetingViewModel: ObservableObject {
    @Published var budgetingList: [BudgetingModel] = []

    func addBudgeting(tarif: Double, biaya: Double) {
        let budgeting = BudgetingModel(
            tarif: tarif,
            biaya: biaya,
            kWh: biaya/tarif
        )
        budgetingList.append(budgeting)
    }
}
