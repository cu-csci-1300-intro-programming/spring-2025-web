#include <iostream>
using namespace std;

// This program takes user input for the weather over the next 3 days.
// Valid inputs: "sunny", "rainy", "snowy".
// Then it suggests an activity for each day based on the weather:
//
//   - If day i is "sunny": "We can go hiking TODAY!"
//   - If day i is "rainy": "Better stay in and read a book TODAY."
//   - If day i is "snowy": 
//        If there's a tomorrow (day i+1) AND that day is sunny: 
//            "We can go skiing TOMORROW (day i+1) because tomorrow is sunny!"
//        Else if there's a tomorrow but it's not sunny:
//            "We can't go skiing tomorrow because tomorrow won't be sunny."
//        Else (it's the last day, no tomorrow):
//            "We can't plan skiing for tomorrow because there's no day i+1."
//
// The portion marked as 'CODING TELEPHONE' is where you
// convert code to comments (and vice versa) in your group.

const int NUM_DAYS = 3;

// **** CODING TELEPHONE STARTS HERE ****
void suggestActivity(const string forecast[], int day) {
    cout << "Day " << day << " (" << forecast[day] << "): ";

    if (forecast[day] == "sunny") {
        cout << "We can go hiking TODAY!\n";
    } 
    else if (forecast[day] == "rainy") {
        cout << "Better stay in and read a book TODAY.\n";
    } 
    else if (forecast[day] == "snowy") {
        if (day < NUM_DAYS - 1) { 
            // There is a tomorrow
            if (forecast[day + 1] == "sunny") {
                cout << "We can go skiing TOMORROW (day " << (day + 1) 
                     << ") because tomorrow will be sunny!\n";
            } else {
                cout << "We can't go skiing tomorrow because tomorrow won't be sunny.\n";
            }
        } else {
            // It's the last day, no tomorrow
            cout << "We can't plan skiing for tomorrow because there's no day " 
                 << (day + 1) << ".\n";
        }
    } 
    else {
        // Unrecognized input
        cout << "(Unrecognized weather type)\n";
    }
}
// **** CODING TELEPHONE ENDS HERE ****

int main() {
    // We'll store the forecast in a string array of size 3.
    string forecast[NUM_DAYS];

    cout << "Please enter the weather for the next 3 days (sunny, rainy, or snowy).\n\n";

    // Read in user input for each day
    for (int i = 0; i < NUM_DAYS; i++) {
        cout << "Day " << i << ": ";
        cin >> forecast[i];
    }

    cout << "\nSPRING FORECAST ACTIVITY SUGGESTIONS:\n\n";

    // For each day, suggest an activity
    for (int i = 0; i < NUM_DAYS; i++) {
        suggestActivity(forecast, i);
    }

    return 0;
}
