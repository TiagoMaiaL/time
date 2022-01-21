//
//  MonthCalendar.swift
//  MonthCalendar
//
//  Created by Tiago Lopes on 05/01/22.
//

import SwiftUI

// MARK: - View

struct MonthCalendar: View {
    
    // MARK: Properties
    
    @StateObject
    var viewModel = MonthCalendarViewModel()
    
    // MARK: Body
    
    var body: some View {
        GeometryReader { proxy in
            VStack {
                Text("Time")
                    .font(.largeTitle)
                    .bold()
                    .foregroundColor(.primary)
                
                Spacer()
                
                HStack {
                    Button("Previous") {
                        viewModel.goToPreviousMonth()
                    }
                    
                    Spacer()
                    
                    Text(viewModel.monthTitle)
                        .font(.headline)
                        .foregroundColor(.primary)
                    
                    Spacer()
                    
                    Button("Next") {
                        viewModel.goToNextMonth()
                    }
                }
                .padding()
                
                VStack(spacing: 0) {
                    DaysGridHeader(titles: viewModel.weekDayTitles)
                    DaysGrid(
                        days: viewModel.days,
                        numberOfWeekDays: viewModel.numberOfWeekDays,
                        availableWidth: (proxy.size.width - 2 * Constants.horizontalPadding)
                    )
                }
                
                Spacer()
            }
        }
        .padding(Constants.horizontalPadding)
    }
}

// MARK: - Constants

fileprivate enum Constants {
    static let horizontalPadding = 16.0
}

// MARK: - Preview

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MonthCalendar()
    }
}
