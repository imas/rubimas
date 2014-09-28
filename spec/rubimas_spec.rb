require 'spec_helper'

describe Rubimas do
  it 'has a version number' do
    expect(Rubimas::VERSION).not_to be nil
  end
  describe "Idol." do
    context "When Idol.#<name>" do
      where(:name) do
        [
          [:haruka],
          [:chihaya],
          [:miki],
          [:yukiho],
          [:yayoi],
          [:makoto],
          [:iori],
          [:takane],
          [:ritsuko],
          [:azusa],
          [:ami],
          [:mami],
          [:hibiki],

          [:mirai],
          [:shizuka],
          [:tsubasa],
          [:kotoha],
          [:erena],
          [:minako],
          [:megumi],
          [:matsuri],
          [:serika],
          [:akane],
          [:anna],
          [:roko],
          [:yuriko],
          [:sayoko],
          [:arisa],
          [:umi],
          [:iku],
          [:tomoka],
          [:emily],
          [:shiho],
          [:ayumu],
          [:hinata],
          [:kana],
          [:nao],
          [:chiduru],
          [:konomi],
          [:tamaki],
          [:fuuka],
          [:miya],
          [:noriko],
          [:mizuki],
          [:karen],
          [:rio],
          [:subaru],
          [:reika],
          [:momoko],
          [:juria],
        ]
      end

      with_them do
        it { expect( Pro765.send(name) ).to be_an_instance_of Rubimas::Idol }
      end
    end
  end
end
