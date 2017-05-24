class Book

  attr_accessor :due_date, :title, :author, :isbn

  @@on_shelf = [] # the collection of book objects that are available to be lent out

  @@on_loan = [] # the collection of books that are currently being borrowed

  def initialize(title, author, isbn)
    @title = title
    @author = author
    @isbn = isbn
  end#initialize

  def self.create(title, author, isbn)
    new_book = Book.new(title, author, isbn)
    @@on_shelf << new_book
    new_book #return value
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
    @@on_shelf.each {|book| puts book.get_title}
  end#self.available

  # This class method should return the value of @@on_loan.
  def self.borrowed
    @@on_loan.each {|book| puts book.get_title}
  end#self.borrowed

  # This class method should return a random book from @@on_shelf
  # (you may need to consult the Array docs to figure out how to do this).
  def self.browse
    browsed_book_title = @@on_shelf.sample.get_title
    "Browsing books. How about '#{ browsed_book_title }'?"
  end#self.browse

  # This instance method return true if a book has already been borrowed and false otherwise.
  def lent_out?
    @@on_loan.include?(Book)
  end#lent_out?

  # This class method should return the due date for books taken out today. It's up to you to decide how far in the future the due date should be. You can refer to the section about Time above for help getting started, and don't hesitate to ask for help if you're stuck!
  def self.current_due_date
    # Due-date will be 30 days.
    due_date = Time.now + 2592000 # That's how many seconds 30 days is.
    puts "Your due-date is #{Time.at(due_date)}" # Should output Epoch time as proper date.
  end#self.current_due_date

  # This instance method is how a book is taken out of the library.
  def borrow
    # This method should use lent_out? to check if the book is already on loan,
    # and if it is this method should return false to indicate that the attempt to borrow the book failed.
    if lent_out? == true
      puts "This book is already on loan."
      lent_out # should say false.
    elsif lent_out? == false
      # Otherwise, use current_due_date to set the due_date of the book
      @due_date = Book.current_due_date
      # and move it from the collection of available books to the collection of books on loan,
      @@on_shelf.delete(Book)
      # then return true.
      return true
      # change lent_out to true
      lent_out? == true
      # add book to @@on_loan
      @@on_loan << Book
      # remove book from @@on_shelf
      # output confirmation of loan
      puts "You have borrowed '#{Book.title}'"
    end#if
  end#borrow

  # This instance method is how a book gets returned to the library.
  def return_to_library
    # call lent_out? to verify that the book was actually on loan.
    # If it wasn't on loan, return false.
    if self.lent_out? == false
      return false
    else
      @@on_loan.delete(Book)
      @@on_shelf << Book
    #       and set duedate to nil, before returning true.
      @due_date = nil
      return true
    end#if
  end#return_to_library

  # This class method should return a list of books whose due dates are in the past (ie. less than Time.now).
  # As you write your program you should be thinking about the reasoning behind making each method either an instance method or a class method.
  def self.overdue
    overdue_list = []
    @@on_loan.each do |book|
      if book.current_due_date < Time.now
        overdue_list << book
      end#if
    end#each.do
      return overdue_list
  end#self.overdue

end#Book


# Sample output:
sister_outsider = Book.create("Sister Outsider", "Audre Lorde", "9781515905431")
aint_i = Book.create("Ain't I a Woman?", "Bell Hooks", "9780896081307")
if_they_come = Book.create("If They Come in the Morning", "Angela Y. Davis", "0893880221")
puts Book.browse.inspect # #<Book:0x00555e82acdab0 @title="If They Come in the Morning", @author="Angela Y. Davis", @isbn="0893880221"> (this value may be different for you)
puts Book.browse.inspect # #<Book:0x00562314676118 @title="Ain't I a Woman?", @author="Bell Hooks", @isbn="9780896081307"> (this value may be different for you)
puts Book.browse.inspect # #<Book:0x00562314676118 @title="Ain't I a Woman?", @author="Bell Hooks", @isbn="9780896081307"> (this value may be different for you)
puts Book.available.inspect # [#<Book:0x00555e82acde20 @title="Sister Outsider", @author="Audre Lorde", @isbn="9781515905431">, #<Book:0x00555e82acdce0 @title="Ain't I a Woman?", @author="Bell Hooks", @isbn="9780896081307">, #<Book:0x00555e82acdab0 @title="If They Come in the Morning", @author="Angela Y. Davis", @isbn="0893880221">]
puts Book.borrowed.inspect # []
puts sister_outsider.lent_out? # false
puts sister_outsider.borrow # true
puts sister_outsider.lent_out? # true
puts sister_outsider.borrow # false
puts sister_outsider.due_date # 2017-02-25 20:52:20 -0500 (this value will be different for you)
puts Book.available.inspect # [#<Book:0x00562314676118 @title="Ain't I a Woman?", @author="Bell Hooks", @isbn="9780896081307">, #<Book:0x00562314675fd8 @title="If They Come in the Morning", @author="Angela Y. Davis", @isbn="0893880221">]
puts Book.borrowed.inspect # [#<Book:0x00562314676208 @title="Sister Outsider", @author="Audre Lorde", @isbn="9781515905431", @due_date=2017-02-25 20:55:17 -0500>]
puts Book.overdue.inspect # []
puts sister_outsider.return_to_library # true
puts sister_outsider.lent_out? # false
puts Book.available.inspect # [#<Book:0x00562314676118 @title="Ain't I a Woman?", @author="Bell Hooks", @isbn="9780896081307">, #<Book:0x00562314675fd8 @title="If They Come in the Morning", @author="Angela Y. Davis", @isbn="0893880221">, #<Book:0x00562314676208 @title="Sister Outsider", @author="Audre Lorde", @isbn="9781515905431", @due_date=nil>]
puts Book.borrowed.inspect # []
