# Implementing Advanced Typographic Features for San Francisco
The San Francisco font has a host of features that allows developers to use the font more effectively. Right from special glyphs for fractional decimels, and tabular number sets to alternative styles for higher legibility. There's a lot in San Francisco that can be put to good use, this playground is an attempt to allow developers to experience the changes that different features bring and to allow them to implement them easily in their own apps.

## Contents of the Playground
1. A playground page that lets the users experience the changes brought by different typographic features.
2. A UIFont extension that allows the developers to easily integrate the features in their own app.
3. A Glossary explaining different typographic features and their usage.

![Screenshot of the Playground][playgroundScreen]

## Some of the Important Typographic Features

### Monospaced (Tabular) Numbers
![monospaced][monospaced]  
Monospaced (Tabular) Numbers are immensely useful when you need the numbers to align one below the other or when you need your string width to stay intact even if the numbers change. 

Monospaced numbers ensure that each number glyph has the same character width, as opposed to the default of proportional numbers where the width of the character is dependent on the width of the glyph. (i.e. in proportional numbers, 1 would occupy less width compared to 2 or 0, but in monospaced numbers 1,2,0 all occupy same widths)

![Monospaced Usage][monospacedUsage]

### Diagonal Fractions
While representing fractions, fonts can offer special glyphs which show a proper diagonal representation instead of something like "4/2"

![HighLegibility][legibility]

### High Legibility Alternatives
High Legibility alternatives enable certain alternative glyphs to allow easy readability.

Easily confused symbols like (I and l) and (0 and O) are replaced with more distinguishable alternatives. 

These legibility alternatives also conform to the 2013 DIN recommendation as well.  

[playgroundScreen]:http://thetangible.in/pixels/sfpro/playgroundScreen.png
[monospaced]:http://thetangible.in/pixels/sfpro/monovprop.png  
[monospacedUsage]:http://thetangible.in/pixels/sfpro/monoprop.png  
[legibility]:http://thetangible.in/pixels/sfpro/confused.png  
