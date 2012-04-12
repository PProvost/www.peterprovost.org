<#
Running on Windows

1. Be sure you have Ruby 1.9.2 installed. Pik is a great way to manage multiple rubies on the same machine
2. Be sure python.exe and the directory with pygmentize are on your path
3. You may need to apply [this patch][1] to get the pygments stuff to work

[1] http://www.devopsy.com/blog/2012/01/12/launched/
#>
if ((get-command pik) -eq $null) {
	throw "Pik not found. Make sure you have installed pik from https://github.com/vertiginous/pik"
}

write-host "Switching to Ruby 1.9.2"
& pik use ruby 1.9.2

$pathVars = get-pathVariable

if ($pathVars -notcontains "C:\Python\Python32") {
	write-host "Adding Python exe directory to the path"
	add-pathVariable C:\Python\Python32
} else { write-host "Python exe directory already on the path" }

if ($pathVars -notcontains "C:\Python\Python32\Scripts") {
	write-host "Adding Python scripts directory to the path"
	add-pathVariable C:\Python\Python32\Scripts
} else { write-host "Python scripts directory already on the path" }

write-host "Note: You may need to patch RubyPython for Pygments support. See http://www.devopsy.com/blog/2012/01/12/launched/" -foregroundColor Yellow
