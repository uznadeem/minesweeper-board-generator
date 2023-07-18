# Minesweeper Rails Application

![Minesweeper](minesweeper.png)

## Job Description (JD)

We are building a simple Rails application that allows users to generate Minesweeper boards and view previously generated boards. The main features of the application are as follows:

1. Users can visit the app's root URL and generate a Minesweeper board by providing their email address, board width, board height, number of mines, and a board name.
2. The generated Minesweeper board is stored in the database, along with the name of the board and the email of the creator.
3. Once saved, the user is redirected to a page that displays the name of the board, the email of the creator, and a visual representation of the Minesweeper board.
4. The application also lists the ten most recently generated boards on the home page, each with a link to view the full board details.
5. Users can view all the boards generated by the app on a separate page.

## Getting Started

Follow the instructions below to run the Minesweeper Rails application on your local machine:

### Prerequisites

- Ruby (version 2.7.0 or higher)
- Ruby on Rails (version 7.0.0 or higher)
- PostgreSQL (version 9.5 or higher)

### Installation

1. Clone this repository to your local machine:

git clone https://github.com/uznadeem/minesweeper-board-generator
cd minesweeper

Install the required gems:
bundle install

Create and migrate the database:
rails db:create
rails db:migrate

## Running the Application

Start the Rails server:

rails server
You can access the Minesweeper application at http://localhost:3000.

## Solutions
Minesweeper Board Generation
The board generator algorithm is the main component of this application. It works in a performant manner for boards of any dimension. The algorithm returns a two-dimensional array of objects that represent the state of a Minesweeper board before the game starts. The algorithm is implemented in the MinesweeperService class, which can be found in the app/services/minesweeper_service.rb file.

### Recent Boards
The application lists the ten most recently generated boards on the home page. This feature is implemented by fetching the ten most recent boards from the database using the @recent_boards instance variable in the BoardsController.

### Validations
The application ensures that the number of mines specified by the user is not greater than the size of the board. This validation is performed in the BoardsController using a before_action filter.

### Styling
The user interface of the application has been enhanced with custom CSS styles to make it more visually appealing. The board cells are styled to fit the emojis properly, and the overall layout is designed to be responsive and user-friendly.

### Additional Features
The application has been designed to meet the requirements of the JD, but additional features can be added to enhance the user experience. Some ideas for further improvements include:

Adding pagination to the list of all generated boards to improve performance when there are a large number of boards.
Implementing a search and filter functionality to allow users to find specific boards based on criteria such as board name or email.
Enhancing the board generation algorithm to support custom difficulty levels and customizable mine density.
Contributing
We welcome contributions from the community! If you find any bugs or have ideas for new features, please feel free to open an issue or submit a pull request.

### Happy Minesweeping! :)