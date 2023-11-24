$URL="http://localhost:4200/entity-search-rest/kb/v1/graphql"

# Strip line breaks from query"
$query = $args[0]
# $query = $args[0] -replace "`n", " " -replace "'r", ""

$body = "{ `"query`" : `"query $query`" }" 
$response = Invoke-WebRequest -UseBasicParsing $URL -ContentType "application/json" -Method POST -Body $body
$response.Content