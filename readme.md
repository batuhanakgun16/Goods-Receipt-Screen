# README - SAP Goods Entry Screen Project

## Project Overview

This project is a basic stand-alone SAP Goods Entry Screen, designed to allow users to input and save material (goods) data and display the saved data in a table. It is not connected to the SAP MM (Materials Management) module but serves as an independent program to handle goods entries.

## Key Features

- **Input Screen (Screen 100)**: A screen where users can input the following material data:
  - Material ID
  - Material Name
  - Material Quantity
- **Data Saving**: The entered data is saved to a custom database table (`zbk_mal_giris`).
- **Display Screen (Screen 200)**: A separate screen that displays all saved data in a table using the SAP ALV (ABAP List Viewer).

## Program Structure

- **Tables**: 
  - `zbk_mal_giris`: A custom table where material data is stored.

- **Main Program**: 
  - The program starts with the `START-OF-SELECTION` event, which calls the input screen (Screen 100).
  
- **Key Forms**:
  - `kaydet_mal_verisi`: This form is responsible for saving the material data entered by the user into the `zbk_mal_giris` table.
  - `display_salv`: This form is used to fetch and display all material data in a table format using SAP ALV.

- **Modules**:
  - `status_0100 OUTPUT`: Sets the screen's status for Screen 100.
  - `user_command_0100 INPUT`: Handles user commands such as saving data and navigating between screens.
  - `status_0200 OUTPUT`: Sets the screen's status for Screen 200 and calls the `display_salv` form to display the material data.
  - `user_command_0200 INPUT`: Handles navigation from Screen 200.

## Navigation

1. **Screen 100**:
   - Users input material information.
   - Press "Save" to save the data and proceed to Screen 200.

2. **Screen 200**:
   - Displays all saved material data.
   - Press "Back" to return to the initial screen.

## How to Use

1. Run the program `Z_MAL_GIRIS_PRG`.
2. The input screen (Screen 100) will appear where you can enter the material details.
3. After entering the details, click the "Save" button. The data will be stored in the `zbk_mal_giris` table, and the program will navigate to the display screen (Screen 200).
4. Screen 200 will show all the saved material data in a table. Use the "Back" button to return to Screen 100.

## Future Enhancements (Suggestions)

- Add validation checks for input fields (e.g., ensuring that material quantity is a positive number).
- Implement search functionality to allow users to find specific materials.
- Integrate with MM module for broader functionality (if needed).

---

**Note**: This project is meant for training purposes and does not integrate with the MM module or other SAP components.

## Author

This project was developed as part of an internship training to demonstrate SAP ABAP skills in creating stand-alone entry and display screens.