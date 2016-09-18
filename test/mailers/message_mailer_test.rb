require 'test_helper'

class MessageMailerTest < ActionMailer::TestCase
  test "message me" do
    msg = Message.new(
      name: 'brandon',
      email: 'brandon@example.com',
      subject: 'Hi',
      content: 'Hello from the internet'
    )

    email = MessageMailer.message_me(msg).deliver_now

    refute ActionMailer::Base.deliveries.empty?

    assert_equal ['brandon.stevens001@gmail.com'], email.to
    assert_equal ['brandon@example.com'], email.from
    assert_equal 'Hi', email.subject
    assert_equal 'Hello from the internet', email.body.to_s
  end
end
