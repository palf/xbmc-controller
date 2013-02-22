module XBMC
  class Method
    class << self
      def from_json(array)
        name = array[0]
        description = array[1]['description']
        params = array[1]['params']
        returns = array[1]['returns']
        type = array[1]['type']
        XBMC::Method.new(name, description, params, returns, type)
      end
    end
  end
end


class XBMC::Method
  attr_reader :group
  attr_reader :command
  attr_reader :description
  attr_reader :params
  attr_reader :returns
  attr_reader :type

  def initialize(name, description, params, returns, type)
    @group, @command = name.split('.')
    @description = description
    @params = params
    @returns = returns
    @type = type
  end

  def required()
    @params.select { |param| param['required'] }
  end

  def to_s
    @command
  end

end
