# encoding: utf-8
class Bubs
  VERSION = '0.0.6'

  # Convert words to ⓌⓄⓇⒹⓈ.
  #
  # Returns a String, but a much cooler string than what you had initially.
  def self.convert(text)
    text.tr('A-Za-z1-90', 'Ⓐ-Ⓩⓐ-ⓩ①-⑨⓪')
  end

  # Copies the text to clipboard
  #
  # ... not in windows xp, tho
  def self.copy(text)
    copycmd = case RUBY_PLATFORM
    when /darwin/
      'pbcopy'
    when /linux/
      'xclip'
    end

    system("powershell -Command '\"#{text}\"' | clip") if RUBY_PLATFORM =~ /mswin/

    copycmd && system("printf \"#{text}\" | #{copycmd}")
  end
end
