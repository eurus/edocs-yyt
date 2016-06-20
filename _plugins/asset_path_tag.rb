module Jekyll
  class AssetPathTag < Liquid::Tag
    @filename = nil

    def initialize(tag_name, markup, tokens)
      #strip leading and trailing quotes
      @filename = markup.strip.gsub(/^("|')|("|')$/, '')
      super
    end

    def render(context)
      if @filename.empty?
        return "Error processing input, expected syntax: {% driver_path [filename] %}"
      end

      base = context.registers[:site].baseurl
      page = context.environments.first["page"]["url"]

      unless /index.+/.match page
        base = base + '../'
      else
        base = base + '../../'
      end

      #fix double slashes
      case File.extname(@filename)
      when '.css'
        path = "#{base}/css/#{@filename}".gsub(/\/{2,}/, '/')
        "<link rel='stylesheet' href='#{path}'/>"
      when '.js'
        path = "#{base}/js/#{@filename}".gsub(/\/{2,}/, '/')
        "<script type='text/javascript' src='#{path}'></script>"
      when '.png', '.jpg', '.gif'
        path = "#{base}/img/#{@filename}".gsub(/\/{2,}/, '/')
        "<img src='#{path}'></img>"
      end
    end
  end
end

Liquid::Template.register_tag('asset_path', Jekyll::AssetPathTag)