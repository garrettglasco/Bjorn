import SwiftUI

import SwiftUI

/// App-wide color palette.
/// These colors are defined using RGB values (0–255 range).
/// Adjust or extend as needed for your brand theme.
public extension Color {

    /// Rich indigo base tone — great for primary backgrounds.
    static let deepIndigo = Color(
        red: 58.0 / 255.0,
        green: 12.0 / 255.0,
        blue: 163.0 / 255.0,
        opacity: 1.0
    )

    /// Bright purple accent — ideal for highlights or buttons.
    static let purpleGlow = Color(
        red: 114.0 / 255.0,
        green: 9.0 / 255.0,
        blue: 183.0 / 255.0,
        opacity: 1.0
    )

    /// Vivid electric blue — good for active states or links.
    static let electricBlue = Color(
        red: 67.0 / 255.0,
        green: 97.0 / 255.0,
        blue: 238.0 / 255.0,
        opacity: 1.0
    )

    /// Light cyan tint — great for glow effects or gradients.
    static let skyTint = Color(
        red: 76.0 / 255.0,
        green: 201.0 / 255.0,
        blue: 240.0 / 255.0,
        opacity: 1.0
    )

    /// Charcoal gray — recommended for surfaces or dark backgrounds.
    static let charcoal = Color(
        red: 30.0 / 255.0,
        green: 30.0 / 255.0,
        blue: 46.0 / 255.0,
        opacity: 1.0
    )

    /// Deep navy tone — subtle neutral for headers or cards.
    static let deep = Color(
        red: 18.0 / 255.0,
        green: 34.0 / 255.0,
        blue: 56.0 / 255.0,
        opacity: 1.0
    )
    
    static let vibrantGreen = Color(
        red: 34.0 / 255.0,
        green: 197.0 / 255.0,
        blue: 94.0 / 255.0,
        opacity: 1.0
    )
}
