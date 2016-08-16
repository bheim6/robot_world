require 'yaml/store'
require './app/models/robot'

class RobotWorld
  attr_reader :database

  def initialize(database)
    @database = database
  end

  def create(robot)
    database.transaction do
      database['robots'] ||=[]
      database['total'] ||= 0
      database['total'] += 1
      database['robots'] << { "id" => database['total'], "name" => robot[:name], "city" => robot[:city], "state" => robot[:state], "avatar" => robot[:avatar],
                              "birthdate" => robot[:birthdate], "date_hired" => robot[:date_hired], "department" => robot[:department]}
    end
  end

  def raw_bots
    database.transaction do
      database['robots'] || []
    end
  end

  def all
    raw_bots.map { |data| Robot.new(data) }
  end

  def raw_bot(name)
    raw_bots.find { |robot| robot["name"] == name }
  end

  def find(name)
    Robot.new(raw_bot(name))
  end

  # def update(id, task_data)
  #   database.transaction do
  #     task = database["tasks"].find { |data| data["id"] == id }
  #     task["title"] = task_data[:title]
  #     task["description"] = task_data[:description]
  #   end
  # end
  #
  # def destroy(id)
  #   database.transaction do
  #     database["tasks"].delete_if { |task| task["id"] == id }
  #   end
  # end
end
