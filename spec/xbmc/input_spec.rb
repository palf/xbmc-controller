require 'webmock/rspec'

require 'xbmc/input'

# I do not like these tests. Very dependent on mocks, testing implementation. Bah.

describe XBMC::Input do

  describe '#up' do
    it 'sends an up command through the client' do
      client = mock(XBMC::Client)
      client.should_receive(:send_command).with('Input.Up')
      input = XBMC::Input.new(client)
      input.up()
    end
  end

  describe '#down' do
    it 'sends a down command through the client' do
      client = mock(XBMC::Client)
      client.should_receive(:send_command).with('Input.Down')
      input = XBMC::Input.new(client)
      input.down()
    end
  end

  describe '#left' do
    it 'sends a left command through the client' do
      client = mock(XBMC::Client)
      client.should_receive(:send_command).with('Input.Left')
      input = XBMC::Input.new(client)
      input.left()
    end
  end

  describe '#right' do
    it 'sends a right command through the client' do
      client = mock(XBMC::Client)
      client.should_receive(:send_command).with('Input.Right')
      input = XBMC::Input.new(client)
      input.right()
    end
  end

end
