# ImportFromURL
ImportFromURL is a Module / One-liner that allows you to effortlessly import Ps1 Scripts, Psm1 Modules &amp; Raw DLL Module Data into your current PS session without having to install or store any files locally. Funny enough, the code for the provided one-liner has some of the same logic that the module uses internally, At least for importing .psm1 modules. Below you will also find one liners examples for importing modules, scripts, and Raw DLL file data without having to use my module. The purpose of my module is to make things easier on you (The Coder), For example, you could copy and paste my one-liner into a function and use it as a cleaner way of importing Multiple other modules or scripts. If you don't care about how clean the code looks, or making it easier to import through-out your function then I would recommend just doing it manually with the example one-liners. Regardless, it's here for your convenience. 

If you Google'd for a while, you'd probably quickly figure out how to import .Ps1 scripts in your currect PS session, (The answer to that question has been mainstream for awhile), but trying to find the others is a bit more challenging. 

Manual research difficulty level to find info on each task:

Info on Importing Ps1 Scripts: Easy <br />
Info on Importing psm1 Modules: hard <br />
Info on importing Raw DLL Module Data: No Info on task. <br />

I believe importing Raw DLL Module Data has never been attempted before, at least from the hours of digging that I did. If someone has done it before, they have never publicly released how they did it. But that changes now. Your Welcome.

My Module works with the pipeline so you can do ( "DLL File URL", "Ps1 File URL", "Psm1 File URL" | ImportFromURL ) For Example.

Here's the One-Liner you can use to pull in the latest version of my module into your current PS session. 
```
New-Module -Name ImportFromURL -ScriptBlock ([Scriptblock]::Create((New-Object System.Net.WebClient).DownloadString("https://raw.githubusercontent.com/AlecMcCutcheon/ImportFromURL/main/ImportFromURL.psm1")))
```
By default the script checks each URL to see if it can find the file extensions for each file type (.dll, .ps1, .psm1) if your URL does not contain the file extension I would make sure that that link leads directly to the raw code for (.ps1 & .psm1) files or directly to the download for the (.dll) File. If the URL does bring you directly to the correct location you can tell the script manually what type of file you are importing with parameters: <br />
(-DLL, -Ps1, -Psm1). <br />
Note that if you have multiple URLs and 1 of them does not contain a file extension and you're using a perimeter to tell the script what file type it is, all of the other URL's must be the same file type. 

# (Manually importing Scripts, Modules & Raw DLL Data From a URL without installing or storing any files locally) Examples:

Similar to the command above, This is also the One-liner for manually importing a .Psm1 module into your current PS session.
```
New-Module -Name "Your Module Name" -ScriptBlock ([Scriptblock]::Create((New-Object System.Net.WebClient).DownloadString("Your Module URL")))
```
Here's the One-liner for manually importing a .Ps1 Script into your current PS session.
```
iex ((New-Object System.Net.WebClient).DownloadString("Your Script URL"))
```
And finally, The Holy Grail One-liner, IMO. Manually importing Raw DLL module data into your current PS session.
```
Import-Module ([System.Reflection.Assembly]::Load((Invoke-WebRequest -Uri "Your DLL Module File URL").content))
```
