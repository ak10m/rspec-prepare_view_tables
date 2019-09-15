require 'rails_helper'

RSpec.describe User, type: :model do
  describe '#age' do
    using RSpec::Parameterized::TableSyntax

    where(:now, :birthday, :age) do
      "2018-12-31 23:59:59" | "2000-01-01" | 18
      "2019-01-01 00:00:00" | "2000-01-01" | 19
    end

    with_them do
      let(:user) { build :user, birthday: birthday }

      it do
        travel_to(now) { expect(user.age).to eq age }
      end
    end
  end
end
