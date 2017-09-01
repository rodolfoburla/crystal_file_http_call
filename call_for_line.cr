require "http/client"

File.each_line("file_name") do |line|
  response = HTTP::Client.get("urls",
    headers: HTTP::Headers{"Content-Type" => "application/json"})
  puts msisdn if response.status_code == 200
end
