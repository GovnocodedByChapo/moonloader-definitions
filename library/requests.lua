--- @meta

--- @class Response
--- @field status_code number
--- @field status string
--- @field headers table
--- @field text string
--- @field xml function
--- @field json function

local requests = {}

--- User facing function the make a request use Digest Authentication
function requests.HTTPDigestAuth(user, password) end

--- User facing function the make a request use Basic Authentication
function requests.HTTPBasicAuth(user, password) end

--- POST request
--- @param url string | table
--- @param args table | nil
--- @return Response
function requests.post(url, args) end

--- GET request
--- @param url string | table
--- @param args table | nil
--- @return Response
function requests.get(url, args) end

--- DELETE request
--- @param url string | table
--- @param args table | nil
--- @return Response
function requests.delete(url, args) end

--- PATCH request
--- @param url string | table
--- @param args table | nil
--- @return Response
function requests.patch(url, args) end

--- PUT request
--- @param url string | table
--- @param args table | nil
--- @return Response
function requests.put(url, args) end

--- OPTIONS request
--- @param url string | table
--- @param args table | nil
--- @return Response
function requests.options(url, args) end

--- HEAD request
--- @param url string | table
--- @param args table | nil
--- @return Response
function requests.head(url, args) end

--- TRACE request
--- @param url string | table
--- @param args table | nil
--- @return Response
function requests.trace(url, args) end

--- Sets up all the data for a request and makes the request
--- @param method "POST" | "GET" | "DELETE" | "PATCH" | "PUT" | "OPTIONS" | "HEAD" | "TRACE" | "CONNECT"
--- @param url string | table
--- @param args table | nil
--- @return Response
function requests.request(method, url, args) end

return requests
