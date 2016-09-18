require 'test_helper'

class MessagesControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get messages_new_url
    assert_response :success
  end

  test "successful post" do 
  	assert_difference 'ActionMailer::Base.deliveries.size', 1 do 
  	post :create, message: {
  		name: 'brandon',
  		email: 'brandon@example.com',
  		subject: 'hello',
  		content: 'text'
  	}
  end
  
  assert_redirected_to new_message_path
  last_email = ActionMailer::Base.deliveries.last

  assert_equal "hi", last_email.subject
  assert_equal 'stephen@example.com', last_email.to[0]
  assert_equal 'cornholio@example.com', last_email.from[0]
  assert_match(/bai/, last_email.body.to_s)

  ActionMailer::Base.deliveries.clear
end

  test "failed post" do
	post :create, message: {\
	    name: '',
	    email: '',
	    subject: '',
	    content: ''
	  }

	[:name, :email, :subject, :content].each do |attr|
	  assert_select 'li', "#{attr.capitalize} can't be blank"
	 end
  end
end