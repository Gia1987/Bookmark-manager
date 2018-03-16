require 'link'
describe Link do
  describe '.all' do
    it 'returns all links, wraped in link instances' do
      links = Link.all
      # map the links to urls
      urls = links.map(&:url)

      expect(urls).to include('http://www.makersacademy.com')
      expect(urls).to include('http://www.facebook.com')
      expect(urls).to include('http://www.google.com')
    end
  end

  describe '.add' do
    it 'add new link' do
      Link.add('http://www.test.com', 'test')
      links = Link.all
      title = links.map(&:title)
      urls = links.map(&:url)
      expect(urls).to include('http://www.test.com')
      expect(title).to include('test')
    end
  end
end
