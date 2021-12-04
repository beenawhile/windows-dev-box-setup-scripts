$distro = "ubuntu1804"
$username = "ubuntu"
$password = "ubuntu123"

& $distro run sh -c 'echo "${username}:${password}" \| chpasswd' # wrapped in sh -c to get the pipe to work
if ($LASTEXITCODE -ne 0) { throw }
