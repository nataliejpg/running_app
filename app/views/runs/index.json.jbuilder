json.array!(@runs) do |run|
  json.extract! run, :date, :duration, :distance, :description, :place
  json.url run_url(run, format: :json)
end
