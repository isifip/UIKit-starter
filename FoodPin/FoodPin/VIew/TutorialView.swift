//
//  TutorialView.swift
//  FoodPin
//
//  Created by Irakli Sokhaneishvili on 01.02.22.
//

import SwiftUI

struct TutorialView: View {
    
    let pageHeadings = [
        "Create your own food guide",
        "Show your the location",
        "Discover greate restaurants"
    ]
    
    let pageSubHeadings = [
        "Pin your favorite restaurants and create your own food guide",
        "Search and locate your favorite restaurants on map",
        "Find restaurants shared by your friends and other foodies"
    ]
    
    let pageImages = ["onboarding-1", "onboarding-2", "onboarding-3"]
    
    init() {
        UIPageControl.appearance().currentPageIndicatorTintColor = .systemIndigo
        UIPageControl.appearance().pageIndicatorTintColor = .lightGray
    }
    
    var body: some View {
        TabView {
            ForEach(pageHeadings.indices) { index in
                TutorialPage(
                    image: pageImages[index],
                    heading: pageHeadings[index].uppercased(),
                    subHeading: pageSubHeadings[index])
                    .tag(index)
            }
        }
        .tabViewStyle(PageTabViewStyle(indexDisplayMode: .always))
        .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .automatic))
    }
}

struct TutorialView_Previews: PreviewProvider {
    static var previews: some View {
        TutorialView()
    }
}

struct TutorialPage: View {
    
    let image: String
    let heading: String
    let subHeading: String
    
    var body: some View {
        VStack(spacing: 70) {
            Image(image)
                .resizable()
                .scaledToFit()
            
            VStack(spacing: 10) {
                Text(heading)
                    .font(.headline)
                Text(subHeading)
                    .font(.body)
                    .foregroundColor(.secondary)
                    .multilineTextAlignment(.center)
            }
            .padding(.horizontal, 40)
            Spacer()
        }
        .padding(.top)
    }
}
