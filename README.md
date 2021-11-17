# ImportFromURL
ImportFromURL is a Module / One-liner that allows you to temporarily import Ps1 Scripts, Psm1 Modules &amp; DLL Modules into your current PS session without having to store any files locally. Funny enough, the code for the provided one-liner has some of the same logic that the module uses internally, At least for importing .psm1 modules. Below you will also find one liners examples for importing modules, scripts, and DLL files without having to use my Module. The purpose of my module is to make things easier on you (The Coder), For example, you could copy and paste my one liner into a function and use it as a cleaner way of importing Multiple other modules or scripts. If you don't care about how clean the code looks, or making it easier to import through-out in your function then I would recommend just doing it manually with the example one-liners. Regardless, it's here for your convenience. 

Side Rant: If you Google'd for a while, you'd probably quickly figure out how to import .Ps1 scripts in your currect session (The answer to that question has been mainstream for awhile), but trying to find info on how to import a .Psm1 module from a URL without storing the module and installing it, is a much harder thing to find, It took me awhile and a lot of fiddling to come up with the seemingly simple one-liner that I have now. And if you think that's bad, getting the raw data from a .DLL file from a URL and piping it In to the currect session without storing any files was so much harder and, I believe has never been attempted before, at least from the hours of digging that I did. If someone has done it before, they have never publicly released how they did it. But that changes now. Your Welcome :) 

My Module works with the pipeline so you can do ( "Your DLL Module URL", "Your Ps1 URL", "Your Psm1 URL" | ImportFromURL ) For Example.

Here's the One-Liner you can use to pull in the latest version of my module temporarily in your current PS session. 
```
New-Module -Name ImportFromURL -ScriptBlock ([Scriptblock]::Create((New-Object System.Net.WebClient).DownloadString("https://raw.githubusercontent.com/AlecMcCutcheon/ImportFromURL/main/ImportFromURL.psm1")))
```

# Manually importing Scripts, Modules & DLL Data Examples:

Similar to the command above, This is also the One-liner for manually importing a .psm1 module into your current PS session.
```
New-Module -Name "Your Module Name" -ScriptBlock ([Scriptblock]::Create((New-Object System.Net.WebClient).DownloadString("Your Module URL")))
```
Here's the One-liner for manually importing a .ps1 Script into your current PS session.
```
iex ((New-Object System.Net.WebClient).DownloadString("Your Script URL"))
```
And finally, The Holy Grail One-liner, IMO. Manually importing raw DLL data into your current PS session.
```
Import-Module ([System.Reflection.Assembly]::Load((Invoke-WebRequest -Uri "Your DLL File URL").content))
```
