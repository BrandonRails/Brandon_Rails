require 'test_helper'

class MessageTest < ActiveSupport::TestCase
 test "responds to name, email, subject and contact" do 
 	msg = Message.new 
 	[:name, :email, :subject, :content].each do |attr| 
 		assert msg.respond_to? attr
 	end
  end

  test "should accept valid attributes" do 
  	valid_attrs = {
  		name: 'brandon',
  		email: 'brandon@example.com',
  		subject: 'hello',
  		content: 'text'
  	}

  	msg = Message.new valid_attrs

  	assert msg.valid?
  end

  test 'attributes should not be blank' do  
  	msg = Message.new
  	refute msg.valid?
  end
end
