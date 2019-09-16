require 'rails_helper'

RSpec.describe UserHighScore, type: :model do
  describe ".ranking" do
    let!(:taro) { create :user, first_name: 'Taro', last_name: 'Yamada' }
    let!(:jiro) { create :user, first_name: 'Jiro', last_name: 'Tanaka' }
    let!(:hanako) { create :user, first_name: 'Hanako', last_name: 'Yoshida' }
    let!(:no_score_user) { create :user, first_name: 'Score', last_name: 'No' }

    before do
      [
        [taro, 86],
        [hanako, 78],
        [jiro, 93],
        [taro, 81],
        [jiro, 88],
        [hanako, 90],
      ].each do |user, point|
        create :score, user: user, point: point
      end
    end

    it do
      expect(UserHighScore.ranking.map{ |r| [r.name, r.score] }).to eq [
        ['Tanaka Jiro', 93],
        ['Yoshida Hanako', 90],
        ['Yamada Taro', 86],
        ['No Score', nil]
      ]
    end
  end
end
