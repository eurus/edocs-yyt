module Jekyll
  class DriverPathTag < Liquid::Tag
    @drivername = nil

    def initialize(tag_name, markup, tokens)
      #strip leading and trailing quotes
      @drivername = markup.strip.gsub(/^("|')|("|')$/, '')
      super
    end

    def render(context)
      if @drivername.empty?
        return "Error processing input, expected syntax: {% driver_path [filename] %}"
      end

      base = context.registers[:site].baseurl
      page = context.environments.first["page"]["url"]

      base = base + '../'

      #fix double slashes
      path = "#{base}/driver/#{@drivername}.zip".gsub(/\/{2,}/, '/')
      "<a href='#{path}'>#{@drivername}</a>"
    end
  end
end

Liquid::Template.register_tag('driver_path', Jekyll::DriverPathTag)