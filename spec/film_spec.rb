require 'rspec'
require_relative '../film'

describe 'Film object' do
  before :all do

    @films = []
    i = 1

    File.readlines("#{__dir__}/fixtures/#{i}.txt").each do |line|
      @films << Film.new(line)
      i += 1
    end
  end

  describe '#new' do
    it "should return array with Film Objects" do
      array = @films.select { |film| film.is_a?(Film)}
      expect(array.sample).to be_a Film
    end

    it "should return Film Title" do
      film = Film.new(["Название фильма", "Режиссер", 1923])
      expect(film.title).to eq "Название фильма"
    end
  end
end