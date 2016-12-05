class Match < ApplicationRecord

  def self.create_matches(user)
    if user.preferences != nil && user.profile != nil
      Match.where(user_id_1: user.id).destroy_all
      Profile.all.each do |prof|
        current_user_preferences = User.find(prof.user_id).preferences
        if prof != nil && current_user_preferences != nil
          if user.preferences.user_id == prof.user_id
            next
          end
          percent_match = Match.get_percent_match(user.preferences, prof)
          percent_match_reversed = Match.get_percent_match(current_user_preferences, user.profile)
          if percent_match < 50 || percent_match_reversed < 50
            next
          end
          Match.create(user_id_1: user.id, user_id_2: prof.user_id, percent_match: percent_match, user_name: prof.user_name)
        end
      end
    end
  end

  def self.get_percent_match(pref, prof)
    gender_score = (pref.gender == prof.gender) ? 100 : 0
    smoker_score = (pref.smoker == prof.is_a_smoker) ? 100 : 0
    pet_friendly_score = (pref.pet_friendly == prof.pet_friendly) ? 100 : 0
    cleanliness_level_score   = Match.get_attribute_weight(pref.cleanliness_level, prof.cleanliness_level)
    outgoingness_level_score  = Match.get_attribute_weight(pref.outgoingness_level, prof.outgoingness_level)
    quietness_level_score     = Match.get_attribute_weight(pref.quietness_level, prof.quietness_level)
    current_number_of_attributes = 6
    highest_potential_positive_sum = 100
    scores_sum = cleanliness_level_score + outgoingness_level_score + quietness_level_score + gender_score + smoker_score + pet_friendly_score
    percent_match = 100 * scores_sum / (current_number_of_attributes * highest_potential_positive_sum)
    return percent_match
  end

  def self.get_attribute_weight(value1,value2)
    q = value1-value2
    q = q.abs
    if q == 0
      return 100
    elsif q == 1
      return 75
    elsif q == 2
      return 50
    elsif q == 3
      return 25
    else
      return 0
    end
  end
end
