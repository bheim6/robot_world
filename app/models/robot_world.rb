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

  def raw_bot(id)
    raw_bots.find { |robot| robot["id"] == id }
  end

  def find(id)
    Robot.new(raw_bot(id))
  end

  def update(id, robot_data)
    database.transaction do
      robot = database["robots"].find { |data| data["id"] == id }
      robot["name"] = robot_data[:name]
      robot["city"] = robot_data[:city]
      robot["state"] = robot_data[:state]
      robot["avatar"] = robot_data[:avatar]
      robot["birthdate"] = robot_data[:birthdate]
      robot["date_hired"] = robot_data[:date_hired]
      robot["department"] = robot_data[:department]
    end
  end

  def destroy(name)
    database.transaction do
      database["robots"].delete_if { |robot| robot["name"] == name }
    end
  end
end
