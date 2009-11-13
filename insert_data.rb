#!/usr/bin/ruby

require File.join(File.dirname(__FILE__), "config", "environment")

default_name = "Testi "
default_desc = "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."

action_index = ARGV.find_index("-a") 

if action_index != nil
  action = ARGV[action_index + 1]
end

if action == "add"
  
  n = ARGV.find_index("-n")
  
  if n != nil
    if ARGV[n + 1] != nil and ARGV[n + 1].to_i <= 1000
      for i in (0 .. ARGV[n + 1].to_i) do
        c = Course.new
        c.name = default_name + i.to_s
        c.description = default_desc
        c.save
      end
    end
  end

elsif action == "delete"
  Course.delete_all
else
  print "Usage\n\n"
  print "-a add -n {number}\n"
  print "-a delete\n"
end


  