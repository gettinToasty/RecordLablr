module TracksHelper
  include ERB::Util

  def ugly_lyrics(lyrics)
    html = ""
    lyrics.split("\n").each do |line|
      html += "<pre>&#9835 #{h(line)}</pre>"
    end
    html.html_safe
  end

end
