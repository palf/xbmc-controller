module XBMC
  class Input
    def initialize(client)
      @client = client
    end

    def up
      @client.send_command('Input.Up')
    end

    def down
      @client.send_command('Input.Down')
    end

    def left
      @client.send_command('Input.Left')
    end

    def right
      @client.send_command('Input.Right')
    end
  end
end
