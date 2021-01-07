# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ScoreDecorator do
  let(:score) { Score.new.extend ScoreDecorator }
  subject { score }
  it { should be_a Score }
end
