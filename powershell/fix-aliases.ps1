$utf = new-object System.Text.UTF8Encoding($false)

$pattern = "^alias:\s+/blog(?<base>.*\.aspx)\s*$"
$re = new-object System.Text.RegularExpressions.Regex $pattern, "Multiline"

ls source\_posts\*.md | %{
	# $content = get-content -path $_ -delimiter "xxxdoesnotexistxxx"
	$content = [IO.File]::ReadAllText($_.FullName, $utf)

	if ($re.IsMatch($content)) {
		$orig = $re.Match($content).Groups[0].Value
		write-host ">> $orig" -foregroundColor Green

		$content = $re.Replace($content, 'alias: /blog/post${base}')

		$new = $re.Match($content).Groups[0].Value
		write-host "<< $new" -foregroundColor Red

		[IO.File]::WriteAllText($_.FullName, $content, $utf)
	}
}
