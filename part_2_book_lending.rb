class Book

  attr_accessor :due_date, :title, :author, :isbn

  @@on_shelf = [] # the collection of book objects that are available to be lent out

  @@on_loan = [] # the collection of books that are currently being borrowed

  # initialize a book's title, author, and isbn.
  def initialize(title, author, isbn)
    @title = title
    @author = author
    @isbn = isbn
  end#initialize

  # how new books are added to the library.
  def self.create(title, author, isbn)
    # call Book.new(...),
    new_book = Book.new(title, author, isbn)
    # add the new book object to @@on_shelf,
    @@on_shelf << new_book
    # and then return the new book
    return new_book
  end#self.create

  def get_title
    @title
  end#get_title

  def get_author
    @author
  end#get_author

  def get_isbn
    @isbn
  end#get_isbn

  # This class method should return the value of @@on_shelf.
  def self.available
    @@on_shelf
  end#self.available

  # This class method should return the value of @@on_loan.
  def self.borrowed
    @@on_loan
  end#self.borrowed

  # This class method should return a random book from @@on_shelf
  # (you may need to consult the Array docs to figure out how to do this).
  def self.browse
    "Browsing books. How about '#{ @@on_shelf.sample.get_title }'?"
  end#self.browse

  # This instance method return true if a book has already been borrowed and false otherwise.
  def lent_out?
    @@on_shelf
  end#lent_out?

  # This class method should return the due date for books taken out today. It's up to you to decide how far in the future the due date should be. You can refer to the section about Time above for help getting started, and don't hesitate to ask for help if you're stuck!
  def self.current_due_date
    # Due-date will be 30 days.
    borrowed_date = Time.now.to_i
    due_date = borrowed_date + 2592000 # That's how many seconds 30 days is.
    "Your due-date is #{Time.at(due_date)}"
  end#self.current_due_date

  # This instance method is how a book is taken out of the library.
  def borrow
    # This method should use lent_out? to check if the book is already on loan,
    # and if it is this method should return false to indicate that the attempt to borrow the book failed.
    if lent_out? = true
      "This book is already on loan."
      # Otherwise, use current_due_date to set the due_date of the book
      # and move it from the collection of available books to the collection of books on loan,
      # then return true.
    elsif lent_out? = false
      # change lent_out to true
      # add book to @@on_loan
      # remove book from @@on_shelf
      # something something current_due_date
      # output confirmation of loan
    end#if
  end#borrow

  # This instance method is how a book gets returned to the library.
  def return_to_library
    # call lent_out? to verify that the book was actually on loan.
    # If it wasn't on loan, return false.
    # elsif: move book from @@on_loan to @@on_shelf
    #       and set duedate to nil, before returning true.
  end#return_to_library

end#Book


# Sample output:
sister_outsider = Book.create("Sister Outsider", "Audre Lorde", "9781515905431")
aint_i = Book.create("Ain't I a Woman?", "Bell Hooks", "9780896081307")
if_they_come = Book.create("If They Come in the Morning", "Angela Y. Davis", "0893880221")
puts Book.browse.inspect # #<Book:0x00555e82acdab0 @title="If They Come in the Morning", @author="Angela Y. Davis", @isbn="0893880221"> (this value may be different for you)
puts Book.browse.inspect # #<Book:0x00562314676118 @title="Ain't I a Woman?", @author="Bell Hooks", @isbn="9780896081307"> (this value may be different for you)
puts Book.browse.inspect # #<Book:0x00562314676118 @title="Ain't I a Woman?", @author="Bell Hooks", @isbn="9780896081307"> (this value may be different for you)
puts Book.available.inspect # [#<Book:0x00555e82acde20 @title="Sister Outsider", @author="Audre Lorde", @isbn="9781515905431">, #<Book:0x00555e82acdce0 @title="Ain't I a Woman?", @author="Bell Hooks", @isbn="9780896081307">, #<Book:0x00555e82acdab0 @title="If They Come in the Morning", @author="Angela Y. Davis", @isbn="0893880221">]
