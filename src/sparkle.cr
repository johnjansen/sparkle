require "http/server/context"
require "kilt/slang"
require "./sparkle/*"

# Patch Context so if has Sparkle built in
class HTTP::Server::Context
  def sparkle
    Sparkle::Page.new(self)
  end
end

# An extremely lightweight Content Management System
module Sparkle
  # A data representation of a URL
  class Page
    @content = Hash(String, Array(Glue)).new

    # Creates a Page object for the given Context
    # the Page returned can be queried for its content
    # 
    # i.e.
    #    page = Page.new(env)
    #    page.region("my region")
    def initialize(context : HTTP::Server::Context)

    end

    # the elements from #content for the given region
    # elements are sorted by visual priority
    # TODO memoize the result of sort
    def region(name : String)
      unless (x = @content[name]?).nil?
        x.sort{ |a, b| a.priority <=> b.priority }
      else
        [] of Glue
      end
    end
  end

  # Stick a Content item into a Region on a Page
  class Glue
    def priority : UInt8
      0_u8
    end
  end

  # An area of a Page
  class Region

  end

  # Some editorial Content
  class Content

  end                                                                                                                                             
end