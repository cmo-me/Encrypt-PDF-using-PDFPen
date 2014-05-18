set this_file to theFile -- use this if you are using hazel 

set label to "PDFName" --this is the Name: in Keychain change for whatever you use
set Qlabel to quoted form of label
set t to do shell script "security 2>&1 find-generic-password -gl " & Qlabel
set text item delimiters to "\"" -- Get Password
set tlst to every text item of t
set pw to item 2 of tlst

tell application "PDFpen"
    open this_file
    save document 1 encrypt using AES256 password pw
    quit
end tell