require 'nokogiri'
require 'open-uri'

require 'rss'

FEED_URL = 'http://feeds.rebuild.fm/rebuildfm'

task :rss => :environment do

  doc = Nokogiri::XML(open(FEED_URL).read)

  count = doc.xpath('//rss//channel//item').count

  Episode.delete_all
  if count == Episode.count
    puts 'No updates.'
  else
    Episode.delete_all
    CastMember.delete_all
    Contribution.delete_all

    members = {}
    episodes = []
    contributions = {}

    doc.xpath('//rss//channel//item').each_with_index {|e, i|
      title = e.xpath('title').first.text
      subtitle = e.xpath('itunes:subtitle').first.text
      link = e.xpath('link').first.text
      description = e.xpath('description').first.text

      episode_no = count - i
      contributions[episode_no] = []

      e.xpath('atom:contributor').each {|e|
        name = e.xpath('atom:name').first.text
        members[e.xpath('atom:name').first.text] = e.xpath('atom:uri').first.text
        contributions[episode_no] << name
      }
      episodes << Episode.new(episode_no: count - i, title: title, link: link, description: description, subtitle: subtitle)
    }

    Episode.import episodes

    CastMember.import members.to_a.map {|name, uri|
      CastMember.new(name: name, url: uri)
    }

    contributions.to_a.each {|episode_no, names|
      ep = Episode.find_by(episode_no: episode_no)
      unless ep == nil
        members = CastMember.where(name: names)
        members.each {|m| Contribution.create(episode: ep, cast_member: m) }
      end
    }

    puts 'Done.'
  end
end
