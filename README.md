# RHCSA Cheat Sheet

# Why this notes

The Red Hat Certification Program[^010-1] are IT Professional certifications for Red Hat products and general Linux related skills such as system administration on Red Hat Enterprise Linux, all certifications are given after passing exams. The program distinguishes itself in that the exams are performance-based, meaning that students must perform tasks on a live system, rather than answering multiple choice questions.  

RHCSA[^010-2] is the entry-level certification that focuses on actual competencies at system administration, including installation and configuration of a Red Hat Linux system and attaching it to a live network running network services.
To achieve the RHCSA certification the student must pass EX200, a half-day hands-on lab exam. The minimum passing score for the exam is 210 out of 300 possible points (70%). There is no prerequisite for the exam, but Red Hat recommends preparing for the exam by taking courses in Red Hat System Administration (RH124 or RH135) if one does not have previous experience.
RHCSA was launched in 2002 as Red Hat Certified Technician (RHCT). As of July 2009 there were 30,000 RHCTs. In November 2010 it was renamed to RHCSA. Unfortunately, due to mathematical intractability of most Bayesian models, the reader is only shown simple, artificial examples. This can leave the user with a so-what feeling about Bayesian inference. In fact, this was the author's own prior opinion.

After some recent success of Red Hat, I decided to investigate the subject again but after some Google's query about the topic I was not able anything of interesing, except some valid books[^010-3] but these is nothing that I can't consult on my eBook's reader or that I can share with my friends, so I started to write a collaborative notes on GitHub.

As I said I'm not a SysAdmin but I'm simple Linux passionate, I wrote (and I'm writing) this ebook not for money but following my passion, my knowledge and the "Exam objectives" so, for sure, you can find some mistakes or something wrong, please send me a mail or update the notes. 


## Using the book

The book can be read in three different ways, starting from most recommended to least recommended: 

1. The most recommended option is to clone the repository to download the files to your local machine. **RHCSA Cheat Sheet** it was written to be edited and modified by anyone. It is written as a single text file using the format [markdown][markdown] and prepared so as to be able to automatically generate its versions in ePub and Mobi (for e-Book's readers) as well as PDF using [PanDoc][pandoc].  
  
In order to function you need to have the following software installed (at least on my computer):

* [Pandoc][pandoc]
* [Geany][geany]
* [KindleGen][kindlegen]

[markdown]: http://daringfireball.net/projects/markdown/
[pandoc]: http://johnmacfarlane.net/pandoc/
[geany]: http://www.geany.org/
[kindlegen]: http://www.amazon.com/gp/feature.html?ie=UTF8&docId=1000765211

2. The second, preferred, option is to use the GitHub viewer site, which display the Cheat Sheet in the browser [example].
The contents are updated synchronously as commits are made to the book. You can use the Contents section above to link to the chapters.

[example]: https://github.com/fdicarlo/RHCSA_cs/blob/master/chapters/020-Exam-objectives-draft.markdown
 
3. **Compiled** versions are available! Look in the compile/ directory. 

## Edit and regeneration

To edit the text you can simply change the files:

	$ chapters/[number of chapter].markdown  <- Single chapters
	$ title.txt     					   <- Title and author
	$ metadata.xml  <- License and language

To regenerate the text for sharing there is a script:

    $ ruby build.rb

The language MultiMarkdown to handle text in the book is quite easy to use and practice should be understandable without great effort. A guide to the use of language is also available here:

* [Pandoc’s markdown](http://johnmacfarlane.net/pandoc/README.html#pandocs-markdown)

## Development

This book has an unusual development design. The content is open-sourced, meaning anyone can be an author. Authors submit content or revisions using the GitHub interface.

### What to contribute?

The current chapter list is not finalized. If you see something that is missing (Bash, networks, commands, tricks etc.), feel free to start there.

* Cleaning up code and making code more polish
* Giving better explanations
* Spelling/grammar mistakes
* Suggestions
* Contributing to the RH notebook styles

### Commiting

* All commits are welcome, even if they are minor ;)
* If you are unfamiliar with Github, you can email me contributions to the email below.

## Contributions and Thanks

One final thanks: **RHCSA Cheat Sheet** would never have been realized in this form without the contributions of explanation:

* <https://github.com/karlseguin/the-little-mongodb-book>
* <http://brizzled.clapper.org/blog/2010/11/26/writing-markdown-and-pandoc/>
  
Contact the main author, Fabrizio Di Carlo at <dicarlo.fabrizio@gmail.com> or [@fdicarlo]

[@fdicarlo]: https://twitter.com/fdicarlo

[^010-1]: <http://www.redhat.com/training/certifications/>
[^010-2]: <http://www.redhat.com/training/certifications/rhcsa/>
[^010-3]: Michael Jang's RHCSA/RHCE Red Hat Linux Certification Study Guide (Exams EX200 & EX300) <http://www.amazon.com/RHCSA-Linux-Certification-Study-Edition/dp/0071765654> and Damian Tommasino's Hands-on Guide to the Red Hat Exams: RHCSA and RHCE Cert Guide and Lab Manual <http://www.amazon.com/Hands-Guide-Red-Exams-Certification/dp/0321767950>
