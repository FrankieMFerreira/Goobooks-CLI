# Goobooks-CLI
Welcome to my Google Books CLI Application!

This program will search the Google Books API, return 5 books matching the query,
and give you the ability to save a book from the search results into a reading list.

Striving to stay true to the single-responsibility principle, I created 3 classes:
A book class to deal with storing book information, a Google Books Api Adapter to handle
api response, and a BookCLI as the interface of my program.

I had to make sure that our book class could handle books that did not have an author
or publisher listed, so I created 2 functions that would deal with a check for these
two items.

Our book class manages an array that holds all our book objects in an array called ALL,
and also deals with an array that holds our reading list. By iterating over our ALL array
and displaying it to the user, we can allow them to select a book, then refer to ALL using
the index of book object and push it into our favorites array. Clicking on the Reading list
option will iterate through this array and display it just the way we iterate through all to
display search results.(Was really glad I was able to consolidate this code to work for both
displaying search results and favorites)

Using the tty-prompt gem, I was able to create menus within terminal to give the user options
of either doing a search or looking at the reading list. The user will have access to this
menu all throughout the process until they press exit.

![example1](https://i.imgur.com/ugjmdJZ.png)

Using tty-prompt we can do validations to ensure our user input is correct, if not it will
spit out an appropriate error and make the user continue to input until it's correct.

![example2](https://i.imgur.com/Ske86B5.png)
This is a validation that will only allow Y/n (including 'Yes', 'No')

![example3](https://i.imgur.com/AJ4LkIs.png)
If we say yes to adding to our list, tty-prompt will graciously validate that the answer is between 1 and 5.

Wish List:
- Need to appropriately deal with 403 responses from the API
- Want to allow a user to choose more than 1 favorite at a time
- Want to use tty-prompt to also give a select menu for favorites rather than having the
user type the number.
- Ensure that user input for search term is suitable(deny all non-ASCII characters?)
- Maybe ensure that the same book cannot be added to the reading list more than once
(might need to save ISBN numbers or something?, doing a new search and adding the same book
  will result them in having diff object ID since new Book objects are being created every time)
