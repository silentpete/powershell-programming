#Function(keyword) FunctionName (parameters) {script block}

Function Hello ([string] $name) {
  return "hello $name"
}

$toss = Hello("peter")
$toss

$test = Hello("test")
Write-Host "my variable" $test
