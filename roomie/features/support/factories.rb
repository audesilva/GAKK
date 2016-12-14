FactoryGirl.define do
  factory :user, aliases: [:existing_user] do
    email "existing_user@gmail.com"
    password "top secret"
    password_confirmation "top secret"
    confirmed_at Time.now
  end

  factory :unconfirmed_user, :parent => :user do
    email "unconfirmed_user@gmail.com"
    password "top secret"
    password_confirmation "top secret"
    confirmed_at nil
  end

  factory :password_reset_user, :parent => :user do
    email "password_reset_user@gmail.com"
    password "top secret"
    password_confirmation "top secret"
    confirmed_at Time.now
  end

  factory :profile_user, :parent => :user do
        email "profile_user@gmail.com"
        password "top secret"
        password_confirmation "top secret"

        factory :user_with_profile do
          after(:create) do |profile_user|
            create(:profile, user: profile_user)
          end
        end
  end

  factory :profile, class: Profile do
    user_name 'existing-username'
    gender 2
    is_a_smoker 1
    pet_friendly 1
    cleanliness_level 1
    outgoingness_level 1
    quietness_level 1
    has_residence_already 1
    street '120 Broadway'
    city 'New York'
    state 'NY'
    postal_code '10027'
  end


  factory :preferences_user, :parent => :user do
        email "preferences_user@gmail.com"
        password "top secret"
        password_confirmation "top secret"

        factory :user_with_preferences do
          after(:create) do |preferences_user|
            create(:preferences, user: preferences_user)
          end
        end
  end

  factory :preferences, class: Preferences do
    gender 2
    smoker 1
    pet_friendly 1
    cleanliness_level 1
    outgoingness_level 1
    quietness_level 1
    looking_for_residence 1
    street '121 Broadway'
    city 'New York'
    state 'NY'
    postal_code '10027'
  end

  factory :combined_user_1, :parent => :user do
    email "combined_user_1@gmail.com"
    password "top_secret"
    password_confirmation "top_secret"
    
    factory :user_with_both_1 do
      after(:create) do |combined_user_1|
        create(:preferences_for_combined_1, user: combined_user_1)
        create(:profile_for_combined_1, user: combined_user_1)
      end
    end
  end

  factory :preferences_for_combined_1, :parent => :preferences do
    gender 2
    smoker 1
    pet_friendly 1
    cleanliness_level 2
    outgoingness_level 2
    quietness_level 2
    looking_for_residence 1
    street '121 Broadway'
    city 'New York'
    state 'NY'
    postal_code '10027'
  end
  
  factory :profile_for_combined_1, :parent => :profile do
    user_name 'combined-username-1'
    gender 2
    is_a_smoker 1
    pet_friendly 1
    cleanliness_level 1
    outgoingness_level 1
    quietness_level 1
    has_residence_already 0
  end

  factory :combined_user_2, :parent => :user do
    email "combined_user_2@gmail.com"
    password "top_secret"
    password_confirmation "top_secret"
    
    factory :user_with_both_2 do
      after(:create) do |combined_user_2|
        create(:preferences_for_combined_2, user: combined_user_2)
        create(:profile_for_combined_2, user: combined_user_2)
      end
    end
  end

  factory :preferences_for_combined_2, :parent => :preferences do
    gender 2
    smoker 1
    pet_friendly 1
    cleanliness_level 2
    outgoingness_level 2
    quietness_level 2
    looking_for_residence 0
  end
  
  factory :profile_for_combined_2, :parent => :profile do
    user_name 'combined-username-2'
    gender 2
    is_a_smoker 1
    pet_friendly 1
    cleanliness_level 1
    outgoingness_level 1
    quietness_level 1
    has_residence_already 1
    street '120 Broadway'
    city 'New York'
    state 'NY'
    postal_code '10027'
  end

  factory :combined_user_3, :parent => :user do
    email "combined_user_3@gmail.com"
    password "top_secret"
    password_confirmation "top_secret"
    
    factory :user_with_both_3 do
      after(:create) do |combined_user_3|
        create(:preferences_for_combined_3, user: combined_user_3)
        create(:profile_for_combined_3, user: combined_user_3)
      end
    end
  end

  factory :preferences_for_combined_3, :parent => :preferences do
    gender 1
    smoker 2
    pet_friendly 2
    cleanliness_level 5
    outgoingness_level 5
    quietness_level 5
    looking_for_residence 0
  end
  
  factory :profile_for_combined_3, :parent => :profile do
    user_name 'combined-username-3'
    gender 1
    is_a_smoker 2
    pet_friendly 2
    cleanliness_level 5
    outgoingness_level 5
    quietness_level 5
    has_residence_already 1
    street '120 Broadway'
    city 'New York'
    state 'NY'
    postal_code '10027'
  end

  factory :combined_user_4, :parent => :user do
    email "combined_user_4@gmail.com"
    password "top_secret"
    password_confirmation "top_secret"
    
    factory :user_with_both_4 do
      after(:create) do |combined_user_4|
        create(:preferences_for_combined_4, user: combined_user_4)
        create(:profile_for_combined_4, user: combined_user_4)
      end
    end
  end

  factory :preferences_for_combined_4, :parent => :preferences do
    gender 0
    smoker 1
    pet_friendly 2
    cleanliness_level 2
    outgoingness_level 1
    quietness_level 1
    looking_for_residence 0
  end
  
  factory :profile_for_combined_4, :parent => :profile do
    user_name 'combined-username-4'
    gender 2
    is_a_smoker 1
    pet_friendly 1
    cleanliness_level 2
    outgoingness_level 2
    quietness_level 2
    has_residence_already 1
    street '120 Broadway'
    city 'New York'
    state 'NY'
    postal_code '10027'
  end


  factory :admin do
    email "admin@gmail.com"
    password "topsecret"
    password_confirmation "topsecret"
  end
end
