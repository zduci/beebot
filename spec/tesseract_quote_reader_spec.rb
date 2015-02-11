require_relative '../lib/beebot/tesseract_quote_reader'
require_relative '../lib/beebot/quote'

describe BeeBot::TesseractQuoteReader do
  let(:path) { 'a_quote.png' }
  let(:quote) { BeeBot::Quote.new(path, 'A quote') }
  let(:engine) { double(:engine) }
  let(:text) { 'One original thought is worth a thousand mindless quotings.' }

  it 'reads the text using tesseract' do
    Tesseract::Engine.should_receive(:new).and_return(engine)
    engine.should_receive(:text_for).with(path).and_return(text)
    BeeBot::TesseractQuoteReader.read(quote).should == text
  end
end
