##<collection shelf="Classics">
##<movie title="The Enemy" shelf="A">
##   <type>War, Thriller</type>
##   <format>DVD</format>
##   <year>2001</year>
##   <rating>PG</rating>
##   <popularity>10</popularity>
##   <description>Talk about a war</description>
##</movie>
##<movie title="Transformers" shelf="B">
##   <type>Science Fiction</type>
##   <format>DVD</format>
##   <year>1980</year>
##   <rating>R</rating>
##   <popularity>7</popularity>
##   <description>Science Fiction</description>
##</movie>
##   <movie title="Trigun" shelf="B">
##   <type>Action</type>
##   <format>DVD</format>
##   <episodes>4</episodes>
##   <rating>PG</rating>
##   <popularity>10</popularity>
##   <description>Quite a bit of action!</description>
##</movie>
##<movie title="Ishtar" shelf="A">
##   <type>Comedy</type>
##   <format>VHS</format>
##   <rating>PG</rating>
##   <popularity>2</popularity>
##   <description>Boring</description>
##</movie>
##</collection>

# Standard ruby library for XML parsing
require 'rexml/document'
include REXML

# Enter your code here. Read input from STDIN. Print output to STDOUT
xmlText = "" 
# Read the input XML Fragment
while line = gets()
    xmlText += line   
end
doc = Document.new xmlText

# XPath Selector for listing the titles of the movies, in the same order as which they occur in the given XML.
# GET ATTRIBUTE TITLE OF MOVIES
for d in doc.root.elements
    puts d.attributes['title']
end
#or 
doc.elements.each(“*/movie”) { |element| puts element.attributes }

# GET POPULARITIES
doc.elements.each("//popularity") { |element| puts element.text }

# GET FORMAT OF MOVIES WHICH HAVE POPULARITY < 8
doc.elements.each("*/movie[popularity<8]/format") { |element| puts element.text }

#GET POPULARITY OF THE MOVIE  WITH TITLE "Trigun"
doc.elements.each("*/movie[@title='Trigun'""]/popularity") { |element| puts element.text }

#GET THE SHELF OF THE MOVIE NAMED 'Transformers'
# Assume there is only ONE such movie.
puts doc.elements["*/movie[@title='Transformers'""]"].attributes["shelf"] 

#GET THE NAME OF THE MOVIE FOR WHICH THE DESCRIPTION CONTAINS THE SUBSTRING "bit"
puts doc.elements["*/movie[contains(description,'bit')]"].attributes["title"] 

#XPATH SELECTOR FOR COMPUTING THE AVERAGE POPULARITY OF THE MOVIES
puts XPath.match(doc,"sum(*/movie/popularity) div count(collection/movie/popularity)")

#XPATH SELECTOR FOR FINDING THE NUMBER OF CHARACTERS (I.E, THE STRING-LENGTH) IN THE DESCRIPTION OF THE SECOND MOVIE IN THE XML FILE
puts doc.elements.each("string-length(collection/movie[2]/description/text())")

#GET THE TITLE OF THE SECOND MOVIE FOR WHICH THE MARKED SHELF = "B"
puts doc.elements.each("collection/movie[@shelf='B'][2]/@title")

#GET THE TITLES OF THE LAST TWO MOVIES IN THE LIST, LISTED IN THE SAME ORDER AS WHICH THEY OCCUR IN THE GIVEN XML
puts doc.elements.each("collection/movie[position()>2]/@title")

#GET THE TITLES OF THE MOVIES WHICH OCCUR AT ODD POSITIONS
puts doc.elements.each("collection/movie[position() mod 2 == 0]/@title")
