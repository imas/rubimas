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
        it { expect( Pro765.send(name).name ).to be_an_instance_of Rubimas::Idol::Name }
        it { expect { Pro765.send(name).name.full }.not_to raise_error }
      end
    end
  end

  describe 'Idol#name' do
    let(:idol_who_has_aka) { %i(roko emily juria) }

    context 'When her specify name(a.k.a) as the name.' do
      where(:name) { idol_who_has_aka }

      with_them do
        it { expect( Pro765.send(name).name.to_s ).to eq Pro765.send(name).name.aka }
      end
    end

    context 'When her fullname as the name.' do
      where(:name) { Rubimas::Idol.names - idol_who_has_aka }

      with_them do
        it { expect( Pro765.send(name).name.to_s ).to eq Pro765.send(name).name.full }
      end
    end
  end
end
