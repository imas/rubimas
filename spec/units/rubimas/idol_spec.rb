require 'spec_helper'

describe Rubimas::Idol do
  describe '#config' do
    subject { described_class.config }

    specify 'All idol count is 50' do
      expect(subject.keys.count).to eq 50
    end

    context 'when calling `theaterdays!` before config.' do
      before { described_class.theaterdays! }

      specify 'All idol count is 52' do
        expect(subject.keys.count).to eq 52
      end

      after do
        Rubimas::Idol.class_variable_set(:@@theaterdays, false)
        Rubimas::Idol.config(force: true)
      end
    end
  end

  describe '#theaterdays!' do
    it "should change idol's count" do
      expect { Rubimas.find_by_name('紬') }.to raise_error Rubimas::Idol::UnknownIdolError
      expect { Rubimas.find_by_name('歌織') }.to raise_error Rubimas::Idol::UnknownIdolError
      expect(described_class.all.count).to eq 50

      Rubimas.theaterdays!

      expect { Rubimas.find_by_name('紬') }.not_to raise_error
      expect { Rubimas.find_by_name('歌織') }.not_to raise_error
      expect(described_class.all.count).to eq 52
    end

    after do
      Rubimas::Idol.class_variable_set(:@@theaterdays, false)
      Rubimas::Idol.config(force: true)
    end
  end

  describe '#all' do
    subject { described_class.all }

    specify 'Idols are order by id' do
      expect(subject.first.key).to eq :haruka
      expect(subject.last.key).to eq :juria
    end

    context 'when calling `theaterdays!` before config.' do
      before { described_class.theaterdays! }

      specify 'Idols are order by id' do
        expect(subject.first.key).to eq :haruka
        expect(subject.last.key).to eq :kaori
      end

      after do
        Rubimas::Idol.class_variable_set(:@@theaterdays, false)
        Rubimas::Idol.config(force: true)
      end
    end
  end


  describe '#find_by_name' do
    subject { Rubimas::Idol.find_by_name(name) }

    describe 'alternative to find by key.' do
      where(:input_name, :expected_key) do
        [
          ["未来", :mirai],
          ["最上静香", :shizuka],
          ["ジュリア", :juria],
          ["ロコ", :roko],
          ["エミリー", :emily],
        ]
      end

      with_them do
        let(:name) { input_name }
        it { is_expected.to eq Rubimas.send(expected_key) }
      end
    end

    context 'cannot find idol' do
      where(:input_name) do
        [[:kotori], ['春日'], [14]]
      end

      with_them do
        let(:name) { input_name }
        it { expect { subject }.to raise_error(Rubimas::Idol::UnknownIdolError) }
      end
    end
  end

  describe '#name' do
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
