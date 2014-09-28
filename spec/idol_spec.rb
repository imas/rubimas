require 'spec_helper'

describe Rubimas::Idol do
  let(:girl) do
    Rubicure::Idol.new(
        human_name:        human_name,
        precure_name:      precure_name,
        extra_names:       extra_names,
        transform_message: transform_message,
        attack_messages:   attack_messages,
    )
  end


end
