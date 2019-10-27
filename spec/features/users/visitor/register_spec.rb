require 'rails_helper'

RSpec.describe "Registering User" do
  xit "creates new user" do

    stub_omniauth

    visit "/"


    click_link 'Login/Register with Google'

    expect(current_path).to eq("/profile")

    user = User.last

    expect(user.email).to eq("mackenzie.halliday@gmail.com")
    expect(user.first_name).to eq("Mackenzie")
    expect(user.last_name).to eq("Halliday")
  end

  def stub_omniauth
    OmniAuth.config.test_mode = true

    OmniAuth.config.mock_auth[:google] = OmniAuth::AuthHash.new(
      { "provider"=>"google_oauth2",
        "uid"=>"102297144359869040270",
        "info"=>
         {"name"=>"Josh Sherwood",
          "email"=>"jkjgsherwood@gmail.com",
          "unverified_email"=>"jkjgsherwood@gmail.com",
          "email_verified"=>true,
          "first_name"=>"Josh",
          "last_name"=>"Sherwood",
          "image"=>"https://lh3.googleusercontent.com/a-/AAuE7mAeNP60p-FPFJE5cYEgnU0eTtC2VnArQgc2R0Db"},
        "credentials"=>
           {"token"=> "ya29.ImOpB_UAhhhZD8NUwTaYfzPo4_zxa2cPNC5sVbGLZj1rC1sz-kW6woUKlpqr1StGwbWQpHKb7gTN1di2erpRMi9QP01zV2
         OH8YICd6jw1M7eMF1KR_b37J6BUmTSByaB1NsmyzE",
            "expires_at"=>1571954540,
            "expires"=>true}
        }
        )
    end
end
