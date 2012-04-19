# Config stuff
$pythonExe = "C:\Python\Python32\python.exe"
$html2Text = "C:\dev\github\html2text\html2text.py"

# Load in the category map file
$catMap = @{}
$catFile = [xml] (get-content categories.xml)
$catFile.categories.category | % { $catMap[$_.id] = $_."#text" }

# Builds Jekyll YAML Front Matter string
function get-frontMatter($postElement, $subtextId) {
	$fm = "---`r`n"
	$fm += "layout: post`r`n"

	$title = $postElement.title -replace "`"", "\`""
	$fm += "title: `"{0}`"`r`n" -f $title
	if (($postElement.description.nil -ne $true) -and ([string]::IsNullOrEmpty($postElement.description) -eq $false))  {
		$fm += "description : `"{0}`"`r`n" -f $postElement.description 
	}

	$commentsEnabled = ([string]$postElement.iscommentsenabled).ToLower()
	$fm += "comments: {0}`r`n" -f $commentsEnabled

	$pubDate = [string] $postElement.pubDate
	$fm += "date: {0}`r`n" -f $pubDate

	$updated = [string] $postElement.lastModified
	if ($updated -ne $pubDate) {
		$fm += "updated: {0}`r`n" -f $updated
	}

	$categoryNodes = $postElement.SelectNodes("//category")
	if ($categoryNodes -ne $null) {
		$fm += "categories:`r`n"
		$categoryNodes | % {
			$fm += (" - {0}`r`n" -f $catMap[$_."#text"])
		}
	}

	$tagNodes = $postElement.SelectNodes("//tag")
	if ($tagNodes -ne $null) {
		$fm += "tags:`r`n"
		$tagNodes | % {
			$fm += (" - {0}`r`n" -f $_."#text")
		}
	}

	if ($subtextId -ne $null) {
		$fm += ("subtext-id: {0}`r`n" -f $subtextId)
	}

	$slug = $postElement.slug
	$fm += "alias: /blog/$slug.aspx`r`n"

	$fm += "---`r`n`r`n"

	return $fm
}

function cleanup-Content([string] $content) {
	$content = $content -replace "http://www.peterprovost.org/blog/image.axd\?picture=", "/images/blog/"
	$content = $content -replace "/blog/image.axd\?picture=", "/images/blog/"
	$content = $content -replace "\u2019", "&rsquo;"
	$content = $content -replace "\u2018", "&lsquo;"
	$content = $content -replace "\u201d", "&rdquo;"
	$content = $content -replace "\u201c", "&ldquo;"
	$content = $content -replace "\u2026", "..."
	$content = $content -replace "\u2013", "&ndash"
	$content = $content -replace "\u2014", "&mdash"
	$content
}

$utf8Encoding = new-object System.Text.UTF8Encoding($false)

# Off we go!
get-childitem *.xml | ? { $_.Name -ne "categories.xml" } | % {
	$postFile = [xml] (get-content $_)

	# Extract the YAML front matter
	$frontMatter = get-frontMatter $postFile.post ([IO.Path]::GetFileNameWIthoutExtension($_.Name))

	# Figure out the Jekyll-friendly filename
	$pubDate = [DateTime] $postFile.post.pubDate
	$fileBase = join-path $pwd ("{0}-{1}" -f $pubDate.ToString("yyyy-MM-dd"), $postFile.post.slug)

	# Do some content cleanup on local images and whatnot
	# Fortunately, the escaped HTML from the XML file has already been unescaped
	$content = cleanup-Content($postFile.post.content)

	# Save the HTML content without a UTF BOM
	[IO.File]::WriteAllLines("$fileBase.html", $content, $utf8Encoding)

	# Save the YAML front matter without a UTF BOM
	[IO.File]::WriteAllLines("$fileBase.md", $frontMatter, $utf8Encoding)

	# Now generate the Markdown from the HTML using html2Text
	# This guy can use out-file since the file has already been created without a BOM
	& $pythonExe $html2Text "$fileBase.html" utf8 --body-width=0 | out-file -encoding utf8 -filePath "$fileBase.md" -append

	# If successful, delete the html file, otherwise delete the md file (it probably just has error junk in it)
	if ($LastExitCode -eq 0) {
		remove-item "$fileBase.html"
		"$fileBase.md"
	} else {
		remove-item "$fileBase.md"
	}
}
