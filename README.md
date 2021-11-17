# ImportFromURL
ImportFromURL is a Module / One-Liner that allows you to temporarily import Ps1 Scripts, Psm1 Modules &amp; DLL Modules into your current PS session without having to store any files locally.

Here's a One-Liner you can use to pull in the latest version of the module temporarily in your current session. 
```
New-Module -Name ImportFromURL -ScriptBlock ([Scriptblock]::Create((New-Object System.Net.WebClient).DownloadString("https://raw.githubusercontent.com/AlecMcCutcheon/ImportFromURL/main/ImportFromURL.psm1")))
```
