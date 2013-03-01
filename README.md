# RHCSA Cheat Sheet

Times ago some of my friends began to tell me to start the Red Hat Certification Program, I'm not a sysadmin (I came from Engineering in Computer Science and I want to become a UXer) but I know Linux and its power, I started to use it when I was 14 and now I'm 26 so I decide to write **RHCSA Cheat Sheet** to have some notes available for me and for anyone. 
**RHCSA Cheat Sheet** it was written to be edited and modified by anyone. It is written as a single text file using the format [markdown][markdown] and prepared so as to be able to automatically generate its versions in ePub and Mobi (for e-Book's readers) as well as PDF using [PanDoc][pandoc].  
  
In order to function you need to have the following software installed (at least on my computer):

* [Pandoc][pandoc]
* [Geany][geany]
* [KindleGen][kindlegen]

[markdown]: http://daringfireball.net/projects/markdown/
[pandoc]: http://johnmacfarlane.net/pandoc/
[geany]: http://www.geany.org/
[kindlegen]: http://www.amazon.com/gp/feature.html?ie=UTF8&docId=1000765211#?_encoding=UTF8&tag=heaprcom05-20&linkCode=ur2&camp=1789&creative=390957

**RHCSA Cheat Sheet** would never have been realized in this form without the contributions of explanation:

* <https://github.com/karlseguin/the-little-mongodb-book>
* <http://brizzled.clapper.org/blog/2010/11/26/writing-markdown-and-pandoc/>

## Edit and regeneration

To edit the text you can simply change the files:

	$ chapters/[number of chapter].markdown  <- Single chapters
	$ title.txt     					   <- Title and author
	$ metadata.xml  <- License and language

To regenerate the text for sharing there is a script:

    $ ruby build.rb

The language MultiMarkdown to handle text in the book is quite easy to use and practice should be understandable without great effort. A guide to the use of language is also available here:

* [Pandoc’s markdown](http://johnmacfarlane.net/pandoc/README.html#pandocs-markdown)

## Misc ##

Happy Hacking!.

Fabrizio.
