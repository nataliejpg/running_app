class Run < ActiveRecord::Base

    belongs_to :place
    belongs_to :user

    def place_name
        if place
            place.name 
        else
            ""
        end
    end

    def duration_time
        if duration
            hours = duration / 3600
            minutes = (duration%3600)/60
            seconds = (duration%3600)%60
            "#{hours}:#{minutes}:#{seconds}"
        else
            ""
        end
    end

    def duration_time=(timestamp)
        array=timestamp.split(':')
        if array.length ==3
            hours=array[0].to_i
            minutes=array[1].to_i
            seconds=array[2].to_i
        elsif array.length == 2
            hours = 0
            minutes=array[0].to_i
            seconds=array[1].to_i
        end
        self.duration = 3600* hours + 60 * minutes + seconds    
    end

    def pace
        p=(duration/distance).to_i
        p_hours = p / 3600
        p_minutes = (p%3600)/60
        p_seconds = (p%3600)%60
        "#{p_hours}:#{p_minutes}:#{p_seconds}"
    end
end
