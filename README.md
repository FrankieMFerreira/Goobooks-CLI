# Goobooks-CLI
Runs on
![ruby](https://i.imgur.com/YLqLgLM.png)

Welcome to my Google Books CLI Application!

This program will search the Google Books API, return 5 books matching the query, and give you the ability to save a book from the search results into a reading list.

## Getting started

1. Open up your terminal and clone this repository in a location of your choosing.

`git clone https://github.com/FrankieMFerreira/Goobooks-CLI.git`

2. Navigate into the folder Goobooks-CLI folder.

`cd Goobooks-CLI`

3. Install the project dependencies by running `bundle install` from within the Goobooks-CLI folder.

##  How to

After the project dependencies are installed, you will be able to open the command line application by typing the command `ruby bin/run.rb` in your terminal.

You will be greeted by a menu that will give you the option to search for books, look at your reading list, or to exit.

![example1](https://i.imgur.com/2RlSKLw.png)

To search for a book, we will click on Search for Books, write in our search query, and press enter. This will return a list of books.

![example2](https://i.imgur.com/mULwqN9.png)

Once the search results have populated, we will have the choice to add any of the books listed to our reading list. You will be prompted Yes or No but if you enter nothing and press enter, Yes will be selected by default. If we select no, we will return to the main menu. Otherwise, we will get a menu of options with the book results with the ability to chose which book(s) we would like to add to our reading list.

![example3](https://i.imgur.com/Y9N2bsN.png)

 Using the arrow keys, we can navigate through the books and press the space bar to select our choices, and ultimately press enter to submit. If you decide that you don't want to add a book from the results into your reading list, you can leave all the choices blank and press enter.

## Technical Approach

Here I have a set up of 5 different classes, GoogleBookAdapter, ReadingList, Book, AddBooks, BookCLI.
- GoogleBookAdapter is responsible for retrieving the data from the API.
- Book is responsible for being our book model. We need this to save our search results and display to the user. We have validation checks within the class to ensure if there is a missing author or publisher, that it will display "No Author/Publisher found" instead of nil to the user.
- AddBooks is responsible for taking the data from GoogleBookAdapter and adding it to our Book model.
- ReadingList is responsible for our reading list and adding books to itself.
- BookCLI is responsible for displaying the user interface and interacting with user's decisions.

To deal with the possibility of the user sending text that is not compatible with searching the Google Books API, GoogleBookAdapter will return empty data to the rest of our classes in the case of an error being detected. Luckily the way that we have our classes set up, empty data will return "Results not found" to the end user. Once our AddBooks class adds our books from the API search and the Books are saved, we can iterate through them and display to the user. If the user decides to save any of the books to the reading list, we can use our tty-prompt gem to display a dropdown menu with selectable books. To do refer our choices from the list to the Book array we have, I had to create a hash with all the books pointing to their index number. This will make tty-prompt return an array of the index numbers selected and from there we can push those elements from the Book array into our Reading List array.

## Running the tests

To ensure you can run tests, make sure to enter `gem install rspec` before attempting to run them.

Then, to run them, enter into the terminal:
`rspec --format doc`

## The Learning Experience

Well, this was certainly an experience and am super happy to have exceeded my expectations in some elements. Being able to select multiple books to a reading list from a menu was a stretch goal of mine that I was seeing much further in the revisionary future.

This was my first experience actually writing tests and being on the other side I now see the huge value in having them early on in the development process. Had I written them early, it would have saved me a few times! I was really wishing to have been able to make tests looking for stdout output but was unable to get it to work with the tty-prompt dependency, I would really like to look into making that a possibility if I can.

I was really pushing to ensure that every class had a single responsibility, but was struggling with 100% confidence if I had split things correctly. In previous commits, our API Adapter had been taking api data and adding it to the Book class, which is obviously inappropriate since its only responsibility should be to return API data. I wasn't super sure that the Book class should be responsible for taking data and adding to itself either, so I created a class AddBooks solely for this purpose.


## Stretch goals

- Create more tests
- Search by author (and even perhaps allow search for specific kinds of media like magazines)
- Remove items from reading list
- Save reading list to a database


## Dependencies

### [tty-prompt](https://github.com/piotrmurach/tty-prompt)

- used to create powerful command line prompts

### [tty-spinner](https://github.com/piotrmurach/tty-spinner)

- a terminal loading spinner to give our command line some spice

### [rest-client](https://github.com/rest-client/rest-client)

- Used to make HTTP requests

### [json](https://github.com/flori/json)

- json implementation for ruby to parse through our api data
