require "http/client"

errors = ""
removed = 0
not_removed = 0
already_removed = 0
error = File.new("path_to_error_file, "w")
File.each_line("file_path") do |key|
  begin
    response = HTTP::Client.get("get_url", headers: HTTP::Headers{"Content-Type" => "application/json"})
    if response.status_code == 200
      r2 = HTTP::Client.delete("delete_url", headers: HTTP::Headers{"Content-Type" => "application/x-www-form-urlencoded")
      if r2.status_code == 204
        removed += 1
      else
        error.puts key
        error.flush
        not_removed += 1
      end
    else
      already_removed += 1
    end
  rescue e
    puts e.message
    error.puts key
    error.flush
    not_removed += 1
  end

  puts "Já Removidos: #{already_removed} - Removidos: #{removed} - Não Removidos: #{not_removed} - Total: #{already_removed + removed + not_removed}"
end
