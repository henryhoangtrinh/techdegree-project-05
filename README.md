# techdegree-project-04
Requirements:
For this project, you’ll create a system for creating and validating access passes to an amusement park. There are three types of people who can be granted access to the park: employees, vendors, and of course, guests. As you can imagine, these different groups are allowed to enter different areas of the park, and may or may not be permitted to do certain things, like ride the rides or receive discounts in certain eateries and shops, for example.

Within each category of park access, there should be several sub-categories with varying access rights. For example, guests can be “Classic”, “VIP”, or “Free Child”, with different privileges associated with each. Details on exactly what each type of entrant is permitted to do and what type of personal information is required from them are outlined in the Business Rules Matrix. The document can be downloaded in the Project Resources area.

This project is divided into two parts. Part 1, outlined here as Project 4, will focus on building the data structures, object definitions, logic, error handling and other plumbing for the app. No user interface will be built at this stage. Your code will be built, tested and run by using temporary hard-coded “plug” values (or test cases).

 Meets Expectations:
 Object Oriented Design for the core objects such as Entrants and Passes: The core objects such as Entrants and Passes are defined using object oriented approach (class/struct/protocol/inheritance/composition)

 Enumerations: Enums are used for the definition of Entrant types and sub-types (e.g. employee types), Errors types, Guest types.

 Initializer: Initializer methods for the classes/structs are created.

 Errors: Errors are implemented for various possible scenarios (such as missing birthday, missing first/last name)

 Errors provide descriptive information, such as the name of the object that caused the error, and the details of the error.

 “Swipe” methods:
 One or more swipe methods are implemented

 Swipe methods give correct results for all entrant types according to the business rules matrix

 When access is denied an alert message is given

Test Cases:
Created (and commented out) test cases for each entrant type and at least two of their associated possible actions, according to the business rules matrix

Created test cases to demonstrate errors

Exceeds Expectations:

  "Swipe" Methods:
Polymorphic methods are being implemented for swipe or related processing, such that the method is able to handle (or to be applied to) multiple entrant or pass types

Entrants are correctly alerted on their birthdays

Entrants are prevented from swiping twice within 5 seconds at the same checkpoint
