# ImportFromURL
ImportFromURL is a Module / One-liner that allows you to temporarily import Ps1 Scripts, Psm1 Modules &amp; DLL Modules into your current PS session without having to store any files locally. Funny enough, the code for the provided one-liner has some of the same logic that the module uses internally, At least for importing .psm1 modules. Below you will also find one liners examples for importing modules, scripts, and DLL files without having to use my Module. The purpose of my module is to make things easier on you (The Coder), For example, you could copy and paste my one liner into a function and use it as a cleaner way of importing Multiple other modules or scripts. If you don't care about how clean the code looks, or making it easier to import through-out in your function then I would recommend just doing it manually with the example one liners. Regardless, it's here for your convenience. 

Here's a One-Liner you can use to pull in the latest version of the module temporarily in your current session. 
```
New-Module -Name ImportFromURL -ScriptBlock ([Scriptblock]::Create((New-Object System.Net.WebClient).DownloadString("https://raw.githubusercontent.com/AlecMcCutcheon/ImportFromURL/main/ImportFromURL.psm1")))
```
