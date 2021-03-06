#
# Create a beep when this is used
#
module Platform

  class CheckBeep

    #
    # Check if you're running Windows
    #
    def Platform.windows?
      (/cygwin|mswin|mingw|bccwin|wince|emx/ =~ RUBY_PLATFORM) != nil
    end

    #
    # Check if your a apple type of person
    #
    def Platform.mac?
      (/darwin/ =~ RUBY_PLATFORM) != nil
    end

    #
    # Check if your actually know how to use a computer and are running Unix
    #
    def Platform.unix?
      !OS.windows?
    end

    #
    # Or is it Linux..?
    #
    def Platform.linux?
      OS.unix? and not OS.mac?
    end

    def check_platform
      if Platform.windows?
        print "\a"  # Windows beep command
      elsif Platform.mac?
        system('say "beep"')  # Mac beep command
      elsif Platform.unix?
        system('echo -e "\a"')  # Unix and Linux beep command
      else
        system('echo -e "\a"')
      end
    end

  end

end