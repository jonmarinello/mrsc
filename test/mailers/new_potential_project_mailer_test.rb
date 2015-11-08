require 'test_helper'

class NewPotentialProjectMailerTest < ActionMailer::TestCase
  test 'new_potential_project' do
    new_potential_project = PotentialProject.new(name: 'Jon Marinello', phone: '8057057929', email: 'roger_eaton@gmail.com')
    mail = NewPotentialProjectMailer.new_potential_project new_potential_project
    assert_equal 'New potential project', mail.subject
    assert_equal ['jonmarinello@gmail.com'], mail.to
    assert_equal ['donotreply@mrsc.com'], mail.from
    assert_match /Jon Marinello/, mail.encoded
    assert_match /roger_eaton@gmail.com/, mail.encoded
    assert_match /\(805\) 705-7929/, mail.encoded
  end

end
