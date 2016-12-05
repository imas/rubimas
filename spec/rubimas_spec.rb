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
        it { expect( 765.pro.send(name) ).to be_an_instance_of Rubimas::Idol }
        it { expect( 765.pro.send(name).name ).to be_an_instance_of Rubimas::Idol::Name }
        it { expect { 765.pro.send(name).name.full }.not_to raise_error }
      end
    end
  end

  describe 'Idol#find_by_name' do
    context 'can find idol' do
      where(:name, :expected) do
        [
          [ "未来", :mirai],
          [ "最上静香", :shizuka],
          [ "ジュリア", :juria],
          [ "ロコ", :roko],
          [ "エミリー", :emily],
        ]
      end

      with_them do
        it { expect( 765.pro.find_by_name(name).key ).to eq expected }
      end
    end

    context 'cannot find idol' do
      where(:name, :message) do
        [[:kotori, 'unknown idol: kotori'],
         ['春日', 'unknown idol: 春日'],
         [14, 'unknown idol: 14']]
      end

      with_them do
        it { expect { 765.pro.find_by_name(name) }.to raise_error(message) }
      end
    end
  end

  describe 'Idol#name' do
    let(:idol_who_has_aka) { %i(roko emily juria) }

    context 'When her specify name(a.k.a) as the name.' do
      where(:name) { idol_who_has_aka }

      with_them do
        it { expect( 765.pro.send(name).name.to_s ).to eq 765.pro.send(name).name.aka }
      end
    end

    context 'When her fullname as the name.' do
      where(:name) { Rubimas::Idol.names - idol_who_has_aka }

      with_them do
        it { expect( 765.pro.send(name).name.to_s ).to eq 765.pro.send(name).name.full }
      end
    end

    describe 'Idol#name#full' do
      let(:idol_nobody_knows_her_fullname) { %i(juria) }

      context 'When she has her fullname.' do
        where(:name) { Rubimas::Idol.names - idol_nobody_knows_her_fullname }
        with_them do
          it { expect( 765.pro.send(name).name.full ).to eq 765.pro.send(name).name.full }
        end
      end

      context "When nobody knows the idol's fullname." do
        where(:name) { idol_nobody_knows_her_fullname }
        with_them do
          it { expect( 765.pro.send(name).name.full ).to eq 765.pro.send(name).name.aka }
        end
      end
    end
  end
end
