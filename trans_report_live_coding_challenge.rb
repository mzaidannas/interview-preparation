require 'csv'

Incident = Struct.new(:company_name, :train_number, :wagon_number, :defect_id, :incident_date, :incident_time) do
  def incident_date=(val)
    Date.strptime(val, '%Y-%m-%d')
  end

  def incident_time=(val)
    Time.strptime(val, '%H:%M')
  end
end

csv_headers = 'company_name,train_number,wagon_number,defect_id,incident_date,incident_time'
csv_string = <<-CSV
Great Western Railway,2332,5,12,2022-02-07,11:45
Heathrow Express,19D3,6,42,2022-03-02,7:00
Heathrow Express,19D3,6,42,2022-03-02,8:00
Heathrow Express,19D3,6,42,2022-03-02,9:00
ScotRail,AA1D,12,42,2022-01-06,11:45
Stansted Express,1222R,A,76,2022-01-09,11:45
Thameslink,FP11S,8,420,2022-01-03,11:45
Great Western Railway,1172,8,112,2022-02-07,15:22
Thameslink,FP112,1,112,2022-01-21,17:50
CSV

incidents = csv_string.split("\n").map do |line|
   Incident.new(*line.split(','))
end


class Metrices
  attr_setter :incidents
  attr_reader :total_for_each_company, :total_in_january, :max_for_train, :unknown_incidents, :incidents_for_march

  def self.call(indicents)
    new(indicents).call
  end

  def call
    incidents.each do |incident|
      total_for_each_company[incident.company_name] += 1
      total_in_january += 1 if incident.incident_date.split('-')[1] == '01'
      total_for_each_train[incident.train_number] += 1
      max_for_train = [total_for_each_train[incident.train_number], max_for_train].max
      if incident.defect_id.to_i == 42
        unknown_incidents << "day: #{incident.incident_date.split('-')[2]} hour: #{incident.incident_time.split(':')[0]}"
      end
      incidents_for_march += 1 if incident.incident_date.split('-')[..1].join('-') == '2022-03'
    end
  end
end

total_for_each_company = Hash.new(0)
total_in_january = 0
total_for_each_train = Hash.new(0)
max_for_train = 0
unknown_incidents = []
incidents_for_march = 0

incidents.each do |incident|
  total_for_each_company[incident.company_name] += 1
  total_in_january += 1 if incident.incident_date.split('-')[1] == '01'
  total_for_each_train[incident.train_number] += 1
  max_for_train = [total_for_each_train[incident.train_number], max_for_train].max
  if incident.defect_id.to_i == 42
    unknown_incidents << "day: #{incident.incident_date.split('-')[2]} hour: #{incident.incident_time.split(':')[0]}"
  end
  incidents_for_march += 1 if incident.incident_date.split('-')[..1].join('-') == '2022-03'
end

# puts "total_for_each_company #{total_for_each_company}"
puts "total_in_january  #{total_in_january}"
# puts "total_for_each_train #{total_for_each_train}"
puts "max_for_train  #{max_for_train}"
puts "unknown_incidents  #{unknown_incidents}"
puts "incidents_for_march  #{incidents_for_march}"
