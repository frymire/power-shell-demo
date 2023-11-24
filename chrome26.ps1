# For some reason, it doesn't need me to login anymore. If it did, I'd first need to go to this page...
# $OCP_PAGE = "https://ocp-master1.dev26.minerva.navy.mil/login/htpasswd_auth?then=%2Foauth%2Fauthorize%3Fclient_id%3Dopenshift-web-console%26idp%3Dhtpasswd_auth%26redirect_uri%3Dhttps%253A%252F%252Focp-master1.dev26.minerva.navy.mil%252Fconsole%252Foauth%26response_type%3Dcode%26state%3DeyJ0aGVuIjoiL3Byb2plY3QvbWluZXJ2YS1kZXYvb3ZlcnZpZXciLCJub25jZSI6IjE2NzU5NTE3NDgyOTYtMTY4NDIyMjM5NTE4ODc5MDY3MjkxNDI1Njc1NjI2MzQ4ODEzMTk3NjI3NDkxNDE3MDExOTQ2NjkyODI0NDIyNTU0NTg5MTIwNjAzMTMzMTEifQ"

$OCP_PAGE = "https://ocp-master1.dev26.minerva.navy.mil/console/project/minerva-dev/browse/routes"

# Need the chrome executable on the path for this to work.
chrome --user-data-dir="${env:LOCALAPPDATA}\Google\Chrome\User Data\niera\dev26" --proxy-server="socks5://127.0.0.1:8896" $OCP_PAGE
