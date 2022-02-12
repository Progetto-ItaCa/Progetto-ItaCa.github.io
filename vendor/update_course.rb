require 'pathname'
require 'google/apis/youtube_v3'

# Usage:
#   G_API_KEY=XXX ruby vendor/update_course.rb

TEACHERS = [
    nil,
    "Paolo Perrone",
    "Paolo Perrone",
    "Paolo Perrone",
    "Enrico Ghiorzi",
    "Enrico Ghiorzi",
    "Enrico Ghiorzi",
    "Jacopo Emmenegger",
    "Jacopo Emmenegger",
    "Jacopo Emmenegger",
    "Fosco Loregian",
    "Fosco Loregian",
    "Fosco Loregian",
    "Jacopo Emmenegger",
    "Jacopo Emmenegger",
    "Jacopo Emmenegger",
    "Jacopo Emmenegger",
]

PLAYLIST_ID = "PLwOJoZOlTAm-rQUkbmfyDMsLk7-JDy5Vm"

yt = Google::Apis::YoutubeV3::YouTubeService.new
yt.key = ENV.fetch("G_API_KEY")

items = []
page_token = nil
loop do
    result = yt.list_playlist_items(
        "snippet",
        playlist_id: PLAYLIST_ID,
        page_token: page_token,
    )
    items.concat(result.items)
    page_token = result.next_page_token
    break if page_token.nil?
end

items.map! do |item|
    sections = item.snippet.description.scan(/^((?:\d+:){1,2}\d+) (.*)$/)
    sections.map! do |stamp, label|
        seconds = stamp.split(":").inject(0) { |tot, n| tot * 60 + n.to_i }
        {
            stamp: stamp,
            label: label,
            url: "https://www.youtube.com/watch?v=#{item.snippet.resource_id.video_id}&list=#{item.snippet.playlist_id}&index=#{item.snippet.position}&t=#{seconds}s"
        }
    end
    {
        title: item.snippet.title.split("|", 3).last,
        published_at: item.snippet.published_at,
        url: "https://www.youtube.com/watch?v=#{item.snippet.resource_id.video_id}&list=#{item.snippet.playlist_id}&index=#{item.snippet.position}",
        sections: sections,
        position: item.snippet.position,
        teacher: TEACHERS[item.snippet.position],
    }
end

output_file = Pathname.new(__dir__).parent.join("_data/course.json")
output_file.parent.mkpath
output_file.write(JSON.pretty_generate(items))
