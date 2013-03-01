bookname = "RHCSA_Cheat_Sheet"

chapters = Array.new
Dir["./chapters/*"].entries.each { |n| chapters.push(n) if File.file?(n) && n.include?("draft") }
chapters.sort!

chap = chapters.join(' ')

puts "Building EPUB - /compile/#{bookname}.epub..."
`pandoc -S --epub-metadata=metadata.xml -o compile/#{bookname}.epub title.txt #{chap} --toc --smart --epub-stylesheet=./templates/epub.css 
# --epub-cover-image=./Cover_demo.png`
puts "...done!"
puts "Building MOBI - /compile/#{bookname}.mobi..."
`kindlegen compile/#{bookname}.epub`
puts "...done!"
puts "Building PDF  - /compile/#{bookname}-A4.pdf..."
`pandoc -S --epub-metadata=metadata.xml -o compile/#{bookname}-A4.pdf title.txt #{chap} --toc --smart --epub-stylesheet=./templates/epub.css --epub-cover-image=./Cover_demo.png`
puts "...done!"
puts "Building PDF  - /compile/#{bookname}-A5.pdf..."
`pandoc -S --epub-metadata=metadata.xml --template=./templates/a5.tex -o compile/#{bookname}-A5.pdf title.txt #{chap} --toc --smart --epub-stylesheet=./templates/epub.css --epub-cover-image=./Cover_demo.png`
puts "...done!"
