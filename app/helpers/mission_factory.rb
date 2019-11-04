module MissionFactory
  def brainstorm
    send [:visit, :retrieve, :intent, :rescue].sample
  end

  def visit
    [
      ["take", "bring", "escort", "accompany", "supervise"].sample.capitalize,
      "your",
      Faker::Relationship.familial(connection: "extended").downcase,
      ["to finally see " + location, "to " + location + " before they die", "for a reunion at " + location].sample,
    ].join(" ")
  end

  def retrieve
    [
      ["obtain", "procure", "find", "recover", "invest in", "hire a TV repo family to get back"].sample.capitalize,
      ["a", "the", "your #{Faker::Relationship.familial(connection: "direct").downcase}'s"].sample,
      Faker::Commerce.color,
      Faker::Appliance.equipment.downcase,
      ["made of", "containing no", "brimming with"].sample,
      Faker::Commerce.material.downcase,
      ["for", "to go in"].sample,
      "the",
      Faker::House.room,
    ].join(" ")
  end

  def intent
    [
      Faker::Verb.base.capitalize,
      ["with", "for", "about", "at"].sample,
      Faker::FunnyName.two_word_name,
      "and",
      ["bring them", "share a", "remember fondly", "look forward to", "dangle the promise of"].sample,
      [Faker::Food.dish, Faker::Beer.style].sample,
    ].join(" ")
  end

  def rescue
    [
      ["rescue", "bring home", "extract", "recover", "evacuate"].sample.capitalize,
      ["a", "an", "the", "your"].sample,
      Faker::Demographic.demonym,
      Faker::Military.army_rank,
      "named",
      Faker::TvShows::RuPaul.queen,
      "from",
      ["the clutches of", "the lair of", "an abandoned tunnel belonging to"].sample,
      Faker::DcComics.villain,
    ].join(" ")
  end

  def location
    [Faker::Books::Lovecraft, Faker::TvShows::RickAndMorty,
     Faker::TvShows::StarTrek,
     Faker::TvShows::Simpsons,
     Faker::TvShows::TwinPeaks,
     Faker::TvShows::Friends,
     Faker::Movies::LordOfTheRings,
     Faker::Movies::Hobbit,
     Faker::Movies::HitchhikersGuideToTheGalaxy,
     Faker::Movies::HarryPotter,].sample.send :location
  end
end
