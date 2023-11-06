#!/usr/bin/env ruby
require 'async'
require 'httparty'
require 'json'
require 'csv'

def get_address(lat, lon)
  if lat.is_a?(Float) && !lat.nil? || !lon.nil? || (!lon == 0 && !lat == 0)
    resp = HTTParty.get("https://nominatim.openstreetmap.org/reverse?lat=#{lat}&lon=#{lon}&format=jsonv2", format: :plain)
    resp = JSON.parse(resp.body, symbolize_names: true)
  end
  full_address = ""
  resp[:address]&.tap do |address|
    if address[:house_number].nil?
      full_address += "NaN"
    else
      full_address += "#{address[:house_number]}"
    end
    if address[:road].nil?
      full_address += " NaN"
    else
      full_address += " #{address[:road]}"
    end
  end
  full_address
end

def process_csv(file_url)
  Enumerator.new do |yielder|
    lines = 0
    remaining = ""
    response = HTTParty.get(file_url, stream_body: true) do |chunk|
      if [301, 302].include?(chunk.code)
        print "skip writing for redirect"
      elsif chunk.code == 200
        chunk = remaining + chunk
        i = chunk.rindex("\n")
        line = chunk[..i]
        remaining = chunk[i+1..]
        yielder << line
        lines += 1
      else
        raise StopIteration, "Non-success status code while streaming #{chunk.code}"
      end
      yielder << remaining
      lines += 1
    end
  end.lazy
end

process_csv("https://raw.githubusercontent.com/kelvins/US-Cities-Database/main/csv/us_cities.csv").each_slice(10) do |batch|
  Async do |task|
    batch.each do |line|
      task.async do
        puts *line.split(',')[-2..].map(&:to_f)
      rescue
      end
    end
  end
end
