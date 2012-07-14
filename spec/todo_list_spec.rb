require 'minitest/autorun'
require './lib/todo_list'
require './lib/todo_item'
require 'pry'

describe TodoList do
	
	before do
		@list = TodoList.new
	end

	describe "when adding a string to a list" do
		it "should be initialized as a TodoItem instance" do
			@list << 'Test String'
			@list.first.class.to_s.must_equal "TodoItem"
		end
		
		it "should be set to a not done state" do
			@list << 'Test String2'
			@list.first.done.must_equal false
		end
	end

	describe "when writing to a file" do
		it "should write the done TodoItems" do
			@list = TodoList.new
			@list << 'A'
			@list << 'B'
			@list << 'C'
			@list[0].done = true
			@list[2].done = true

			@list.write('todo.txt')
			File.open('todo.txt').each_line do |line|
				@list.map(&:name).include?(line.chomp).must_equal true
			end
		end
	end

end