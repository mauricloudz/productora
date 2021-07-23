class Group < ApplicationRecord
    has_many :concerts, dependent: :destroy

    enum group_type: ['Men','Women','Band']
    def totalAttendance
        self.concerts.map { |concert| concert.attendance }.sum
    end

    def concertThisMonth
        count = 0
        self.concerts.map do |concert|
            if concert.date.month == Time.now.month
                count += 1
            end
        end
        count
    end

    def lastConcert
        last = self.concerts.map { |c| c.date }.max
        if last
            lastWritten = last.strftime('%Y-%B-%A')
            "#{lastWritten}"
        end
    end

    def maxAttendance
        self.concerts.map { |c| c.attendance }.max
    end

    def longestConcert
        self.concerts.map { |c| c.duration }.max
    end
end
