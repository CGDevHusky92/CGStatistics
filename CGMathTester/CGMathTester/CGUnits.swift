//
//  CGUnits.swift
//  CGMathTester
//
//  Created by Charles Gorectke on 8/5/14.
//  Copyright (c) 2014 Revision Works, LLC. All rights reserved.
//

import Foundation

enum metric_prefixes {
    case pico   //  p   .000 000 000 001
    case nano   //  n   .000 000 001
    case micro  //  μ   .000 001
    case centi  //  c   .001
    case milli  //  m   .01
    case deci   //  d   .1
    case none   //  -   1
    case deca   //  da  10
    case hecto  //  h   100
    case kilo   //  k   1000
    case mega   //  M   1000 000
    case giga   //  G   1000 000 000
    case tera   //  T   1000 000 000 000
}

enum metric_unit_types {
    case time                   // second (s)
    case length                 // meter (m)
    case mass                   // kilogram (kg)
    case area                   // square meter (m^2)
    case pressure               // pascal (Pa)
    case temperature            // kelvin (K) degree Celsius (℃)
    case acceleration           // (m/s^2)
    case frequency              // hertz (hz)
    case energy                 // joule (J)
    case power                  // watt (W)
    case force                  // newton (N)
    case elec_current           // ampere (A)
    case elec_charge            // coulomb (C)
    case potential_difference   // volt (V)
    case capacitance            // farad (F)
    case inductance             // henry (H)
    case elec_resistance        // (ML^2)/(T^3 I^2) ohm (Ω)
    case elec_conductance       // (T^3 I^2)/(ML^2) siemens (S)
    case magn_flux              // (L^2*M)/(T^2*I)  weber (Wb)
    case magn_flux_density      // M/(I*T^2)        tesla (T)
    case magn_field_strength    // I/L              (A/m)
    case dynamic_viscosity      // M/LT             (Pa*s)
    case kinematic_viscosity    // L^2/T            m^2/s
    case amount_of_substance    // mole (mol)
    case luminous_intensity     // candela (cd)
    case luminous_flux          // J                lumen (lm)
    case illuminance            // J/L^2            lux (lx)
    case radioactivity          // 1/T              becquerel (Bq)
    case rad_absorbed_dose      // L^2/T^2          gray (Gy)
    case rad_dose_equivalent    // L^2/T^2          sievert
    case catalytic_activity     // N/T              katal (kat)
}