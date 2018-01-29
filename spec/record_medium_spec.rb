RSpec.describe RecordMedium do
  it 'has a version number' do
    expect(RecordMedium::VERSION).not_to be nil
  end

  context 'base' do
    it 'fails without key' do
      expect { RecordMedium.add }.to raise_error(ArgumentError)
    end
  end

  context 'import' do
    it 'fails without key' do
      expect { RecordMedium::Import.new }.to raise_error(ArgumentError)
    end

    it 'has not found' do
      VCR.use_cassette('import_not_found') do
        action = RecordMedium.add(key: 'xxx', data: [[1, 1, 1]])
        expect(action.response.code).to eq('404')
      end
    end

    it 'success import' do
      VCR.use_cassette('import_ok') do
        action = RecordMedium.add(key: '111', data: [[1, 1, 1]])
        expect(action.response.code).to eq('200')
      end
    end
  end

  context 'export' do
    it 'fails without key' do
      expect { RecordMedium::Export.new(secret: 'x') }.to raise_error(ArgumentError)
    end

    it 'fails without secret' do
      expect { RecordMedium::Export.new(key: 'x') }.to raise_error(ArgumentError)
    end

    it 'has correct url' do
      url = RecordMedium.url(key: 1, timestamp: 1, secret: 1)
      expect(url).to eq('https://recordmedium.com/export/1?timestamp=1&sign=698d51a19d8a121ce581499d7b701668')
    end
  end
end
