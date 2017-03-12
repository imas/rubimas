require 'spec_helper'

describe 'Supported 765 Production idols.' do
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
      it { expect( 765.pro.send(name) ).to be_an_instance_of Rubimas::Idol }
      it { expect( 765.pro.send(name).name ).to be_an_instance_of Rubimas::Idol::Name }
      it { expect { 765.pro.send(name).name.full }.not_to raise_error }
    end
  end
end
