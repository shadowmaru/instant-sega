require 'hotcocoa'

# Replace the following code with your own hotcocoa code

class Application

  include HotCocoa

  def start
    application :name => "Sega" do |app|
      app.delegate = self
      window(:size => [200, 300], :center => true, :title => "SEGA", :view => :nolayout) do |win|
        win.will_close { exit }

        win.view = layout_view(:layout => {:expand => [:width, :height],
                                           :padding => 0, :margin => 0}) do |vert|
          vert << layout_view(:frame => [0, 0, 0, 40], :mode => :horizontal,
                              :layout => {:padding => 0, :margin => 0,
                                          :start => false, :expand => [:width]}) do |horiz|
            horiz << button(:title => 'SEGA', :layout => {:align => :center}) do |b|
              b.on_action { play_sound }
            end
          end

        end
      end
    end
  end

  def play_sound
    @sounds = ["Sega.wav"]
    if @sounds.empty?
      NSApplication.sharedApplication.terminate(nil)
    else
      sound_file = @sounds.shift
      s = NSSound.alloc.initWithContentsOfFile(sound_file, byReference: false)
      puts "previewing #{sound_file}"
      s.delegate = self
      s.play
    end
  end

  # file/open
  def on_open(menu)
  end

  # file/new
  def on_new(menu)
  end

  # help menu item
  def on_help(menu)
  end

  # This is commented out, so the minimize menu item is disabled
  #def on_minimize(menu)
  #end

  # window/zoom
  def on_zoom(menu)
  end

  # window/bring_all_to_front
  def on_bring_all_to_front(menu)
  end
end

Application.new.start