require 'csv'
require 'awesome_print'

def get_all_olympic_athletes(filename)
  dataset = CSV.read(filename, headers: true).map do |athlete|
    {
        "ID" => athlete["ID"],
        "Name" => athlete["Name"],
        "Height" => athlete["Height"],
        "Team" => athlete["Team"],
        "Year" => athlete["Year"],
        "City" => athlete["City"],
        "Sport" => athlete["Sport"],
        "Event" => athlete["Event"],
        "Medal" => athlete["Medal"]
    }
  end

  return dataset
end

def total_medals_per_team(olympic_data)
  medals_count = {}

  olympic_data.each do |athlete|
    if athlete["Medal"] != "NA"
      # if team has not been counted yet
      if medals_count[athlete["Team"]].nil?
        medals_count[athlete["Team"]] = 1
      else
        medals_count[athlete["Team"]] += 1
      end
    end
  end

  return medals_count
end

def get_all_gold_medalists(olympic_data)
  gold_medalists = olympic_data.filter { |athlete| athlete["Medal"] == "Gold" }

  return gold_medalists
end