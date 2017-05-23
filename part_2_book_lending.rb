class Book

attr_accessor :due_date

@@on_shelf = [] # the collection of book objects that are available to be lent out

@@on_loan = [] # the collection of books that are currently being borrowed

# initialize a book's title, author, and isbn.
def initialize(title, author, isbn)
  @title = title
  @author = author
  @isbn = isbn
end#initialize

# how new books are added to the library.
def self.create
  # call Book.new(...),
  new_book = Book.new(title, author, isbn)
  # add the new book object to @@on_shelf,
  @@on_shelf << new_book
  # and then return the new book
  return new_book
end#self.create

# This class method should return the value of @@on_shelf.
def self.available
  @@on_shelf
end#self.available

# This class method should return the value of @@on_loan.
def self.borrowed
  @@on_loan
end#self.borrowed  

end#Book
