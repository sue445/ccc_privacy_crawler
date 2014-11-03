FactoryGirl.define do
  sequence(:random_int) { rand(1 .. 100000) }

  sequence(:random_str) do
    # via. http://d.hatena.ne.jp/JunMitani/20080214
    a = ('a'..'z').to_a + ('A'..'Z').to_a + ('0'..'9').to_a
    Array.new(10){a[rand(a.size)]}.join
  end

  sequence(:random_ymd) do
    diff_day = 150 - rand(365)
    date = Date.today + diff_day
    date.strftime("%Y/%m/%d")
  end
end
